import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_spacing.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

/// 세션 만료 등으로 재인증이 필요할 때 표시하는 안내 화면입니다.
/// 문구는 Figma "Student Web" 파일의 로그인 만료(500:3609) 프레임을 따르고,
/// 레이아웃은 앱 내 다른 화면에서 쓰는 상태 안내 패턴을 재사용합니다.
class ReloginPromptView extends StatelessWidget {
  const ReloginPromptView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'assets/icons/lock.svg',
                    width: 32.w,
                    height: 32.w,
                  ),
                ),
                SizedBox(height: AppSpacing.lg.h),
                Text(
                  '로그인이 만료되었습니다.',
                  textAlign: TextAlign.center,
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.stateTitle,
                  ),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  '보안을 위해 로그인 시간이 만료되었습니다.\n다시 로그인하여 서비스를 이용해 주세요.',
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
                    onPressed: () => context.go('/login'),
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
                      '다시 로그인',
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
