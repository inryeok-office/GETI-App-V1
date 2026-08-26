import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_spacing.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _skipIfAlreadyLoggedIn(),
    );
  }

  /// 저장된 토큰이 있으면 로그인 화면을 건너뛰고 홈으로 이동합니다. 토큰이
  /// 만료됐더라도 이후 API 호출에서 기존 401 → Refresh/재로그인 흐름이
  /// 처리하므로 여기서는 로컬 저장소의 존재 여부만 확인합니다(네트워크
  /// 클라이언트가 필요 없습니다).
  Future<void> _skipIfAlreadyLoggedIn() async {
    try {
      final accessToken = await ref
          .read(authTokenStorageProvider)
          .readAccessToken();
      if (accessToken == null || !mounted) return;
      context.go('/');
    } catch (_) {
      // 저장소를 읽지 못하면 평소처럼 로그인 화면을 보여줍니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authViewModelProvider, (previous, next) {
      switch (next.loginResult) {
        case AuthLoginResult.existingMember:
          context.go('/');
        case AuthLoginResult.needsProfileCompletion:
          context.go('/login/profile-guide');
        case null:
          break;
      }
    });

    final state = ref.watch(authViewModelProvider);
    final viewModel = ref.read(authViewModelProvider.notifier);
    final isLoading = state.screenStatus == AuthScreenStatus.loading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/geti_logo.png',
                  width: 64.w,
                  height: 64.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  'GETI',
                  style: AppTypography.display.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  '교내 계정으로 로그인하고\n맞춤 공고를 확인해 보세요.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyLarge.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
                SizedBox(height: AppSpacing.xxl.h),
                if (state.screenStatus == AuthScreenStatus.error) ...[
                  Text(
                    state.errorMessage ?? '로그인에 실패했어요. 다시 시도해 주세요.',
                    textAlign: TextAlign.center,
                    style: AppTypography.body.copyWith(color: AppColors.error),
                  ),
                  SizedBox(height: AppSpacing.md.h),
                ],
                SizedBox(
                  width: double.infinity,
                  height: 42.h,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () => _startLogin(context, viewModel),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: isLoading
                        ? SizedBox(
                            width: 18.w,
                            height: 18.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.onPrimary,
                            ),
                          )
                        : Text(
                            '교내 계정으로 로그인',
                            style: AppTypography.label.copyWith(
                              color: AppColors.onPrimary,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startLogin(
    BuildContext context,
    AuthViewModel viewModel,
  ) async {
    final authorizationUrl = await viewModel.startOAuthLogin();
    if (authorizationUrl == null || !context.mounted) return;
    await context.push('/login/oauth', extra: authorizationUrl);
  }
}
