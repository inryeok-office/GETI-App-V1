import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';
import 'package:geti_app/features/auth/data/dto/authorize_response.dart';
import 'package:geti_app/features/auth/data/dto/oauth_login_response.dart';
import 'package:geti_app/features/auth/data/dto/session_response.dart';
import 'package:geti_app/features/auth/data/dto/token_refresh_response.dart';
import 'package:geti_app/features/auth/presentation/view/login_view.dart';
import 'package:geti_app/features/auth/presentation/view/profile_completion_guide_view.dart';
import 'package:geti_app/features/auth/presentation/view/relogin_prompt_view.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/features/auth/presentation/widgets/logout_confirm_dialog.dart';
import 'package:geti_app/shared/widgets/common_error_view.dart';
import 'package:go_router/go_router.dart';
import 'package:retrofit/retrofit.dart';

class _FakeRestClient implements RestClient {
  ApiResponseAuthorizeResponse Function()? authorizeResult;
  ApiResponseOAuthLoginResponse Function()? oauthCallbackResult;

  @override
  Future<ApiResponseAuthorizeResponse> authorize(String provider) async {
    return authorizeResult!();
  }

  @override
  Future<ApiResponseOAuthLoginResponse> oauthCallback(
    String provider,
    String code,
    String state,
  ) async {
    return oauthCallbackResult!();
  }

