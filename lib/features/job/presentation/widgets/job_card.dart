import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    required this.job,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkTap,
    super.key,
  });

  final JobItem job;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    final isSchool = job.source == JobSource.school;
    return Opacity(
      opacity: job.isClosed ? 0.6 : 1,
      child: Material(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.neutral200),
          borderRadius: BorderRadius.circular(16.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(color: AppColors.neutral200),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        job.companyName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.body.copyWith(
                          color: AppColors.neutral600,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Semantics(
                      button: true,
                      label: isBookmarked ? '저장 해제' : '저장',
                      child: InkResponse(
                        key: ValueKey(
                          isBookmarked
                              ? 'job-bookmark-filled-${job.id}'
                              : 'job-bookmark-${job.id}',
                        ),
                        onTap: onBookmarkTap,
                        radius: 20.r,
                        child: Padding(
                          padding: EdgeInsets.all(4.w),
                          child: SvgPicture.asset(
                            isBookmarked
                                ? 'assets/icons/bookmark_fill.svg'
                                : 'assets/icons/bookmark.svg',
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  job.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSchool
                            ? AppColors.primarySubtle
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        isSchool ? '학교' : '외부',
                        style: AppTypography.captionMedium.copyWith(
                          color: isSchool
                              ? AppColors.primary
                              : AppColors.neutral500,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        job.sourceDescriptor,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.neutral600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 16.w,
                        runSpacing: 4.h,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _MetaTag(
                            iconPath: 'assets/icons/location_pin.svg',
                            label: job.location,
                          ),
                          _MetaTag(
                            iconPath: 'assets/icons/briefcase.svg',
                            label: job.jobType,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          job.dDayLabel ?? '마감',
                          style: AppTypography.bodyLarge.copyWith(
                            color: job.isClosed
                                ? AppColors.neutral500
                                : AppColors.neutral900,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          job.deadlineLabel,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.neutral600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MetaTag extends StatelessWidget {
  const _MetaTag({required this.iconPath, required this.label});

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(iconPath, width: 14.w, height: 14.w),
        SizedBox(width: 4.w),
        Text(
          label,
          style: AppTypography.caption.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
