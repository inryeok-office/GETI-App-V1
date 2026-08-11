import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ProgramEmptyState extends StatelessWidget {
  const ProgramEmptyState({required this.isAppliedTab, super.key});
  final bool isAppliedTab;
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.find_in_page_outlined,
          size: 48.w,
          color: AppColors.neutral600,
        ),
        SizedBox(height: 24.h),
        Text(
          isAppliedTab ? '신청한 프로그램이 없어요.' : '프로그램이 없어요.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          isAppliedTab ? '아직 신청한 프로그램이 없습니다.' : '현재 등록된 프로그램이 없습니다.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class ProgramLoadingState extends StatelessWidget {
  const ProgramLoadingState({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      '프로그램을 불러오는 중...',
      style: AppTypography.body.copyWith(color: AppColors.neutral500),
    ),
  );
}

class ProgramNetworkErrorState extends StatelessWidget {
  const ProgramNetworkErrorState({required this.onRetry, super.key});
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => Center(
    child: InkWell(
      key: const ValueKey('program-retry'),
      onTap: onRetry,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 48.w,
              color: AppColors.neutral600,
            ),
            SizedBox(height: 24.h),
            Text(
              '프로그램을 불러오지 못했어요.',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.neutral900,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '연결 상태를 확인한 뒤 다시 시도해 주세요.',
              style: AppTypography.body.copyWith(color: AppColors.neutral600),
            ),
          ],
        ),
      ),
    ),
  );
}