  @override
  Future<ApiResponseTokenRefreshResponse> refreshToken(
    String refreshToken,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseSessionResponse> getSession() async {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<dynamic>> logout(String refreshToken) async {
    throw UnimplementedError();
  }
}

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

/// 실제 WebView 대신 사용하는 테스트 전용 콜백 화면입니다. OAuth 로그인
/// 화면 진입 즉시 `completeOAuthLogin`을 호출해, WebView가 콜백 URL을
/// 가로챈 뒤 처리하는 것과 동일한 결과를 만듭니다. WebViewController는 실제
/// 플랫폼 구현이 없는 테스트 환경에서 생성할 수 없어 OAuthWebViewPage
/// 자체는 이 테스트에서 사용하지 않습니다.
class _StubOAuthCallbackPage extends ConsumerStatefulWidget {
  const _StubOAuthCallbackPage();

  @override
  ConsumerState<_StubOAuthCallbackPage> createState() =>
      _StubOAuthCallbackPageState();
}

class _StubOAuthCallbackPageState
    extends ConsumerState<_StubOAuthCallbackPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(authViewModelProvider.notifier)
          .completeOAuthLogin(code: 'test-code', oauthState: 'test-state');
      final loggedIn = ref.read(authViewModelProvider).loginResult != null;
      if (!loggedIn && mounted) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('로그인 화면이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(
      tester,
      '/login',
      _FakeRestClient(),
      _FakeAuthTokenStorage(),
    );

    expect(find.text('교내 계정으로 로그인'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그인 버튼을 누르면 기존 회원은 메인으로 이동한다', (tester) async {
    final restClient = _FakeRestClient();
    restClient.authorizeResult = () => const ApiResponseAuthorizeResponse(
      success: true,
      data: AuthorizeResponse(
        authorizationUrl: 'https://example.com/auth',
        state: 's1',
      ),
    );
    restClient.oauthCallbackResult = () => const ApiResponseOAuthLoginResponse(
      success: true,
      data: OAuthLoginResponse(
        accessToken: 'access',
        refreshToken: 'refresh',
        accessTokenExpiresInSeconds: 3600,
        memberId: 1,
        newMember: false,
      ),
    );
    await _pumpRoute(tester, '/login', restClient, _FakeAuthTokenStorage());

    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pumpAndSettle();

    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('최초 로그인 학생은 프로필 보완 안내로 이동한다', (tester) async {
    final restClient = _FakeRestClient();
    restClient.authorizeResult = () => const ApiResponseAuthorizeResponse(
      success: true,
      data: AuthorizeResponse(
        authorizationUrl: 'https://example.com/auth',
        state: 's1',
      ),
    );
    restClient.oauthCallbackResult = () => const ApiResponseOAuthLoginResponse(
      success: true,
      data: OAuthLoginResponse(
        accessToken: 'access',
        refreshToken: 'refresh',
        accessTokenExpiresInSeconds: 3600,
        memberId: 1,
        newMember: true,
      ),
    );
    await _pumpRoute(tester, '/login', restClient, _FakeAuthTokenStorage());

    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pumpAndSettle();

    expect(find.text('프로필을 완성해 주세요'), findsOneWidget);
    expect(find.text('돌아가기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('이전 로그인 시도의 결과가 남아있어도 새 시도는 stale navigation을 일으키지 않는다', (
    tester,
  ) async {
    final restClient = _FakeRestClient();
    restClient.authorizeResult = () => const ApiResponseAuthorizeResponse(
      success: true,
      data: AuthorizeResponse(
        authorizationUrl: 'https://example.com/auth',
        state: 's1',
      ),
    );
    restClient.oauthCallbackResult = () => const ApiResponseOAuthLoginResponse(
      success: true,
      data: OAuthLoginResponse(
        accessToken: 'access',
        refreshToken: 'refresh',
        accessTokenExpiresInSeconds: 3600,
        memberId: 1,
        newMember: true,
      ),
    );
    await _pumpRoute(tester, '/login', restClient, _FakeAuthTokenStorage());

    // 최초 로그인 시나리오를 먼저 실행해 loginResult를 남긴다.
    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pumpAndSettle();
    expect(find.text('프로필을 완성해 주세요'), findsOneWidget);

    // '돌아가기'(reset 호출) 없이 시스템 뒤로가기로만 이동해 stale
    // loginResult가 authViewModelProvider에 남아있는 상황을 재현한다.
    Navigator.of(tester.element(find.byType(ProfileCompletionGuideView))).pop();
    await tester.pumpAndSettle();
    expect(find.text('교내 계정으로 로그인'), findsOneWidget);

    // 기존 회원으로 다시 로그인하면, loading 전환 시점에 stale
    // loginResult 때문에 프로필 안내 화면으로 잘못 이동하면 안 된다.
    restClient.oauthCallbackResult = () => const ApiResponseOAuthLoginResponse(
      success: true,
      data: OAuthLoginResponse(
        accessToken: 'access',
        refreshToken: 'refresh',
        accessTokenExpiresInSeconds: 3600,
        memberId: 1,
        newMember: false,
      ),
    );
    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pump();
    expect(find.text('프로필을 완성해 주세요'), findsNothing);

    await tester.pumpAndSettle();
    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그인 실패 시 에러 메시지를 표시한다', (tester) async {
    final restClient = _FakeRestClient()
      ..authorizeResult = () => throw Exception('network error');
    await _pumpRoute(tester, '/login', restClient, _FakeAuthTokenStorage());

    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pumpAndSettle();

    expect(find.text('로그인에 실패했어요. 다시 시도해 주세요.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('저장된 토큰이 있으면 로그인 화면을 건너뛰고 메인으로 이동한다', (tester) async {
    final tokenStorage = _FakeAuthTokenStorage()..accessToken = 'existing';
    await _pumpRoute(tester, '/login', _FakeRestClient(), tokenStorage);

    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('재로그인 안내 화면이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(
      tester,
      '/relogin',
      _FakeRestClient(),
      _FakeAuthTokenStorage(),
    );

    expect(find.byType(CommonErrorView), findsOneWidget);
    expect(find.text('로그인이 만료되었습니다.'), findsOneWidget);
    expect(
      find.text('보안을 위해 로그인 시간이 만료되었습니다.\n다시 로그인하여 서비스를 이용해 주세요.'),
      findsOneWidget,
    );
    expect(find.text('다시 로그인'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('다시 로그인 버튼을 누르면 로그인 화면으로 이동한다', (tester) async {
    await _pumpRoute(
      tester,
      '/relogin',
      _FakeRestClient(),
      _FakeAuthTokenStorage(),
    );

    await tester.tap(find.text('다시 로그인'));
    await tester.pumpAndSettle();

    expect(find.text('교내 계정으로 로그인'), findsOneWidget);
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

Future<void> _pumpRoute(
  WidgetTester tester,
  String initialLocation,
  RestClient fakeRestClient,
  AuthTokenStorage fakeTokenStorage,
) async {
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
          GoRoute(
            path: 'oauth',
            builder: (context, state) => const _StubOAuthCallbackPage(),
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
      overrides: [
        restClientProvider.overrideWithValue(fakeRestClient),
        authTokenStorageProvider.overrideWithValue(fakeTokenStorage),
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
