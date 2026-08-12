import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

/// 로그아웃 확인 다이얼로그입니다.
/// Figma Style Guide의 확인 모달 패턴(헤더/본문/구분선 있는 하단 버튼 영역)을
/// 따르며, 마이페이지 등 로그아웃 진입점이 구현되면 그곳에서 [show]를 호출해
/// 사용합니다.
class LogoutConfirmDialog {
  const LogoutConfirmDialog._();

  static Future<bool> show(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(28.w, 24.h, 28.w, 8.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '로그아웃',
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(28.w, 8.h, 28.w, 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '로그아웃 하시겠습니까?',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.neutral900,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '다시 이용하려면 교내 계정으로 로그인해야 해요.',
                    style: AppTypography.body.copyWith(
                      color: AppColors.neutral700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.neutral200)),
              ),
              height: 76.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.neutral600,
                      side: const BorderSide(color: AppColors.neutral200),
                      backgroundColor: AppColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: Text(
                      '취소',
                      style: AppTypography.label.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: AppColors.onError,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: Text(
                      '로그아웃',
                      style: AppTypography.label.copyWith(
                        color: AppColors.onError,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return confirmed ?? false;
  }
}
