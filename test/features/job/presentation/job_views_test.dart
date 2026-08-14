import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/job/presentation/view/job_bookmark_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_view.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

  testWidgets('분석 완료 공고는 AI 분석 카드에 핵심 요약과 태그를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/naver-cloud-intern');

    expect(find.text('AI 공고 분석'), findsOneWidget);
    expect(find.text('분석 완료'), findsOneWidget);
    expect(
      find.text('웹서비스 개발 경험과 JavaScript 기본 역량을 중요하게 보는 신입·고졸 지원 가능 인턴 공고입니다.'),
      findsOneWidget,
    );
    expect(find.text('고졸 지원 가능'), findsOneWidget);
    expect(find.text('보통'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 대기 중인 공고는 대기 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/kepco-intern');

    expect(find.text('분석 대기 중'), findsOneWidget);
    expect(find.text('AI가 공고 내용을 분석하고 있습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 정보가 부족한 공고는 안내만 표시하고 재시도 버튼이 없다', (tester) async {
    await _pumpRoute(tester, '/jobs/gsw-portfolio');

    expect(find.text('분석 정보 부족'), findsOneWidget);
    expect(find.text('공고 내용이 부족하여 분석할 수 없습니다.'), findsOneWidget);
    expect(find.byKey(const ValueKey('job-ai-analysis-retry')), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 실패한 공고는 재시도로 재분석 후 완료 상태가 된다', (tester) async {
    await _pumpRoute(tester, '/jobs/woowa-frontend');

    expect(find.text('분석 실패'), findsOneWidget);
    expect(find.text('AI 분석 중 문제가 발생했습니다.'), findsOneWidget);

    await tester.ensureVisible(
      find.byKey(const ValueKey('job-ai-analysis-retry')),
    );
    await tester.tap(find.byKey(const ValueKey('job-ai-analysis-retry')));
    await tester.pump();
    expect(find.text('재분석 중'), findsOneWidget);
    expect(find.text('AI가 다시 분석하고 있습니다.'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();

    expect(find.text('분석 완료'), findsOneWidget);
    expect(
      find.text('프론트엔드 실무 경험과 TypeScript 활용 능력을 중요하게 보는 정규직 신입 공고입니다.'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('재분석 중에는 로딩 아이콘 회전 애니메이션이 실제로 재생된다', (tester) async {
    await _pumpRoute(tester, '/jobs/woowa-frontend');

    await tester.ensureVisible(
      find.byKey(const ValueKey('job-ai-analysis-retry')),
    );
    await tester.tap(find.byKey(const ValueKey('job-ai-analysis-retry')));
    await tester.pump();

    final rotation = tester.widget<RotationTransition>(
      find.byKey(const ValueKey('job-ai-analysis-spinner')),
    );
    final controller = rotation.turns as AnimationController;
    expect(controller.isAnimating, isTrue);

    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('북마크를 눌러도 재시도로 갱신된 AI 분석 결과가 초기화되지 않는다', (tester) async {
    await _pumpRoute(tester, '/jobs/woowa-frontend');

    await tester.ensureVisible(
      find.byKey(const ValueKey('job-ai-analysis-retry')),
    );
    await tester.tap(find.byKey(const ValueKey('job-ai-analysis-retry')));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();
    expect(find.text('분석 완료'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('job-detail-bookmark')));
    await tester.pumpAndSettle();

    expect(find.text('북마크 해제하기'), findsOneWidget);
    expect(find.text('분석 완료'), findsOneWidget);
    expect(find.text('분석 실패'), findsNothing);
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
