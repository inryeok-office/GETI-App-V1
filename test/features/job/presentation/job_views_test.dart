import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/job/presentation/view/job_bookmark_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_view.dart';
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
      builder: (context, state) => const Scaffold(body: SizedBox()),
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
