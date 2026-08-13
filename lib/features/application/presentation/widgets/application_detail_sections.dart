import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/application/presentation/view_model/application_detail_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ApplicationDetailSummary extends StatelessWidget {
  const ApplicationDetailSummary({required this.detail, super.key});

  final ApplicationDetail detail;

  @override
  Widget build(BuildContext context) {
    final badge = _badgeFor(detail.variant);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detail.companyName,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: badge.backgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  badge.label,
                  style: AppTypography.caption.copyWith(color: badge.textColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            detail.positionName,
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 8.h),
          Text(
            '제출 ${detail.submittedAt}',
            style: AppTypography.caption.copyWith(color: AppColors.neutral600),
          ),
        ],
      ),
    );
  }
}

class ApplicationDetailNotice extends StatelessWidget {
  const ApplicationDetailNotice({required this.detail, super.key});

  final ApplicationDetail detail;

  @override
  Widget build(BuildContext context) {
    final colors = switch (detail.variant) {
      ApplicationDetailVariant.cancelled => (
        background: AppColors.dangerBackground,
        title: AppColors.error,
      ),
      ApplicationDetailVariant.deleted => (
        background: const Color(0xFFFAFAFA),
        title: AppColors.neutral600,
      ),
      _ => (background: AppColors.primarySurface, title: AppColors.primaryDark),
    };
    return _DetailSection(
      backgroundColor: colors.background,
      title: detail.noticeTitle!,
      titleColor: colors.title,
      child: Text(
        detail.noticeDescription!,
        style: AppTypography.body.copyWith(color: AppColors.neutral600),
      ),
    );
  }
}

class SubmittedAnswerSection extends StatelessWidget {
  const SubmittedAnswerSection({required this.answer, super.key});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return _DetailSection(
      title: '지원 동기',
      child: Text(
        answer,
        style: AppTypography.body.copyWith(color: AppColors.neutral600),
      ),
    );
  }
}

class ApplicationAttachmentSection extends StatelessWidget {
  const ApplicationAttachmentSection({
    required this.fileName,
    required this.fileDescription,
    super.key,
  });

  final String fileName;
  final String fileDescription;

  @override
  Widget build(BuildContext context) {
    return _DetailSection(
      title: fileName,
      titleWeight: FontWeight.w400,
      child: Text(
        fileDescription,
        style: AppTypography.caption.copyWith(color: AppColors.primaryDark),
      ),
    );
  }
}

class ApplicationStatusHistorySection extends StatelessWidget {
  const ApplicationStatusHistorySection({required this.history, super.key});

  final List<ApplicationStatusHistory> history;

  @override
  Widget build(BuildContext context) {
    return _DetailSection(
      title: '상태 이력',
      child: Column(
        children: history.indexed.map((entry) {
          final (index, historyItem) = entry;
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 8.h),
            child: Row(
              children: [
                Text(
                  historyItem.label,
                  style: AppTypography.body.copyWith(
                    color: index == 0
                        ? AppColors.neutral900
                        : AppColors.neutral600,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  historyItem.occurredAt,
                  style: AppTypography.body.copyWith(
                    color: index == 0
                        ? AppColors.neutral900
                        : AppColors.neutral600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    required this.title,
    required this.child,
    this.backgroundColor = AppColors.surface,
    this.titleColor = AppColors.neutral900,
    this.titleWeight = FontWeight.w500,
  });

  final String title;
  final Widget child;
  final Color backgroundColor;
  final Color titleColor;
  final FontWeight titleWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.label.copyWith(
              color: titleColor,
              fontWeight: titleWeight,
            ),
          ),
          SizedBox(height: 8.h),
          child,
        ],
      ),
    );
  }
}

({String label, Color backgroundColor, Color textColor}) _badgeFor(
  ApplicationDetailVariant variant,
) {
  return switch (variant) {
    ApplicationDetailVariant.reviewing => (
      label: '검토 중',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationDetailVariant.revisionRequested => (
      label: '수정 요청',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationDetailVariant.submitted => (
      label: '제출 완료',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationDetailVariant.interviewing => (
      label: '면접 진행',
      backgroundColor: AppColors.warningBackground,
      textColor: AppColors.warning,
    ),
    ApplicationDetailVariant.accepted => (
      label: '합격',
      backgroundColor: AppColors.primarySubtle,
      textColor: AppColors.primaryDark,
    ),
    ApplicationDetailVariant.rejected => (
      label: '불합격',
      backgroundColor: AppColors.background,
      textColor: AppColors.neutral600,
    ),
    ApplicationDetailVariant.cancelled => (
      label: '취소',
      backgroundColor: AppColors.dangerBackground,
      textColor: AppColors.error,
    ),
    ApplicationDetailVariant.deleted => (
      label: '지원 종료',
      backgroundColor: AppColors.background,
      textColor: AppColors.neutral600,
    ),
  };
}
