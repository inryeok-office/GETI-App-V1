import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/company/presentation/view/company_detail_view.dart';
import 'package:geti_app/features/company/presentation/view/company_view.dart';
import 'package:geti_app/features/job/data/dto/ai_reanalysis_response.dart';
import 'package:geti_app/features/job/data/dto/job_detail_response.dart';
import 'package:geti_app/features/job/data/dto/job_search_response.dart';
import 'package:geti_app/features/job/data/dto/job_source_response.dart';
import 'package:geti_app/features/job/data/dto/recommendation_job_response.dart';
import 'package:geti_app/features/job/data/job_repository.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:go_router/go_router.dart';

const _companyEligible = JobEligibilitySnapshotDto(
  canApply: true,
  eligibilityReason: 'AVAILABLE',
  eligibilityMessage: '지원 가능한 공고입니다.',
);

class _FakeJobRepository implements JobRepository {
  final List<JobSummaryResponse> jobs = [
    JobSummaryResponse(
      jobId: 1,
      title: '2026 AI 서비스 개발 인턴십 참가자 모집',
      postingType: 'GENERAL',
      applicationMethod: 'EXTERNAL',
      status: 'PUBLISHED',
      company: const CompanySummaryDto(companyId: 1, name: '네이버클라우드'),
      application: _companyEligible,
    ),
    JobSummaryResponse(
      jobId: 2,
      title: '웹 프론트엔드 주니어 개발자 채용',
      postingType: 'GENERAL',
      applicationMethod: 'EXTERNAL',
      status: 'CLOSED',
      company: const CompanySummaryDto(companyId: 2, name: '우아한형제들'),
      application: _companyEligible,
    ),
  ];

  @override
  Future<JobSearchResponse> searchJobs({
    String? query,
    String? postingType,
    String? applicationMethod,
    String? sourceName,
    String? sort,
    String? direction,
    int page = 0,
    int size = 20,
  }) async => JobSearchResponse(
    content: jobs,
    page: 0,
    size: size,
    totalElements: jobs.length,
    totalPages: 1,
    first: true,
    last: true,
  );

  @override
  Future<JobDetailResponse> getJobDetail(int jobId) {
    throw UnimplementedError();
  }

  @override
  Future<List<PublicJobSourceResponse>> getJobSources({
    bool activeOnly = false,
  }) async => [];

  final List<int> addBookmarkCalls = [];
  final List<int> removeBookmarkCalls = [];

  @override
  Future<void> addBookmark(int jobId) async {
    addBookmarkCalls.add(jobId);
  }

  @override
  Future<void> removeBookmark(int jobId) async {
    removeBookmarkCalls.add(jobId);
  }

