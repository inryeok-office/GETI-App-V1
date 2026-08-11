import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({required this.application, super.key});

  final ApplicationItem application;

  @override
  Widget build(BuildContext context) {
    final badgeStyle = _badgeStyle(application.status);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.neutral200),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            application.companyName,
            style: AppTypography.caption.copyWith(color: AppColors.neutral600),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  application.positionName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.heading3.copyWith(
                    color: application.isDeleted
                        ? AppColors.neutral600
                        : AppColors.neutral900,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              _StatusBadge(style: badgeStyle),
              if (!application.isDeleted) ...[
                SizedBox(width: 16.w),
                SvgPicture.asset(
                  'assets/icons/chevron_right.svg',
                  width: 18.w,
                  height: 18.h,
                ),
              ],
            ],
          ),
          if (application.isDeleted) ...[
            SizedBox(height: 8.h),
            Text(
              '공고가 삭제되어 상세 내용을 확인할 수 없습니다.',
              style: AppTypography.caption.copyWith(color: AppColors.error),
            ),
          ],
          SizedBox(height: 8.h),
          Text(
            '제출일 ${application.submittedDate}',
            style: AppTypography.caption.copyWith(color: AppColors.neutral900),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.style});
  final _ApplicationBadgeStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        style.label,
        style: AppTypography.caption.copyWith(color: style.textColor),
      ),
    );
  }
}

_ApplicationBadgeStyle _badgeStyle(ApplicationProgressStatus status) {
  return switch (status) {
    ApplicationProgressStatus.submitted => const _ApplicationBadgeStyle(
      label: '제출 완료',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationProgressStatus.reviewing => const _ApplicationBadgeStyle(
      label: '검토 중',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationProgressStatus.revisionRequested => const _ApplicationBadgeStyle(
      label: '수정 요청',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationProgressStatus.interviewing => const _ApplicationBadgeStyle(
      label: '면접 진행',
      backgroundColor: AppColors.warningBackground,
      textColor: AppColors.warning,
    ),
    ApplicationProgressStatus.accepted => const _ApplicationBadgeStyle(
      label: '합격',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationProgressStatus.rejected => const _ApplicationBadgeStyle(
      label: '불합격',
      backgroundColor: AppColors.background,
      textColor: AppColors.neutral600,
    ),
    ApplicationProgressStatus.cancelled => const _ApplicationBadgeStyle(
      label: '취소',
      backgroundColor: AppColors.dangerBackground,
      textColor: AppColors.error,
    ),
    ApplicationProgressStatus.ended => const _ApplicationBadgeStyle(
      label: '지원 종료',
      backgroundColor: AppColors.background,
      textColor: AppColors.neutral600,
    ),
  };
}

class _ApplicationBadgeStyle {
  const _ApplicationBadgeStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
  final String label;
  final Color backgroundColor;
  final Color textColor;
}
