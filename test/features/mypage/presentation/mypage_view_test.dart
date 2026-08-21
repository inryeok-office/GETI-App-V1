import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/mypage/presentation/view/mypage_view.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('마이페이지가 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/mypage');

    expect(find.text('마이페이지'), findsAtLeastNWidgets(1));
    expect(find.text('내 지원 현황'), findsOneWidget);
    expect(find.text('로그아웃'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('내 지원 현황을 누르면 지원 목록으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/mypage');

    await tester.tap(find.byKey(const ValueKey('mypage-applications')));
    await tester.pumpAndSettle();

    expect(find.text('내 지원 목록'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그아웃을 확인하면 로그인 화면으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/mypage');

    await tester.tap(find.byKey(const ValueKey('mypage-logout')));
    await tester.pumpAndSettle();
    expect(find.text('로그아웃 하시겠습니까?'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, '로그아웃'));
    await tester.pumpAndSettle();

    expect(find.text('로그인 화면'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그아웃 다이얼로그에서 취소하면 마이페이지에 머무른다', (tester) async {
    await _pumpRoute(tester, '/mypage');

    await tester.tap(find.byKey(const ValueKey('mypage-logout')));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(OutlinedButton, '취소'));
    await tester.pumpAndSettle();

    expect(find.text('마이페이지'), findsAtLeastNWidgets(1));
    expect(tester.takeException(), isNull);
  });

  testWidgets('하단 네비 마이 탭을 누르면 마이페이지로 이동한다', (tester) async {
    await _setViewport(tester);
    final router = GoRouter(
      initialLocation: '/',
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
          path: '/mypage',
          builder: (context, state) => const MyPageView(),
        ),
      ],
    );
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

    await tester.tap(find.text('마이'));
    await tester.pumpAndSettle();

    expect(find.text('마이페이지'), findsAtLeastNWidgets(1));
    expect(tester.takeException(), isNull);
  });
}

Future<void> _pumpRoute(WidgetTester tester, String initialLocation) async {
  await _setViewport(tester);
  final router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('로그인 화면'))),
      ),
      GoRoute(
        path: '/applications',
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('내 지원 목록'))),
      ),
      GoRoute(path: '/mypage', builder: (context, state) => const MyPageView()),
    ],
  );
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
