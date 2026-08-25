import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/app/app.dart';
import 'package:geti_app/core/network/session_provider.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';

class _FakeAuthTokenStorage implements AuthTokenStorage {
  String? accessToken;
  String? refreshToken;

  @override
  Future<String?> readAccessToken() async => accessToken;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    accessToken = tokens.accessToken;
    refreshToken = tokens.refreshToken;
  }

  @override
  Future<void> clear() async {
    accessToken = null;
    refreshToken = null;
  }
}

void main() {
  testWidgets('기본 경로는 로그인 화면이다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProviderScope(child: GetiApp()));
    await tester.pumpAndSettle();

    expect(find.text('교내 계정으로 로그인'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('저장된 로그인 상태로 시작하면 맞춤 추천 결과를 표시한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final tokenStorage = _FakeAuthTokenStorage()..accessToken = 'existing';
    await tester.pumpWidget(
      ProviderScope(
        overrides: [authTokenStorageProvider.overrideWithValue(tokenStorage)],
        child: const GetiApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(find.text('추천 공고 6개'), findsOneWidget);
    expect(find.text('Cloud Platform Engineer'), findsAtLeastNWidgets(1));
    expect(find.text('공고'), findsOneWidget);

    final homeNavigation = find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.label == '홈',
    );
    final jobsNavigation = find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.label == '공고',
    );
    final homeIcon = tester.widget<SvgPicture>(
      find.descendant(of: homeNavigation, matching: find.byType(SvgPicture)),
    );
    final jobsIcon = tester.widget<SvgPicture>(
      find.descendant(of: jobsNavigation, matching: find.byType(SvgPicture)),
    );

    expect(
      homeIcon.colorFilter,
      const ColorFilter.mode(AppColors.primaryAccent, BlendMode.srcIn),
    );
    expect(
      jobsIcon.colorFilter,
      const ColorFilter.mode(AppColors.neutral500, BlendMode.srcIn),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('세션이 만료되면 자동으로 재로그인 안내로 이동한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final container = ProviderContainer(
      overrides: [
        authTokenStorageProvider.overrideWithValue(
          _FakeAuthTokenStorage()..accessToken = 'existing',
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const GetiApp()),
    );
    await tester.pumpAndSettle();
    expect(find.text('맞춤 추천'), findsOneWidget);

    container.read(sessionExpiredProvider.notifier).notifyExpired();
    await tester.pumpAndSettle();

    expect(find.text('로그인이 만료되었습니다.'), findsOneWidget);
    expect(container.read(sessionExpiredProvider), isFalse);
    expect(container.read(authViewModelProvider).loginResult, isNull);
    expect(tester.takeException(), isNull);
  });
}
