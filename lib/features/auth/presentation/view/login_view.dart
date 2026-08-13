import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_spacing.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authViewModelProvider, (previous, next) {
      switch (next.loginResult) {
        case AuthLoginResult.existingMember:
          context.go('/');
        case AuthLoginResult.needsProfileCompletion:
          context.push('/login/profile-guide');
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
                    '로그인에 실패했어요. 다시 시도해 주세요.',
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
                        : () => viewModel.loginWithSchoolOAuth(
                            asExistingMember: true,
                          ),
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
                // TODO(design): Figma에서 신규/기존 회원 분기 UI가 확정되면 제거하고
                // 실제 인증 응답에 따라 자동 분기하도록 교체합니다.
                // kDebugMode로 감싸 실제 사용자에게는 노출되지 않도록 합니다.
                if (kDebugMode)
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => viewModel.loginWithSchoolOAuth(
                            asExistingMember: false,
                          ),
                    child: Text(
                      '(Mock) 최초 로그인 시나리오로 보기',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.neutral500,
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
}
