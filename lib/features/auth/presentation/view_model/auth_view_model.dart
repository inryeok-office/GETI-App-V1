import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

enum AuthScreenStatus { idle, loading, error }

enum AuthLoginResult { existingMember, needsProfileCompletion }

class AuthViewState {
  const AuthViewState({
    this.screenStatus = AuthScreenStatus.idle,
    this.loginResult,
  });

  final AuthScreenStatus screenStatus;
  final AuthLoginResult? loginResult;

  AuthViewState copyWith({
    AuthScreenStatus? screenStatus,
    AuthLoginResult? loginResult,
  }) => AuthViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    loginResult: loginResult ?? this.loginResult,
  );
}

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthViewState build() => const AuthViewState();

  /// 교내 OAuth 인증 완료를 흉내내는 Mock 동작입니다.
  /// [asExistingMember]로 기존 회원/최초 로그인 학생 분기를 확인할 수 있습니다.
  /// 실제 DG OAuth 연동, 토큰 저장은 별도 Issue에서 구현합니다.
  Future<void> loginWithSchoolOAuth({required bool asExistingMember}) async {
    state = state.copyWith(screenStatus: AuthScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = AuthViewState(
      screenStatus: AuthScreenStatus.idle,
      loginResult: asExistingMember
          ? AuthLoginResult.existingMember
          : AuthLoginResult.needsProfileCompletion,
    );
  }

  void reset() => state = const AuthViewState();
}
