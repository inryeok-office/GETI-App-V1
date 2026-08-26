import 'package:geti_app/core/network/api_error.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';
import 'package:geti_app/features/auth/data/dto/authorize_response.dart';
import 'package:geti_app/features/auth/data/dto/oauth_login_response.dart';
import 'package:geti_app/features/auth/data/dto/session_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

/// Auth 관련 API 호출과 토큰 저장을 함께 다룹니다. ViewModel은 이 Repository만
/// 알면 되고, RestClient/TokenStorage를 직접 다루지 않습니다.
class AuthRepository {
  AuthRepository({required this.restClient, required this.tokenStorage});

  final RestClient restClient;
  final AuthTokenStorage tokenStorage;

  static const _provider = 'dg';

  Future<AuthorizeResponse> startOAuthLogin() async {
    final response = await restClient.authorize(_provider);
    final data = response.data;
    if (!response.success || data == null) {
      throw ApiException(response.error ?? _unknownError());
    }
    return data;
  }

  /// WebView에서 가로챈 callback URL의 code/state로 로그인을 완료하고,
  /// 성공하면 토큰을 저장합니다.
  Future<OAuthLoginResponse> completeOAuthLogin({
    required String code,
    required String state,
  }) async {
    final response = await restClient.oauthCallback(_provider, code, state);
    final data = response.data;
    if (!response.success || data == null) {
      throw ApiException(response.error ?? _unknownError());
    }
    await tokenStorage.saveTokens(
      AuthTokens(
        accessToken: data.accessToken,
        refreshToken: data.refreshToken,
      ),
    );
    return data;
  }

  /// 저장된 토큰이 실제로 유효한지 서버에 확인합니다. 마이페이지 등에서
  /// 최신 회원 정보를 다시 확인할 때 사용합니다(앱 시작 시 자동 로그인
  /// 판단에는 로컬 토큰 존재 여부만 사용하고, 이 호출로 막지 않습니다).
  Future<SessionResponse?> fetchSession() async {
    try {
      final response = await restClient.getSession();
      return response.success ? response.data : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> logout() async {
    final refreshToken = await tokenStorage.readRefreshToken();
    if (refreshToken != null) {
      try {
        await restClient.logout(refreshToken);
      } catch (_) {
        // 서버 호출이 실패해도 로컬 토큰은 지웁니다.
      }
    }
    await tokenStorage.clear();
  }

  ApiErrorBody _unknownError() =>
      const ApiErrorBody(code: 'UNKNOWN', message: '알 수 없는 오류가 발생했습니다.');
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    restClient: ref.watch(restClientProvider),
    tokenStorage: ref.watch(authTokenStorageProvider),
  );
}
