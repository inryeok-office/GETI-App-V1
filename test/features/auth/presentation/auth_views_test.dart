import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/auth/presentation/view/login_view.dart';
import 'package:geti_app/features/auth/presentation/view/profile_completion_guide_view.dart';
import 'package:geti_app/features/auth/presentation/view/relogin_prompt_view.dart';
import 'package:geti_app/features/auth/presentation/widgets/logout_confirm_dialog.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('로그인 화면이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/login');

    expect(find.text('교내 계정으로 로그인'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그인 버튼을 누르면 기존 회원은 메인으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/login');

    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();

    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('최초 로그인 학생은 프로필 보완 안내로 이동한다', (tester) async {
    await _pumpRoute(tester, '/login');

    await tester.tap(find.text('(Mock) 최초 로그인 시나리오로 보기'));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();

    expect(find.text('프로필을 완성해 주세요'), findsOneWidget);
    expect(find.text('돌아가기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('이전 로그인 시도의 결과가 남아있어도 새 시도는 stale navigation을 일으키지 않는다', (
    tester,
  ) async {
    await _pumpRoute(tester, '/login');

    // 최초 로그인 시나리오를 먼저 실행해 loginResult를 남긴다.
    await tester.tap(find.text('(Mock) 최초 로그인 시나리오로 보기'));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();
    expect(find.text('프로필을 완성해 주세요'), findsOneWidget);

    // '돌아가기'(reset 호출) 없이 시스템 뒤로가기로만 이동해 stale
    // loginResult가 authViewModelProvider에 남아있는 상황을 재현한다.
    Navigator.of(tester.element(find.byType(ProfileCompletionGuideView))).pop();
    await tester.pumpAndSettle();
    expect(find.text('교내 계정으로 로그인'), findsOneWidget);

    // 기존 회원으로 다시 로그인하면, loading 전환 시점에 stale
    // loginResult 때문에 프로필 안내 화면으로 잘못 이동하면 안 된다.
    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pump();
    expect(find.text('프로필을 완성해 주세요'), findsNothing);

    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();
    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('재로그인 안내 화면이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/relogin');

    expect(find.text('로그인이 만료되었습니다.'), findsOneWidget);
    expect(find.text('다시 로그인'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그아웃 확인 다이얼로그가 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _setViewport(tester);
    var result = false;
    await tester.pumpWidget(
      ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) => MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () async {
                    result = await LogoutConfirmDialog.show(context);
                  },
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('로그아웃 하시겠습니까?'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.widgetWithText(ElevatedButton, '로그아웃'));
    await tester.pumpAndSettle();
    expect(result, isTrue);
  });
}

Future<void> _pumpRoute(WidgetTester tester, String initialLocation) async {
  await _setViewport(tester);
  final router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('맞춤 추천'))),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
        routes: [
          GoRoute(
            path: 'profile-guide',
            builder: (context, state) => const ProfileCompletionGuideView(),
          ),
        ],
      ),
      GoRoute(
        path: '/relogin',
        builder: (context, state) => const ReloginPromptView(),
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
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}
