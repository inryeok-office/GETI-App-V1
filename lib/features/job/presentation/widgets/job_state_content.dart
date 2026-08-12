import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class JobEmptySearchState extends StatelessWidget {
  const JobEmptySearchState({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.search_off, size: 48.w, color: AppColors.neutral600),
        SizedBox(height: 24.h),
        Text(
          '검색 결과가 없어요.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '다른 검색어로 다시 시도해 주세요.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class JobLoadingState extends StatelessWidget {
  const JobLoadingState({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      '채용 공고를 불러오는 중...',
      style: AppTypography.body.copyWith(color: AppColors.neutral500),
    ),
  );
}

class JobNetworkErrorState extends StatelessWidget {
  const JobNetworkErrorState({required this.onRetry, super.key});
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => Center(
    child: InkWell(
      key: const ValueKey('job-retry'),
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
              '채용 공고를 불러오지 못했어요.',
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

class JobBookmarkEmptyState extends StatelessWidget {
  const JobBookmarkEmptyState({this.onBrowseJobs, super.key});
  final VoidCallback? onBrowseJobs;
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.bookmark_border, size: 48.w, color: AppColors.neutral600),
        SizedBox(height: 24.h),
        Text(
          '북마크한 공고가 없습니다.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '관심 있는 공고를 북마크하여 한곳에서 확인해 보세요.',
          textAlign: TextAlign.center,
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
        if (onBrowseJobs != null) ...[
          SizedBox(height: 16.h),
          SizedBox(
            height: 42.h,
            child: FilledButton(
              onPressed: onBrowseJobs,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
              child: Text(
                '공고 보러 가기',
                style: AppTypography.label.copyWith(color: AppColors.onPrimary),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
