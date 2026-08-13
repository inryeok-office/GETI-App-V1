import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class CompanyEmptySearchState extends StatelessWidget {
  const CompanyEmptySearchState({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.search_off, size: 48.w, color: AppColors.neutral600),
        SizedBox(height: 24.h),
        Text(
          '검색 결과가 없습니다.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '검색어를 확인하거나 다른 키워드로 검색해보세요.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class CompanyLoadingState extends StatelessWidget {
  const CompanyLoadingState({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      '기업 정보를 불러오는 중...',
      style: AppTypography.body.copyWith(color: AppColors.neutral500),
    ),
  );
}

class CompanyNetworkErrorState extends StatelessWidget {
  const CompanyNetworkErrorState({required this.onRetry, super.key});
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => Center(
    child: InkWell(
      key: const ValueKey('company-retry'),
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
              '기업 정보를 불러오지 못했습니다.',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.neutral900,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '잠시 후 다시 시도해 주세요.',
              style: AppTypography.body.copyWith(color: AppColors.neutral600),
            ),
          ],
        ),
      ),
    ),
  );
}

class CompanyNoActiveJobsState extends StatelessWidget {
  const CompanyNoActiveJobsState({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '현재 채용 중인 공고가 없습니다.',
          style: AppTypography.body.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '새로운 공고가 등록되면 다시 확인해 보세요.',
          textAlign: TextAlign.center,
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}
