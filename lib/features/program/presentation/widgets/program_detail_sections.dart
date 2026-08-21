import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/program/presentation/view_model/program_detail_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ProgramDetailSummary extends StatelessWidget {
  const ProgramDetailSummary({required this.detail, super.key});
  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => _DetailCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            _Badge(label: detail.typeLabel),
            _Badge(label: detail.recruitmentBadge),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          detail.title,
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 8.h),
        Text(
          detail.applicationPeriod,
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
        SizedBox(height: 8.h),
        Text(
          detail.viewCount,
          style: AppTypography.caption.copyWith(color: AppColors.neutral900),
        ),
      ],
    ),
  );
}

class ProgramDetailField extends StatelessWidget {
  const ProgramDetailField({
    required this.label,
    required this.value,
    super.key,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => _DetailCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: AppTypography.body.copyWith(color: AppColors.neutral900),
        ),
      ],
    ),
  );
}

class ProgramApplicationInfo extends StatelessWidget {
  const ProgramApplicationInfo({required this.detail, super.key});
  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => _DetailCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '신청 정보',
          style: AppTypography.label.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        _InfoRow(label: '모집 정원', value: detail.recruitmentCapacity),
        SizedBox(height: 12.h),
        _InfoRow(label: '현재 신청 인원', value: detail.currentApplicants),
        SizedBox(height: 12.h),
        _InfoRow(label: '남은 인원', value: detail.remainingCapacity),
        SizedBox(height: 12.h),
        _InfoRow(label: '선착순 여부', value: detail.admissionType),
      ],
    ),
  );
}

class ProgramCancelledDetailBody extends StatelessWidget {
  const ProgramCancelledDetailBody({required this.detail, super.key});
  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Center(
        child: SizedBox(
          width: 326.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CancelledProgramSummary(detail: detail),
              SizedBox(height: 12.h),
              _ProgramCancellationAlert(detail: detail),
              SizedBox(height: 12.h),
              _ProgramStatusHistory(
                applicationSubmittedAt: detail.applicationSubmittedAt,
                statusText: '취소됨 (${detail.programStatusChangedAt})',
                gap: 8.h,
              ),
              SizedBox(height: 12.h),
              Text(
                '※ 프로그램은 취소되었지만 신청 내역은 확인할 수 있습니다.',
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProgramDeletedDetailBody extends StatelessWidget {
  const ProgramDeletedDetailBody({required this.detail, super.key});
  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: SingleChildScrollView(
      padding: EdgeInsets.only(top: 56.h, bottom: 16.h),
      child: Center(
        child: SizedBox(
          width: 326.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '삭제된 프로그램입니다.',
                textAlign: TextAlign.center,
                style: AppTypography.heading2.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                '운영에 의해 해당 프로그램 정보가\n삭제되었습니다.',
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(color: AppColors.neutral600),
              ),
              SizedBox(height: 20.h),
              _ProgramStatusHistory(
                applicationSubmittedAt: detail.applicationSubmittedAt,
                statusText: '삭제됨 (${detail.programStatusChangedAt})',
                gap: 12.h,
              ),
              SizedBox(height: 20.h),
              Text(
                '※ 프로그램은 삭제되었지만 신청 내역은 확인할 수 있습니다.',
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _CancelledProgramSummary extends StatelessWidget {
  const _CancelledProgramSummary({required this.detail});
  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: [
          _StatusPill(
            label: detail.typeLabel,
            backgroundColor: AppColors.primarySubtle,
            textColor: AppColors.primary,
          ),
          const _StatusPill(
            label: '프로그램 취소',
            backgroundColor: AppColors.dangerBackground,
            textColor: AppColors.error,
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(
        detail.title,
        style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
      ),
      SizedBox(height: 8.h),
      Text(
        '${detail.applicationPeriod}   ·   ${detail.viewCount}',
        style: AppTypography.caption.copyWith(color: AppColors.neutral600),
      ),
    ],
  );
}

class _ProgramCancellationAlert extends StatelessWidget {
  const _ProgramCancellationAlert({required this.detail});
  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => Container(
    key: const ValueKey('program-cancelled-alert'),
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.dangerBackground,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 14.w,
              color: AppColors.error,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                '해당 프로그램은 운영 사정으로 취소되었습니다.',
                style: AppTypography.captionMedium.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          '취소 사유',
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
        Text(
          detail.programCancellationReason,
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
        Text(
          '이용에 불편을 드려 죄송합니다.',
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class _ProgramStatusHistory extends StatelessWidget {
  const _ProgramStatusHistory({
    required this.applicationSubmittedAt,
    required this.statusText,
    required this.gap,
  });
  final String applicationSubmittedAt;
  final String statusText;
  final double gap;

  @override
  Widget build(BuildContext context) => Container(
    key: const ValueKey('program-status-history'),
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HistoryRow(label: '신청일', value: applicationSubmittedAt),
        SizedBox(height: gap),
        _HistoryRow(label: '상태', value: statusText),
      ],
    ),
  );
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 40.w,
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.neutral600,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(width: 8.w),
      Expanded(
        child: Text(
          value,
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
      ),
    ],
  );
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(999.r),
    ),
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: AppTypography.captionMedium.copyWith(color: textColor),
    ),
  );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(
          label,
          style: AppTypography.caption.copyWith(color: AppColors.neutral500),
        ),
      ),
      Text(
        value,
        style: AppTypography.captionMedium.copyWith(
          color: AppColors.neutral900,
        ),
      ),
    ],
  );
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: child,
  );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: AppColors.primarySubtle,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Text(
      label,
      style: AppTypography.captionMedium.copyWith(color: AppColors.primary),
    ),
  );
}
