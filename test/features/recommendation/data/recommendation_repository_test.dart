import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/recommendation/data/dto/recommendation_exclusion_list_response.dart';
import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:geti_app/features/recommendation/data/recommendation_repository.dart';

void main() {
  test('RecommendationListResponse parses status and pagination metadata', () {
    for (final status in [
      'DISABLED',
      'GENERATING',
      'FAILED',
      'EMPTY',
      'READY',
    ]) {
      final response = ApiResponseRecommendationListResponse.fromJson(
        _responseJson(status: status, content: const []),
      );

      expect(response.success, isTrue);
      expect(response.data!.status, status);
      expect(response.data!.generatedAt, isNull);
      expect(response.data!.nextGenerationAt, isNull);
      expect(response.data!.page, 0);
      expect(response.data!.size, 20);
      expect(response.data!.totalElements, 0);
      expect(response.data!.totalPages, 0);
      expect(response.data!.first, isTrue);
      expect(response.data!.last, isTrue);
    }
  });

  test(
    'READY response parses content, reasons, suitability, and bookmarked',
    () {
      final response = ApiResponseRecommendationListResponse.fromJson(
        _responseJson(status: 'READY', content: [_recommendationItemJson()]),
      );
      final item = response.data!.content.single;

      expect(item.recommendationId, 7);
      expect(item.score, 92);
      expect(item.suitabilityLevel, 'HIGHLY_RECOMMENDED');
      expect(item.rank, 1);
      expect(item.generatedAt, DateTime.parse('2026-09-02T09:00:00Z'));
      expect(item.reasons.single.type, 'REQUIRED_SKILL_MATCH');
      expect(item.reasons.single.matchedCount, 2);
      expect(item.reasons.single.totalCount, 3);
      expect(item.job.jobId, 99);
      expect(item.job.title, 'Backend Engineer');
      expect(item.job.company!.name, 'GETI');
      expect(item.job.techStacks.map((techStack) => techStack.name), [
        'Dart',
        'Flutter',
      ]);
      expect(item.job.bookmarked, isTrue);
    },
  );

  test(
    'repository calls GET recommendations with default page and size',
    () async {
      final client = _FakeRestClient(
        response: ApiResponseRecommendationListResponse(
          success: true,
          data: _recommendationList(status: 'EMPTY'),
        ),
      );
      final repository = RecommendationRepository(client);

      final response = await repository.getMyRecommendations();

      expect(response.status, 'EMPTY');
      expect(client.page, 0);
      expect(client.size, 20);
      expect(client.suitabilityLevel, isNull);
    },
  );

  test('repository forwards API errors', () async {
    final repository = RecommendationRepository(
      _FakeRestClient(error: DioException(requestOptions: RequestOptions())),
    );

    expect(
      repository.getMyRecommendations,
      throwsA(isA<RecommendationRepositoryException>()),
    );
  });

  test('관심 없음 목록 응답의 항목과 페이지 정보를 파싱한다', () {
    final response = ApiResponseRecommendationExclusionListResponse.fromJson(
      _exclusionResponseJson(
        content: [
          _exclusionItemJson(id: 31, type: 'THIS_JOB'),
          _exclusionItemJson(id: 32, type: 'SIMILAR_JOBS', company: null),
        ],
      ),
    );
    final data = response.data!;

    expect(response.success, isTrue);
    expect(data.content.length, 2);
    expect(data.content.first.exclusionId, 31);
    expect(data.content.first.job.jobId, 99);
    expect(data.content.first.exclusionType, 'THIS_JOB');
    expect(data.content.last.exclusionType, 'SIMILAR_JOBS');
    expect(data.content.last.job.company, isNull);
    expect(
      data.content.first.createdAt,
      DateTime.parse('2026-09-03T09:00:00Z'),
    );
    expect(data.page, 0);
    expect(data.size, 20);
    expect(data.totalElements, 2);
    expect(data.totalPages, 1);
    expect(data.first, isTrue);
    expect(data.last, isTrue);
  });

  test('관심 없음 빈 목록을 정상 응답으로 파싱한다', () {
    final response = ApiResponseRecommendationExclusionListResponse.fromJson(
      _exclusionResponseJson(content: const []),
    );

    expect(response.data!.content, isEmpty);
    expect(response.data!.totalElements, 0);
    expect(response.data!.totalPages, 0);
  });

  test('RestClient는 관심 없음 목록 GET 경로와 Query를 구성한다', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
    final adapter = _RecordingAdapter();
    dio.httpClientAdapter = adapter;
    addTearDown(dio.close);

    await RestClient(
      dio,
    ).getRecommendationExclusions(exclusionType: 'THIS_JOB', page: 2, size: 30);

    expect(adapter.request?.method, 'GET');
    expect(adapter.request?.path, '/api/v1/me/recommendation-exclusions');
    expect(adapter.request?.queryParameters, {
      'exclusionType': 'THIS_JOB',
      'page': 2,
      'size': 30,
    });
  });

  test('repository는 관심 없음 목록 기본 Query를 전달한다', () async {
    final client = _FakeRestClient(
      exclusionResponse: _emptyExclusionApiResponse(),
    );
    final repository = RecommendationRepository(client);

    final response = await repository.getRecommendationExclusions();

    expect(response.content, isEmpty);
    expect(client.exclusionType, isNull);
    expect(client.exclusionPage, 0);
    expect(client.exclusionSize, 20);
  });

  for (final type in ['THIS_JOB', 'SIMILAR_JOBS']) {
    test('repository는 $type 필터 Query를 전달한다', () async {
      final client = _FakeRestClient(
        exclusionResponse: _emptyExclusionApiResponse(),
      );
      final repository = RecommendationRepository(client);

      await repository.getRecommendationExclusions(exclusionType: type);

      expect(client.exclusionType, type);
    });
  }

  test('repository는 관심 없음 목록 API 오류를 전달한다', () {
    final repository = RecommendationRepository(
      _FakeRestClient(
        exclusionError: DioException(requestOptions: RequestOptions()),
      ),
    );

    expect(
      repository.getRecommendationExclusions,
      throwsA(isA<RecommendationRepositoryException>()),
    );
  });
}

