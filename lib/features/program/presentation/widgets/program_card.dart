import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/program/presentation/view_model/program_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({required this.program, this.onTap, super.key});
  final ProgramItem program;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final badge = switch (program.status) {
      ProgramRecruitmentStatus.recruiting => ('모집 중', true),
      ProgramRecruitmentStatus.full => ('정원 마감', true),
      ProgramRecruitmentStatus.upcoming => ('모집 예정', false),
      ProgramRecruitmentStatus.closed => ('신청기간 종료', false),
    };
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.neutral200),
        borderRadius: BorderRadius.circular(8.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  _Badge(label: badge.$1, isBrand: badge.$2),
                  if (program.isApplied)
                    const _Badge(label: '신청 완료', isBrand: true),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                program.title,
                style: AppTypography.heading3.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                program.schedule,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                program.location,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SizedBox(
                    width: 48.w,
                    child: Text(
                      '신청 기간',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      program.applicationPeriod,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.isBrand});
  final String label;
  final bool isBrand;
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: isBrand ? AppColors.primarySubtle : AppColors.background,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Text(
      label,
      style: AppTypography.captionMedium.copyWith(
        color: isBrand ? AppColors.primary : AppColors.neutral600,
      ),
    ),
  );
}