  @override
  Future<RecommendationJobListResponse> getJobBookmarks({
    String? query,
    String? postingType,
    String? sort,
    int page = 0,
    int size = 20,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<AiReanalysisResponse> requestAiReanalysis(int jobId) {
    throw UnimplementedError();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('기업 목록이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/companies');

    expect(find.text('기업 정보'), findsAtLeastNWidgets(1));
    expect(find.text('네이버클라우드'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색어로 기업을 필터링할 수 있다', (tester) async {
    await _pumpRoute(tester, '/companies');

    await tester.enterText(
      find.byKey(const ValueKey('company-search-field')),
      '카카',
    );
    await tester.pumpAndSettle();

    expect(find.text('카카오'), findsOneWidget);
    expect(find.text('네이버클라우드'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색 결과가 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies');

    await tester.enterText(
      find.byKey(const ValueKey('company-search-field')),
      '존재하지 않는 기업',
    );
    await tester.pumpAndSettle();

    expect(find.text('검색 결과가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 유형 필터로 목록을 좁힐 수 있다', (tester) async {
    await _pumpRoute(tester, '/companies');

    expect(find.text('기업 유형 전체'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('company-type-filter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('company-type-option-대기업')));
    await tester.pumpAndSettle();

    expect(find.text('기업 유형 대기업'), findsOneWidget);
    expect(find.text('네이버클라우드'), findsOneWidget);
    expect(find.text('카카오'), findsOneWidget);
    expect(find.text('우아한형제들'), findsNothing);
    expect(find.text('한국전력공사'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 유형 필터와 검색어를 함께 적용하면 결과가 없을 수 있다', (tester) async {
    await _pumpRoute(tester, '/companies');

    await tester.tap(find.byKey(const ValueKey('company-type-filter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('company-type-option-공기업')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const ValueKey('company-search-field')),
      '카카',
    );
    await tester.pumpAndSettle();

    expect(find.text('검색 결과가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('목록에서 채용 중인 공고가 있는 기업은 개수가 표시되고, 탭하면 상세로 이동한다', (tester) async {
    await _pumpRoute(tester, '/companies');

    expect(find.text('1개'), findsAtLeastNWidgets(1));

    await tester.tap(find.text('네이버클라우드'));
    await tester.pumpAndSettle();

    expect(find.text('기업 상세'), findsOneWidget);
    expect(find.text('IT 서비스'), findsOneWidget);
    expect(find.text('채용 공고 1'), findsOneWidget);
    expect(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('채용 중인 공고가 없는 기업은 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies/kakao');

    expect(find.text('채용 공고 0'), findsOneWidget);
    expect(find.text('현재 채용 중인 공고가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감된 공고만 있는 기업은 목록 카드와 상세 모두 채용 공고 0으로 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies');

    // 우아한형제들의 유일한 공고(woowa-frontend)는 마감된 공고이므로 목록
    // 카드의 "채용 중인 공고"는 0개여야 합니다.
    final woowaCard = find.ancestor(
      of: find.text('우아한형제들'),
      matching: find.byType(InkWell),
    );
    expect(
      find.descendant(of: woowaCard, matching: find.text('0개')),
      findsOneWidget,
    );

    await tester.tap(find.text('우아한형제들'));
    await tester.pumpAndSettle();

    expect(find.text('채용 공고 0'), findsOneWidget);
    expect(find.text('현재 채용 중인 공고가 없습니다.'), findsOneWidget);
    expect(find.text('서비스 프론트엔드 개발'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Figma대로 검색은 기업명만 대상으로 하며 공고 제목으로는 매칭되지 않는다', (tester) async {
    await _pumpRoute(tester, '/companies');

    // 네이버클라우드의 공고 제목("2026 AI 서비스 개발 인턴십 참가자 모집")으로
    // 검색해도 기업명이 아니므로 결과에 나오지 않아야 합니다. Figma
    // 기업 목록(500:3572) 검색창의 실제 placeholder는 "기업명으로 검색해
    // 보세요."로, 기업명 검색만 정의되어 있습니다.
    await tester.enterText(
      find.byKey(const ValueKey('company-search-field')),
      'AI 서비스 개발',
    );
    await tester.pumpAndSettle();

    expect(find.text('검색 결과가 없습니다.'), findsOneWidget);
    expect(find.text('네이버클라우드'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 상세의 채용 공고를 탭하면 실제 채용 공고 상세로 이동한다', (tester) async {
    await _pumpRoute(tester, '/companies/naver-cloud');

    await tester.ensureVisible(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'));
    await tester.tap(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'));
    await tester.pumpAndSettle();

    expect(find.text('공고 상세'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 상세에서 공고를 북마크하면 실제 API가 호출되고 아이콘이 갱신된다', (tester) async {
    final repository = _FakeJobRepository();
    // 공고 목록 화면을 거치지 않고 기업 상세로 바로 진입한 상황을
    // 재현합니다(jobViewModelProvider의 목록에 이 공고가 아직 없을 수 있음).
    await _pumpRoute(tester, '/companies/naver-cloud', repository);

    await tester.ensureVisible(find.byKey(const ValueKey('job-bookmark-1')));
    await tester.tap(find.byKey(const ValueKey('job-bookmark-1')));
    await tester.pumpAndSettle();

    expect(repository.addBookmarkCalls, [1]);
    expect(find.byKey(const ValueKey('job-bookmark-filled-1')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 홈페이지 버튼을 누르면 이동 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies/naver-cloud');

    await tester.tap(find.byKey(const ValueKey('company-homepage-link')));
    await tester.pumpAndSettle();

    expect(find.text('기업 홈페이지로 이동합니다.'), findsOneWidget);
    expect(find.text('naver-cloud.com'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

GoRouter _buildRouter({required String initialLocation}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(body: SizedBox()),
    ),
    GoRoute(
      path: '/companies',
      builder: (context, state) => const CompanyView(),
      routes: [
        GoRoute(
          path: ':companyId',
          builder: (context, state) =>
              CompanyDetailView(companyId: state.pathParameters['companyId']!),
        ),
      ],
    ),
    GoRoute(
      path: '/jobs/:jobId',
      builder: (context, state) =>
          JobDetailView(jobId: state.pathParameters['jobId']!),
    ),
  ],
);

Future<void> _pumpRoute(
  WidgetTester tester,
  String initialLocation, [
  JobRepository? repository,
]) async {
  await _setViewport(tester);
  final router = _buildRouter(initialLocation: initialLocation);
  addTearDown(router.dispose);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        jobRepositoryProvider.overrideWithValue(
          repository ?? _FakeJobRepository(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, _) => MaterialApp.router(routerConfig: router),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}
