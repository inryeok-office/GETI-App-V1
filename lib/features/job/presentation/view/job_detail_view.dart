import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/job/presentation/view_model/job_detail_view_model.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailView extends ConsumerWidget {
  const JobDetailView({required this.jobId, super.key});
  final String jobId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jobDetailViewModelProvider(jobId));
    final job = state.job;
    final detail = state.detail;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 56.h,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: const Border(bottom: BorderSide(color: AppColors.neutral200)),
        leadingWidth: 52.w,
        leading: IconButton(
          key: const ValueKey('job-detail-back'),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/jobs');
            }
          },
          icon: Icon(Icons.chevron_left, size: 28.w),
          color: AppColors.neutral600,
        ),
        titleSpacing: 0,
        title: Text(
          '공고 상세',
          style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
        ),
      ),
      body: job == null || detail == null
          ? const _JobNotFound()
          : _JobDetailBody(
              job: job,
              detail: detail,
              viewCount: state.viewCount,
            ),
    );
  }
}

class _JobNotFound extends StatelessWidget {
  const _JobNotFound();
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 48.w, color: AppColors.neutral600),
        SizedBox(height: 16.h),
        Text(
          '해당 공고를 찾을 수 없습니다.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '해당 공고는 삭제되었거나 마감되었습니다.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class _JobDetailBody extends ConsumerWidget {
  const _JobDetailBody({
    required this.job,
    required this.detail,
    required this.viewCount,
  });
  final JobItem job;
  final JobDetail detail;
  final int viewCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(
      jobViewModelProvider.select((s) => s.bookmarkedJobIds.contains(job.id)),
    );
    final isSchool = job.source == JobSource.school;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Center(
              child: SizedBox(
                width: 326.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _JobSummaryCard(job: job, isSchool: isSchool),
                    SizedBox(height: 24.h),
                    _Section(title: '공고 소개', body: detail.description),
                    _BulletSection(
                      title: '주요 업무',
                      items: detail.responsibilities,
                    ),
                    _BulletSection(
                      title: '자격 요건',
                      items: detail.qualifications,
                    ),
                    _BulletSection(
                      title: '우대 사항',
                      items: detail.preferredQualifications,
                    ),
                    _BulletSection(
                      title: '근무 조건',
                      items: detail.workConditions,
                    ),
                    _HiringProcessSection(steps: detail.hiringProcess),
                    SizedBox(height: 24.h),
                    _JobApplicationInfoCard(
                      job: job,
                      detail: detail,
                      viewCount: viewCount,
                    ),
                    if (detail.attachmentName != null) ...[
                      SizedBox(height: 24.h),
                      _JobAttachmentSection(
                        name: detail.attachmentName!,
                        description: detail.attachmentDescription ?? '',
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        _JobDetailAction(
          job: job,
          detail: detail,
          isBookmarked: isBookmarked,
          onBookmarkTap: () =>
              ref.read(jobViewModelProvider.notifier).toggleBookmark(job.id),
        ),
      ],
    );
  }
}

class _JobSummaryCard extends StatelessWidget {
  const _JobSummaryCard({required this.job, required this.isSchool});
  final JobItem job;
  final bool isSchool;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.neutral200),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                job.companyName,
                style: AppTypography.body.copyWith(color: AppColors.neutral900),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          job.title,
          style: AppTypography.heading1.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.primarySubtle,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                isSchool ? '학교' : '외부',
                style: AppTypography.captionMedium.copyWith(
                  color: AppColors.primary,
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
      ],
    ),
  );
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Text(
          body,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.neutral800),
        ),
      ],
    ),
  );
}

class _BulletSection extends StatelessWidget {
  const _BulletSection({required this.title, required this.items});
  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 12.h),
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '·  ',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.neutral800,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.neutral800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HiringProcessSection extends StatelessWidget {
  const _HiringProcessSection({required this.steps});
  final List<String> steps;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '채용 절차',
        style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
      ),
      SizedBox(height: 12.h),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (var i = 0; i < steps.length; i++) ...[
            if (i > 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  Icons.chevron_right,
                  size: 16.w,
                  color: AppColors.neutral500,
                ),
              ),
            Text(
              steps[i],
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.neutral800,
              ),
            ),
          ],
        ],
      ),
    ],
  );
}

