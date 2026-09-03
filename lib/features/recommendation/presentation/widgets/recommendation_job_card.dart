import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/suitability_level.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class RecommendationJobCard extends StatelessWidget {
  const RecommendationJobCard({
    required this.job,
    this.isUninterested = false,
    this.isBookmarked = false,
    this.onUninterestedTap,
    this.onBookmarkTap,
    super.key,
  });

  final RecommendationJob job;
  final bool isUninterested;
  final bool isBookmarked;
  final VoidCallback? onUninterestedTap;
  final VoidCallback? onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    final fitLabel = job.suitabilityLevel?.figmaLabel;
    final summary = job.summary?.trim();

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
            children: [
              Expanded(
                child: Text(
                  job.companyName,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
              ),
              Semantics(
                button: true,
                label: isBookmarked ? '저장 해제' : '저장',
                child: InkResponse(
                  key: ValueKey(isBookmarked ? 'bookmark-filled' : 'bookmark'),
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
          SizedBox(height: 4.h),
          Text(
            job.positionName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          if (summary != null && summary.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              summary,
              style: AppTypography.caption.copyWith(
                color: AppColors.neutral600,
              ),
            ),
          ],
          if (_shouldShowJobMessage(job)) ...[
            SizedBox(height: 8.h),
            _JobMessage(job: job),
          ],
          if (job.tags.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: job.tags.map((tag) => _Tag(label: tag)).toList(),
            ),
          ],
          if (job.availability !=
              RecommendationJobAvailability.unavailable) ...[
            SizedBox(height: 16.h),
            if (job.availability == RecommendationJobAvailability.closed)
              _OutlinedAction(label: '공고 보기', expanded: true)
            else
              Row(
                children: [
                  if (fitLabel != null) ...[
                    _FitBadge(label: fitLabel),
                    SizedBox(width: 16.w),
                  ],
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _OutlinedAction(
                        label: isUninterested ? '해제' : '관심 없음',
                        onTap: onUninterestedTap,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ],
      ),
    );
  }
}

bool _shouldShowJobMessage(RecommendationJob job) {
  if (job.availability != RecommendationJobAvailability.active) {
    return true;
  }
  return job.matchReason?.trim().isNotEmpty ?? false;
}

class _JobMessage extends StatelessWidget {
  const _JobMessage({required this.job});

  final RecommendationJob job;

  @override
  Widget build(BuildContext context) {
    final (text, style, icon) = switch (job.availability) {
      RecommendationJobAvailability.active => (
        job.matchReason ?? '',
        AppTypography.caption.copyWith(color: AppColors.primary),
        true,
      ),
      RecommendationJobAvailability.closed => (
        '마감된 공고입니다.\n지원 기간이 종료되어 더이상 지원할 수 없습니다.',
        AppTypography.captionMedium.copyWith(color: AppColors.neutral600),
        false,
      ),
      RecommendationJobAvailability.unavailable => (
        '삭제 또는 비공개 처리되어 더이상 접근할 수 없습니다.',
        AppTypography.captionMedium.copyWith(color: AppColors.neutral600),
        false,
      ),
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon) ...[
          SvgPicture.asset(
            'assets/icons/sparkles.svg',
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 8.w),
        ],
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
}

class _FitBadge extends StatelessWidget {
  const _FitBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: AppTypography.label.copyWith(color: AppColors.primary),
      ),
    );
  }
}

class _OutlinedAction extends StatelessWidget {
  const _OutlinedAction({
    required this.label,
    this.expanded = false,
    this.onTap,
  });

  final String label;
  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : 100,
      height: 44,
      child: Material(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.neutral200),
          borderRadius: BorderRadius.circular(8.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.neutral600,
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