Map<String, dynamic> _responseJson({
  required String status,
  required List<Map<String, dynamic>> content,
}) {
  return {
    'success': true,
    'data': {
      'enabled': status != 'DISABLED',
      'status': status,
      'generatedAt': null,
      'nextGenerationAt': null,
      'content': content,
      'page': 0,
      'size': 20,
      'totalElements': content.length,
      'totalPages': content.isEmpty ? 0 : 1,
      'first': true,
      'last': true,
    },
    'meta': {'requestId': 'test'},
  };
}

Map<String, dynamic> _recommendationItemJson() {
  return {
    'recommendationId': 7,
    'job': {
      'jobId': 99,
      'title': 'Backend Engineer',
      'postingType': 'GENERAL',
      'applicationMethod': 'INTERNAL',
      'status': 'PUBLISHED',
      'company': {'companyId': 1, 'name': 'GETI', 'logoUrl': null},
      'endDate': null,
      'viewCount': 10,
      'bookmarked': true,
      'techStacks': [
        {'techStackId': 1, 'name': 'Dart'},
        {'techStackId': 2, 'name': 'Flutter'},
      ],
      'bookmarkCount': 3,
    },
    'score': 92,
    'suitabilityLevel': 'HIGHLY_RECOMMENDED',
    'rank': 1,
    'reasons': [
      {'type': 'REQUIRED_SKILL_MATCH', 'matchedCount': 2, 'totalCount': 3},
    ],
    'generatedAt': '2026-09-02T09:00:00Z',
  };
}

Map<String, dynamic> _exclusionResponseJson({
  required List<Map<String, dynamic>> content,
}) {
  return {
    'success': true,
    'data': {
      'content': content,
      'page': 0,
      'size': 20,
      'totalElements': content.length,
      'totalPages': content.isEmpty ? 0 : 1,
      'first': true,
      'last': true,
    },
    'meta': {'requestId': 'test'},
  };
}

Map<String, dynamic> _exclusionItemJson({
  required int id,
  required String type,
  Object? company = const {'companyId': 1, 'name': 'GETI', 'logoUrl': null},
}) {
  final job = Map<String, dynamic>.from(
    _recommendationItemJson()['job']! as Map<String, dynamic>,
  );
  job['company'] = company;
  return {
    'exclusionId': id,
    'job': job,
    'exclusionType': type,
    'createdAt': '2026-09-03T09:00:00Z',
  };
}

RecommendationListResponse _recommendationList({required String status}) {
  return RecommendationListResponse(
    enabled: status != 'DISABLED',
    status: status,
    generatedAt: null,
    nextGenerationAt: null,
    content: const [],
    page: 0,
    size: 20,
    totalElements: 0,
    totalPages: 0,
    first: true,
    last: true,
  );
}

ApiResponseRecommendationExclusionListResponse _emptyExclusionApiResponse() {
  return const ApiResponseRecommendationExclusionListResponse(
    success: true,
    data: RecommendationExclusionListResponse(
      content: [],
      page: 0,
      size: 20,
      totalElements: 0,
      totalPages: 0,
      first: true,
      last: true,
    ),
  );
}

class _FakeRestClient implements RestClient {
  _FakeRestClient({
    this.response,
    this.exclusionResponse,
    this.error,
    this.exclusionError,
  });

  final ApiResponseRecommendationListResponse? response;
  final ApiResponseRecommendationExclusionListResponse? exclusionResponse;
  final Object? error;
  final Object? exclusionError;
  String? suitabilityLevel;
  int? page;
  int? size;
  String? exclusionType;
  int? exclusionPage;
  int? exclusionSize;

  @override
  Future<ApiResponseRecommendationListResponse> getMyRecommendations({
    String? suitabilityLevel,
    int page = 0,
    int size = 20,
  }) async {
    this.suitabilityLevel = suitabilityLevel;
    this.page = page;
    this.size = size;
    final error = this.error;
    if (error != null) throw error;
    return response!;
  }

  @override
  Future<ApiResponseRecommendationExclusionListResponse>
  getRecommendationExclusions({
    String? exclusionType,
    int page = 0,
    int size = 20,
  }) async {
    this.exclusionType = exclusionType;
    exclusionPage = page;
    exclusionSize = size;
    final error = exclusionError;
    if (error != null) throw error;
    return exclusionResponse!;
  }
}

class _RecordingAdapter implements HttpClientAdapter {
  RequestOptions? request;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    return ResponseBody.fromString(
      jsonEncode(_exclusionResponseJson(content: const [])),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
