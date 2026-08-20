import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/job/presentation/view/job_bookmark_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_view.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _FakeUrlLauncher extends UrlLauncherPlatform {
  String? launchedUrl;

  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    launchedUrl = url;
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakeUrlLauncher = _FakeUrlLauncher();
  UrlLauncherPlatform.instance = fakeUrlLauncher;

  testWidgets('채용 공고 목록이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    expect(find.text('채용 공고'), findsAtLeastNWidgets(1));
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색어로 공고를 필터링할 수 있다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.enterText(
      find.byKey(const ValueKey('job-search-field')),
      '네이버',
    );
    await tester.pumpAndSettle();

    expect(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색 결과가 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.enterText(
      find.byKey(const ValueKey('job-search-field')),
      '존재하지 않는 공고',
    );
    await tester.pumpAndSettle();

    expect(find.text('검색 결과가 없어요.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('목록에서 공고를 탭하면 상세로 이동한다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.tap(find.text('2026년 고졸 채용형 인턴 모집'));
    await tester.pumpAndSettle();

    expect(find.text('공고 상세'), findsOneWidget);
    expect(find.text('지원서 작성하기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('학교 공고 상세에서 지원서 작성하기는 지원 목록으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/jobs/kepco-intern');

    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();

    expect(find.text('내 지원 목록'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('외부 공고 상세에서 사이트에서 지원하기는 외부 이동 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/naver-cloud-intern');

    expect(find.text('사이트에서 지원하기'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();

    expect(find.text('외부 채용 페이지로 이동합니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('외부 공고 지원 확인을 누르면 실제 브라우저 이동이 호출된다', (tester) async {
    fakeUrlLauncher.launchedUrl = null;
    await _pumpRoute(tester, '/jobs/naver-cloud-intern');

    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();
    await tester.tap(
      find.byKey(const ValueKey('job-detail-apply-external-confirm')),
    );
    await tester.pumpAndSettle();

    expect(fakeUrlLauncher.launchedUrl, contains('recruit.navercorp.com'));
    expect(tester.takeException(), isNull);
  });

  testWidgets('지원 자격이 없는 공고는 상세에서 지원 버튼이 비활성화되고 사유가 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs/toss-payments-fe');

    expect(find.text('3학년 재학생만 지원할 수 있는 공고입니다.'), findsOneWidget);

    final button = tester.widget<ElevatedButton>(
      find.byKey(const ValueKey('job-detail-apply')),
    );
    expect(button.onPressed, isNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets('비공개·삭제 공고는 목록에 노출되지 않는다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    expect(find.text('검토 중인 비공개 공고'), findsNothing);
    expect(find.text('삭제된 채용 공고'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('유형 필터로 목록을 좁힐 수 있다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.tap(find.byKey(const ValueKey('job-type-filter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('job-filter-option-인턴')));
    await tester.pumpAndSettle();

    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsOneWidget);
    expect(find.text('교내 연계 기업 포트폴리오 우수자 채용'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('출처 필터로 목록을 좁힐 수 있다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.tap(find.byKey(const ValueKey('job-source-filter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('job-filter-option-외부')));
    await tester.pumpAndSettle();

    expect(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감임박 필터를 켜면 D-7 이내 공고만 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.tap(find.byKey(const ValueKey('job-deadline-soon-filter')));
    await tester.pumpAndSettle();

    expect(find.text('3학년 대상 프론트엔드 채용형 인턴'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('첨부파일이 있는 공고는 상세에 첨부파일 섹션이 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs/kepco-intern');

    expect(find.text('첨부파일'), findsOneWidget);
    expect(find.text('kepco_intern_guide.pdf'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('첨부파일이 없는 공고는 상세에 첨부파일 섹션이 표시되지 않는다', (tester) async {
    await _pumpRoute(tester, '/jobs/woowa-frontend');

    expect(find.text('첨부파일'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('상세 화면에 조회수가 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs/kepco-intern');

    expect(find.text('조회수'), findsOneWidget);
    expect(find.text('129회'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감된 공고는 상세에서 지원 버튼이 비활성화된다', (tester) async {
    await _pumpRoute(tester, '/jobs/woowa-frontend');

    expect(find.text('마감된 공고입니다'), findsOneWidget);

    final button = tester.widget<ElevatedButton>(
      find.byKey(const ValueKey('job-detail-apply')),
    );
    expect(button.onPressed, isNull);

    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();
    expect(find.text('내 지원 목록'), findsNothing);
    expect(find.text('외부 채용 페이지로 이동합니다.'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('하단 네비 공고 탭을 누르면 채용 공고 목록으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/');

    expect(find.text('홈 화면'), findsOneWidget);
    await tester.tap(find.text('공고'));
    await tester.pumpAndSettle();

    expect(find.text('채용 공고'), findsAtLeastNWidgets(1));
    expect(tester.takeException(), isNull);
  });

  testWidgets('공고 화면 하단 네비 홈 탭을 누르면 홈으로 돌아간다', (tester) async {
    await _pumpRoute(tester, '/jobs');

    await tester.tap(find.text('홈'));
    await tester.pumpAndSettle();

    expect(find.text('홈 화면'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('상세에서 북마크하면 북마크 화면에 표시된다', (tester) async {
    await _setViewport(tester);
    final router = _buildRouter(initialLocation: '/jobs/kepco-intern');
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) => MaterialApp.router(routerConfig: router),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('job-detail-bookmark')));
    await tester.pumpAndSettle();
    expect(find.text('북마크 해제하기'), findsOneWidget);

    router.go('/jobs/bookmarks');
    await tester.pumpAndSettle();

    expect(find.text('저장한 공고 1개'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('북마크가 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/bookmarks');

    expect(find.text('북마크한 공고가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('비공개·삭제된 공고는 북마크되어 있어도 북마크 목록에 노출되지 않는다', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(jobViewModelProvider.notifier);
    notifier.toggleBookmark('hidden-internal-review');
    notifier.toggleBookmark('removed-partner-role');
    notifier.toggleBookmark('kepco-intern');

    final bookmarkedIds = container
        .read(jobViewModelProvider)
        .bookmarkedJobs
        .map((job) => job.id)
        .toList();

    expect(bookmarkedIds, ['kepco-intern']);
  });
}

GoRouter _buildRouter({required String initialLocation}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Scaffold(
        body: const Center(child: Text('홈 화면')),
        bottomNavigationBar: SafeArea(
          top: false,
          child: AppBottomNavigation(
            currentIndex: 0,
            onTap: (index) => navigateToBottomTab(context, index),
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/applications',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('내 지원 목록'))),
    ),
    GoRoute(
      path: '/jobs',
      builder: (context, state) => const JobView(),
      routes: [
        GoRoute(
          path: 'bookmarks',
          builder: (context, state) => const JobBookmarkView(),
        ),
        GoRoute(
          path: ':jobId',
          builder: (context, state) =>
              JobDetailView(jobId: state.pathParameters['jobId']!),
        ),
      ],
    ),
  ],
);

Future<void> _pumpRoute(WidgetTester tester, String initialLocation) async {
  await _setViewport(tester);
  final router = _buildRouter(initialLocation: initialLocation);
  addTearDown(router.dispose);
  await tester.pumpWidget(
    ProviderScope(
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
