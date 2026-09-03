import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
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

class _FakeRestClient implements RestClient {
  _FakeRestClient({this.response, this.error});

  final ApiResponseRecommendationListResponse? response;
  final Object? error;
  String? suitabilityLevel;
  int? page;
  int? size;

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
}
