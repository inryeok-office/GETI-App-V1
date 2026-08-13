import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_spacing.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

/// 최초 로그인 학생에게 Student Web의 프로필 보완 화면으로 이동을 안내합니다.
/// 실제 프로필 입력 폼은 Student Web(500:2970)에만 존재하므로 앱에서는 구현하지
/// 않고, 그 화면의 제목/문구 톤만 가져와 안내 문구를 구성합니다.
/// 실제 Web 연동/딥링크는 별도 Issue에서 구현합니다.
class ProfileCompletionGuideView extends ConsumerWidget {
  const ProfileCompletionGuideView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: const BoxDecoration(
                    color: AppColors.stateIconBackground,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/profile_placeholder.svg',
                    width: 36.w,
                    height: 36.w,
                  ),
                ),
                SizedBox(height: AppSpacing.lg.h),
                Text(
                  '프로필을 완성해 주세요',
                  textAlign: TextAlign.center,
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.stateTitle,
                  ),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  '맞춤 공고 추천을 위해 Student Web에서\n기본 정보를 입력해 주세요.\n입력을 완료한 뒤 다시 로그인해 주세요.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyLarge.copyWith(
                    color: AppColors.stateBody,
                  ),
                ),
                SizedBox(height: AppSpacing.xxl.h),
                SizedBox(
                  width: double.infinity,
                  height: 42.h,
                  child: ElevatedButton(
                    // Student Web 프로필 보완 화면으로 이동하는 실제 딥링크/외부
                    // 브라우저 연동은 별도 Issue에서 구현합니다. 그 전까지는
                    // 실제 동작(로그인 화면으로 복귀)에 맞는 문구를 사용합니다.
                    onPressed: () {
                      ref.read(authViewModelProvider.notifier).reset();
                      Navigator.of(context).pop();
                    },
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
                    child: Text(
                      '돌아가기',
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
}
