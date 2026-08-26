import 'package:geti_app/core/network/api_error.dart';
import 'package:geti_app/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

enum AuthScreenStatus { idle, loading, error }

enum AuthLoginResult { existingMember, needsProfileCompletion }

class AuthViewState {
  const AuthViewState({
    this.screenStatus = AuthScreenStatus.idle,
    this.loginResult,
    this.errorMessage,
  });

  final AuthScreenStatus screenStatus;
  final AuthLoginResult? loginResult;
  final String? errorMessage;

  AuthViewState copyWith({
    AuthScreenStatus? screenStatus,
    AuthLoginResult? loginResult,
    String? errorMessage,
  }) => AuthViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    loginResult: loginResult ?? this.loginResult,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthViewState build() => const AuthViewState();

  /// OAuth 인가 URL을 발급받습니다. 실패하면 null을 반환하고 에러 상태를
  /// 표시합니다. 성공하면 호출한 쪽(View)이 이 URL로 WebView를 엽니다.
  Future<String?> startOAuthLogin() async {
    state = const AuthViewState(screenStatus: AuthScreenStatus.loading);
    try {
      final authorize = await ref
          .read(authRepositoryProvider)
          .startOAuthLogin();
      if (!ref.mounted) return null;
      state = const AuthViewState();
      return authorize.authorizationUrl;
    } catch (error) {
      if (!ref.mounted) return null;
      state = AuthViewState(
        screenStatus: AuthScreenStatus.error,
        errorMessage: _messageFor(error),
      );
      return null;
    }
  }

  /// WebView가 가로챈 callback의 code/state로 로그인을 완료합니다.
  Future<void> completeOAuthLogin({
    required String code,
    required String oauthState,
  }) async {
    state = const AuthViewState(screenStatus: AuthScreenStatus.loading);
    try {
      final result = await ref
          .read(authRepositoryProvider)
          .completeOAuthLogin(code: code, state: oauthState);
      if (!ref.mounted) return;
      state = AuthViewState(
        loginResult: result.newMember
            ? AuthLoginResult.needsProfileCompletion
            : AuthLoginResult.existingMember,
      );
    } catch (error) {
      if (!ref.mounted) return;
      state = AuthViewState(
        screenStatus: AuthScreenStatus.error,
        errorMessage: _messageFor(error),
      );
    }
  }

  /// OAuth 진행 중 사용자가 취소했거나 provider가 오류를 반환해 콜백에서
  /// code/state를 받지 못했을 때 호출합니다.
  void reportOAuthFailed() {
    state = const AuthViewState(
      screenStatus: AuthScreenStatus.error,
      errorMessage: '로그인에 실패했어요. 다시 시도해 주세요.',
    );
  }

  Future<void> logout() => ref.read(authRepositoryProvider).logout();

  void reset() => state = const AuthViewState();

  String _messageFor(Object error) {
    if (error is ApiException) {
      return switch (error.error.code) {
        'MEMBER_SIGNUP_REJECTED' => error.error.message,
        'MEMBER_LOGIN_NOT_ALLOWED' => '로그인할 수 없는 계정입니다.',
        'OAUTH_STATE_INVALID' => '로그인 세션이 만료되었습니다. 다시 시도해 주세요.',
        'OAUTH_EMAIL_ALREADY_REGISTERED' => '이미 다른 방식으로 가입된 계정입니다.',
        _ => '로그인에 실패했어요. 다시 시도해 주세요.',
      };
    }
    return '로그인에 실패했어요. 다시 시도해 주세요.';
  }
}