class _JobApplicationInfoCard extends StatelessWidget {
  const _JobApplicationInfoCard({
    required this.job,
    required this.detail,
    required this.viewCount,
  });
  final JobItem job;
  final JobDetail detail;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String)>[
      ('모집 기간', detail.recruitmentPeriod),
      ('마감일', job.dDayLabel ?? '마감'),
      ('지원 유형', detail.applicationTypeLabel),
      if (detail.sourceName != null) ('공고 출처', detail.sourceName!),
      if (detail.targetAudience != null) ('지원 대상', detail.targetAudience!),
      ('조회수', '$viewCount회'),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.neutral200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '지원 정보',
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 16.h),
          for (final row in rows)
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    row.$1,
                    style: AppTypography.body.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      row.$2,
                      textAlign: TextAlign.right,
                      style: AppTypography.body.copyWith(
                        color: AppColors.neutral900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (detail.externalUrl != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '원문 URL',
                  style: AppTypography.body.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
                Flexible(
                  child: Text(
                    detail.externalUrl!,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.body.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _JobAttachmentSection extends StatelessWidget {
  const _JobAttachmentSection({required this.name, required this.description});
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '첨부파일',
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Text(
          name,
          style: AppTypography.body.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 4.h),
        Text(
          description,
          style: AppTypography.caption.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class _JobDetailAction extends StatelessWidget {
  const _JobDetailAction({
    required this.job,
    required this.detail,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  final JobItem job;
  final JobDetail detail;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    final isSchool = job.source == JobSource.school;
    final isClosed = job.isClosed;
    final isIneligible = !isClosed && !job.canApply;
    final isDisabled = isClosed || isIneligible;
    final buttonLabel = switch ((isClosed, isIneligible)) {
      (true, _) => '마감된 공고입니다',
      (false, true) => job.eligibilityReason ?? '지원할 수 없는 공고입니다',
      (false, false) => isSchool ? '지원서 작성하기' : '사이트에서 지원하기',
    };
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.w, 12.h, 32.w, 16.h),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 42.h,
              child: ElevatedButton(
                key: const ValueKey('job-detail-apply'),
                onPressed: isDisabled
                    ? null
                    : () => _onApply(context, isSchool),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  disabledBackgroundColor: AppColors.background,
                  disabledForegroundColor: AppColors.neutral600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: isDisabled
                        ? const BorderSide(color: AppColors.neutral200)
                        : BorderSide.none,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                ),
                child: Text(
                  buttonLabel,
                  textAlign: TextAlign.center,
                  style: AppTypography.label.copyWith(
                    color: isDisabled
                        ? AppColors.neutral600
                        : AppColors.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              height: 42.h,
              child: OutlinedButton.icon(
                key: const ValueKey('job-detail-bookmark'),
                onPressed: onBookmarkTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.neutral900,
                  side: const BorderSide(color: AppColors.neutral200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                icon: SvgPicture.asset(
                  isBookmarked
                      ? 'assets/icons/bookmark_fill.svg'
                      : 'assets/icons/bookmark.svg',
                  width: 18.w,
                  height: 18.w,
                ),
                label: Text(
                  isBookmarked ? '북마크 해제하기' : '북마크하기',
                  style: AppTypography.label.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onApply(BuildContext context, bool isSchool) {
    if (isSchool) {
      context.push('/applications');
      return;
    }
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text(
          '외부 채용 페이지로 이동합니다.',
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
        content: Text(
          '${detail.sourceName ?? '외부 사이트'}(${detail.externalUrl ?? ''})에서'
          ' 지원을 계속해 주세요.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
        actions: [
          TextButton(
            key: const ValueKey('job-detail-apply-external-confirm'),
            onPressed: () {
              Navigator.of(context).pop();
              _launchExternalUrl(detail.externalUrl);
            },
            child: Text(
              '확인',
              style: AppTypography.label.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchExternalUrl(String? rawUrl) async {
    if (rawUrl == null) return;
    final normalized = rawUrl.startsWith('http') ? rawUrl : 'https://$rawUrl';
    final uri = Uri.tryParse(normalized);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
