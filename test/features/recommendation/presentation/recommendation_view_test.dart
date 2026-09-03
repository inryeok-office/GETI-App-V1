import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:geti_app/features/recommendation/data/recommendation_repository.dart';
import 'package:geti_app/features/recommendation/presentation/view/recommendation_view.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/suitability_level.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('추천 적합도는 SUITABILITY_LEVEL 5단계만 지원한다', () {
    expect(SuitabilityLevel.values, [
      SuitabilityLevel.veryUnsuitable,
      SuitabilityLevel.unsuitable,
      SuitabilityLevel.normal,
      SuitabilityLevel.recommended,
      SuitabilityLevel.highlyRecommended,
    ]);
    expect(SuitabilityLevel.values.map((level) => level.figmaLabel).toList(), [
      null,
      '부적합',
      null,
      '적합',
      '매우 적합',
    ]);
    expect(
      suitabilityLevelFromApi('VERY_UNSUITABLE'),
      SuitabilityLevel.veryUnsuitable,
    );
    expect(suitabilityLevelFromApi('UNSUITABLE'), SuitabilityLevel.unsuitable);
    expect(suitabilityLevelFromApi('NORMAL'), SuitabilityLevel.normal);
    expect(
      suitabilityLevelFromApi('RECOMMENDED'),
      SuitabilityLevel.recommended,
    );
    expect(
      suitabilityLevelFromApi('HIGHLY_RECOMMENDED'),
      SuitabilityLevel.highlyRecommended,
    );
  });

  test('추천 생성 액션은 생성 중 상태로 전환한다', () {
    final container = _containerFor(status: 'EMPTY');
    addTearDown(container.dispose);

    container.read(recommendationViewModelProvider.notifier).startGeneration();

    expect(
      container.read(recommendationViewModelProvider).status,
      RecommendationStatus.generating,
    );
  });

  test('서버 status는 content 비어 있음 여부가 아니라 status 값으로 매핑한다', () async {
    final cases = {
      'DISABLED': RecommendationStatus.disabled,
      'GENERATING': RecommendationStatus.generating,
      'FAILED': RecommendationStatus.failure,
      'EMPTY': RecommendationStatus.empty,
      'READY': RecommendationStatus.loaded,
    };

    for (final entry in cases.entries) {
      final container = _containerFor(status: entry.key);
      addTearDown(container.dispose);

      await container.read(recommendationViewModelProvider.notifier).retry();
      final state = container.read(recommendationViewModelProvider);

      expect(state.status, entry.value);
      expect(state.serverStatus, entry.key);
      expect(state.page, 0);
      expect(state.size, 20);
      expect(state.first, isTrue);
      expect(state.last, isTrue);
    }
  });

  test(
    'READY response maps to existing recommendation card model safely',
    () async {
      final container = _containerFor(
        status: 'READY',
        content: [_recommendationItem()],
      );
      addTearDown(container.dispose);

      await container.read(recommendationViewModelProvider.notifier).retry();
      final state = container.read(recommendationViewModelProvider);
      final job = state.jobs.single;

      expect(state.status, RecommendationStatus.loaded);
      expect(job.companyName, 'GETI');
      expect(job.positionName, 'Backend Engineer');
      expect(job.summary, isNull);
      expect(job.matchReason, isNull);
      expect(job.tags, ['Dart', 'Flutter']);
      expect(job.availability, RecommendationJobAvailability.active);
      expect(job.suitabilityLevel, SuitabilityLevel.highlyRecommended);
      expect(state.bookmarkedJobs.contains(job), isTrue);
      expect(state.totalElements, 1);
      expect(state.totalPages, 1);
    },
  );

  test('API error maps to existing failure state', () async {
    final container = _containerForError();
    addTearDown(container.dispose);

    await container.read(recommendationViewModelProvider.notifier).retry();

    expect(
      container.read(recommendationViewModelProvider).status,
      RecommendationStatus.failure,
    );
  });

  testWidgets('추천 결과 없음 상태를 표시한다', (tester) async {
    await _pumpState(tester, RecommendationStatus.empty);

    expect(find.text('추천 공고가 없습니다.'), findsOneWidget);
    expect(find.text('프로필 관리하기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('추천 생성 전 상태에서 생성 액션을 실행한다', (tester) async {
    var generated = false;
    await _pumpState(
      tester,
      RecommendationStatus.beforeGeneration,
      onGenerate: () => generated = true,
    );

    await tester.tap(find.text('추천 생성하기'));

    expect(generated, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('추천 생성 중 상태를 표시한다', (tester) async {
    await _pumpState(tester, RecommendationStatus.generating);

    expect(
      find.byKey(const ValueKey('recommendation-loading-spinner')),
      findsOneWidget,
    );
    expect(find.text('추천 공고를 생성하고 있습니다.'), findsOneWidget);
    expect(find.textContaining('잠시만 기다려 주세요.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('추천 생성 실패 상태에서 재시도를 실행한다', (tester) async {
    var retried = false;
    await _pumpState(
      tester,
      RecommendationStatus.failure,
      onRetry: () => retried = true,
    );

    await tester.tap(find.text('다시 시도'));

    expect(retried, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감 및 접근 불가 Job Card를 표시한다', (tester) async {
    const jobs = [
      RecommendationJob(
        companyName: '네이버클라우드',
        positionName: 'Cloud Platform Engineer',
        summary: '분당 · 정규직 · D-18',
        tags: ['React', 'TypeScript'],
        availability: RecommendationJobAvailability.closed,
      ),
      RecommendationJob(
        companyName: '네이버클라우드',
        positionName: 'Cloud Platform Engineer',
        summary: '분당 · 정규직 · D-18',
        tags: [],
        availability: RecommendationJobAvailability.unavailable,
      ),
    ];

    await _pumpBody(
      tester,
      const RecommendationViewState(
        status: RecommendationStatus.loaded,
        jobs: jobs,
      ),
    );

    expect(
      find.text('마감된 공고입니다.\n지원 기간이 종료되어 더이상 지원할 수 없습니다.'),
      findsOneWidget,
    );
    expect(find.text('삭제 또는 비공개 처리되어 더이상 접근할 수 없습니다.'), findsOneWidget);
    expect(find.text('공고 보기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Figma 근거가 있는 추천 적합도 문구만 표시한다', (tester) async {
    const jobs = [
      RecommendationJob(
        companyName: '회사 A',
        positionName: '매우 추천 공고',
        summary: '서울 · 정규직 · D-10',
        tags: [],
        availability: RecommendationJobAvailability.active,
        suitabilityLevel: SuitabilityLevel.highlyRecommended,
      ),
      RecommendationJob(
        companyName: '회사 B',
        positionName: '추천 공고',
        summary: '서울 · 정규직 · D-10',
        tags: [],
        availability: RecommendationJobAvailability.active,
        suitabilityLevel: SuitabilityLevel.recommended,
      ),
      RecommendationJob(
        companyName: '회사 C',
        positionName: '비추천 공고',
        summary: '서울 · 정규직 · D-10',
        tags: [],
        availability: RecommendationJobAvailability.active,
        suitabilityLevel: SuitabilityLevel.unsuitable,
      ),
    ];

    await _pumpBody(
      tester,
      const RecommendationViewState(
        status: RecommendationStatus.loaded,
        jobs: jobs,
      ),
    );

    expect(find.text('매우 적합'), findsOneWidget);
    expect(find.text('적합'), findsOneWidget);
    expect(find.text('부적합'), findsOneWidget);
    expect(find.text('매우 부적합'), findsNothing);
    expect(find.text('보통'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}

ProviderContainer _containerFor({
  required String status,
  List<RecommendationItemResponse> content = const [],
}) {
  return ProviderContainer(
    overrides: [
      recommendationRepositoryProvider.overrideWithValue(
        RecommendationRepository(
          _FakeRestClient(
            response: ApiResponseRecommendationListResponse(
              success: true,
              data: _recommendationList(status: status, content: content),
            ),
          ),
        ),
      ),
    ],
  );
}

ProviderContainer _containerForError() {
  return ProviderContainer(
    overrides: [
      recommendationRepositoryProvider.overrideWithValue(
        RecommendationRepository(_FakeRestClient(error: Exception('network'))),
      ),
    ],
  );
}

RecommendationListResponse _recommendationList({
  required String status,
  required List<RecommendationItemResponse> content,
}) {
  return RecommendationListResponse(
    enabled: status != 'DISABLED',
    status: status,
    generatedAt: null,
    nextGenerationAt: null,
    content: content,
    page: 0,
    size: 20,
    totalElements: content.length,
    totalPages: content.isEmpty ? 0 : 1,
    first: true,
    last: true,
  );
}

RecommendationItemResponse _recommendationItem() {
  return RecommendationItemResponse(
    recommendationId: 1,
    job: const RecommendationJobResponse(
      jobId: 10,
      title: 'Backend Engineer',
      postingType: 'GENERAL',
      applicationMethod: 'INTERNAL',
      status: 'PUBLISHED',
      company: RecommendationCompanySummaryResponse(
        companyId: 1,
        name: 'GETI',
        logoUrl: null,
      ),
      endDate: null,
      viewCount: 12,
      bookmarked: true,
      techStacks: [
        RecommendationTechStackResponse(techStackId: 1, name: 'Dart'),
        RecommendationTechStackResponse(techStackId: 2, name: 'Flutter'),
      ],
      bookmarkCount: 3,
    ),
    score: 93,
    suitabilityLevel: 'HIGHLY_RECOMMENDED',
    rank: 1,
    reasons: const [
      RecommendationReasonResponse(
        type: 'REQUIRED_SKILL_MATCH',
        matchedCount: 2,
        totalCount: 3,
      ),
    ],
    generatedAt: DateTime.utc(2026, 9, 2, 9),
  );
}

class _FakeRestClient implements RestClient {
  _FakeRestClient({this.response, this.error});

  final ApiResponseRecommendationListResponse? response;
  final Object? error;

  @override
  Future<ApiResponseRecommendationListResponse> getMyRecommendations({
    String? suitabilityLevel,
    int page = 0,
    int size = 20,
  }) async {
    final error = this.error;
    if (error != null) throw error;
    return response!;
  }
}

Future<void> _pumpState(
  WidgetTester tester,
  RecommendationStatus status, {
  VoidCallback? onGenerate,
  VoidCallback? onRetry,
}) {
  return _pumpBody(
    tester,
    RecommendationViewState(status: status),
    onGenerate: onGenerate,
    onRetry: onRetry,
  );
}

Future<void> _pumpBody(
  WidgetTester tester,
  RecommendationViewState state, {
  VoidCallback? onGenerate,
  VoidCallback? onRetry,
}) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: RecommendationScreenBody(
            state: state,
            onGenerate: onGenerate ?? () {},
            onRetry: onRetry ?? () {},
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}
