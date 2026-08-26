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

    final Widget body = switch (state.screenStatus) {
      JobDetailScreenStatus.loading => const _JobDetailLoading(),
      JobDetailScreenStatus.notFound => const _JobNotFound(),
      JobDetailScreenStatus.networkError => _JobDetailNetworkError(
        onRetry: () =>
            ref.read(jobDetailViewModelProvider(jobId).notifier).retry(),
      ),
      JobDetailScreenStatus.loaded when job == null || detail == null =>
        const _JobNotFound(),
      JobDetailScreenStatus.loaded => _JobDetailBody(
        jobId: jobId,
        job: job!,
        detail: detail!,
        viewCount: state.viewCount,
        aiAnalysis:
            state.aiAnalysis ??
            const JobAiAnalysis(status: JobAiAnalysisStatus.pending),
      ),
    };

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
      body: body,
    );
  }
}

class _JobDetailLoading extends StatelessWidget {
  const _JobDetailLoading();
  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      '공고를 불러오는 중...',
      style: AppTypography.body.copyWith(color: AppColors.neutral500),
    ),
  );
}

class _JobDetailNetworkError extends StatelessWidget {
  const _JobDetailNetworkError({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: InkWell(
      key: const ValueKey('job-detail-retry'),
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
              '공고를 불러오지 못했어요.',
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
    required this.jobId,
    required this.job,
    required this.detail,
    required this.viewCount,
    required this.aiAnalysis,
  });
  final String jobId;
  final JobItem job;
  final JobDetail detail;
  final int viewCount;
  final JobAiAnalysis aiAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSchool = job.applicationMethod == JobApplicationMethod.internal;

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
                    SizedBox(height: 24.h),
                    _JobApplicationInfoCard(
                      job: job,
                      detail: detail,
                      viewCount: viewCount,
                    ),
                    if (detail.attachments.isNotEmpty) ...[
                      SizedBox(height: 24.h),
                      _JobAttachmentSection(attachments: detail.attachments),
                    ],
                    SizedBox(height: 16.h),
                    _AiAnalysisCard(
                      analysis: aiAnalysis,
                      onRetry: () => ref
                          .read(jobDetailViewModelProvider(jobId).notifier)
                          .retryAiAnalysis(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _JobDetailAction(
          job: job,
          detail: detail,
          isBookmarked: job.bookmarked,
          onBookmarkTap: () => ref
              .read(jobDetailViewModelProvider(jobId).notifier)
              .toggleBookmark(),
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
  const _JobAttachmentSection({required this.attachments});
  final List<JobAttachment> attachments;

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
        for (final attachment in attachments)
          Padding(
            padding: EdgeInsets.only(
              bottom: attachment == attachments.last ? 0 : 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attachment.name,
                  style: AppTypography.body.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  attachment.sizeLabel,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

class _AiAnalysisCard extends StatelessWidget {
  const _AiAnalysisCard({required this.analysis, required this.onRetry});
  final JobAiAnalysis analysis;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final (
      badgeLabel,
      badgeBackground,
      badgeForeground,
    ) = switch (analysis.status) {
      JobAiAnalysisStatus.completed => (
        '분석 완료',
        AppColors.primarySubtle,
        AppColors.primary,
      ),
      JobAiAnalysisStatus.pending => (
        '분석 대기 중',
        AppColors.background,
        AppColors.neutral600,
      ),
      JobAiAnalysisStatus.failed => (
        '분석 실패',
        AppColors.dangerBackground,
        AppColors.error,
      ),
      JobAiAnalysisStatus.insufficientInfo => (
        '분석 정보 부족',
        AppColors.warningBackground,
        AppColors.warning,
      ),
      JobAiAnalysisStatus.reanalyzing => (
        '재분석 중',
        AppColors.background,
        AppColors.neutral600,
      ),
    };

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AI 공고 분석',
                style: AppTypography.heading3.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: badgeBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  badgeLabel,
                  style: AppTypography.captionMedium.copyWith(
                    color: badgeForeground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'AI 분석 결과는 참고용입니다.',
            style: AppTypography.caption.copyWith(color: AppColors.neutral600),
          ),
          SizedBox(height: 16.h),
          switch (analysis.status) {
            JobAiAnalysisStatus.completed => _AiAnalysisCompleted(
              analysis: analysis,
            ),
            JobAiAnalysisStatus.pending => const _AiAnalysisBanner(
              background: AppColors.primarySurface,
              rotating: false,
              title: 'AI가 공고 내용을 분석하고 있습니다.',
              subtitle: '잠시만 기다려주세요.',
            ),
            JobAiAnalysisStatus.reanalyzing => const _AiAnalysisBanner(
              background: AppColors.primarySurface,
              rotating: true,
              title: 'AI가 다시 분석하고 있습니다.',
              subtitle: '잠시만 기다려주세요.',
            ),
            JobAiAnalysisStatus.failed => _AiAnalysisBanner(
              background: AppColors.dangerBackground,
              rotating: false,
              title: 'AI 분석 중 문제가 발생했습니다.',
              subtitle: '다시 시도해주세요.',
              actionLabel: '재시도',
              onAction: onRetry,
            ),
            JobAiAnalysisStatus.insufficientInfo => const _AiAnalysisBanner(
              background: AppColors.warningBackground,
              rotating: false,
              title: '공고 내용이 부족하여 분석할 수 없습니다.',
              subtitle: '다른 공고를 확인해주세요.',
            ),
          },
        ],
      ),
    );
  }
}

class _AiAnalysisBanner extends StatefulWidget {
  const _AiAnalysisBanner({
    required this.background,
    required this.rotating,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final Color background;
  final bool rotating;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  State<_AiAnalysisBanner> createState() => _AiAnalysisBannerState();
}

class _AiAnalysisBannerState extends State<_AiAnalysisBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _syncAnimation();
  }

  @override
  void didUpdateWidget(covariant _AiAnalysisBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rotating != widget.rotating) {
      _syncAnimation();
    }
  }

  void _syncAnimation() {
    if (widget.rotating) {
      _controller.repeat();
    } else {
      _controller
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(
      'assets/icons/alert_circle.svg',
      width: 20.w,
      height: 20.w,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          widget.rotating
              ? RotationTransition(
                  key: const ValueKey('job-ai-analysis-spinner'),
                  turns: _controller,
                  child: icon,
                )
              : icon,
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTypography.label.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  widget.subtitle,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
          ),
          if (widget.actionLabel != null)
            OutlinedButton(
              key: const ValueKey('job-ai-analysis-retry'),
              onPressed: widget.onAction,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.neutral600,
                side: const BorderSide(color: AppColors.neutral200),
                backgroundColor: AppColors.surface,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                widget.actionLabel!,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AiAnalysisCompleted extends StatelessWidget {
  const _AiAnalysisCompleted({required this.analysis});
  final JobAiAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 24.h),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.neutral200)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '핵심 요약',
                style: AppTypography.label.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                analysis.summary ?? '',
                style: AppTypography.body.copyWith(color: AppColors.neutral600),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        _AiAnalysisTagGroup(title: '필수 기술 및 도구', tags: analysis.requiredSkills),
        SizedBox(height: 16.h),
        _AiAnalysisTagGroup(
          title: '우대 기술 및 경험',
          tags: analysis.preferredSkills,
        ),
        SizedBox(height: 16.h),
        _AiAnalysisTagGroup(
          title: '지원 적합성',
          tags: analysis.fitTags,
          highlighted: true,
        ),
        if (analysis.difficulty != null) ...[
          SizedBox(height: 16.h),
          _AiAnalysisTagGroup(title: '난이도', tags: [analysis.difficulty!]),
        ],
      ],
    );
  }
}

class _AiAnalysisTagGroup extends StatelessWidget {
  const _AiAnalysisTagGroup({
    required this.title,
    required this.tags,
    this.highlighted = false,
  });

  final String title;
  final List<String> tags;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.label.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 8.h,
          children: tags
              .map(
                (tag) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: highlighted
                        ? AppColors.primarySubtle
                        : AppColors.background,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    tag,
                    style: AppTypography.captionMedium.copyWith(
                      color: highlighted
                          ? AppColors.primary
                          : AppColors.neutral600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(growable: false),
        ),
      ],
    );
  }
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
    final isSchool = job.applicationMethod == JobApplicationMethod.internal;
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
      // 어떤 공고에 대한 지원서 작성/이어쓰기인지 다음 화면(Application
      // 도메인)이 알 수 있도록 jobId를 함께 전달합니다.
      context.push('/applications?jobId=${job.id}');
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
