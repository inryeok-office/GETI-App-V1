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
            _Badge(label: detail.category),
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
