import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/application/presentation/view_model/application_detail_view_model.dart';
import 'package:geti_app/features/application/presentation/widgets/application_detail_sections.dart';
import 'package:geti_app/features/application/presentation/widgets/application_detail_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class ApplicationDetailView extends ConsumerWidget {
  const ApplicationDetailView({required this.applicationId, super.key});

  final String applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(applicationDetailViewModelProvider(applicationId));
    final viewModel = ref.read(
      applicationDetailViewModelProvider(applicationId).notifier,
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: const Border(bottom: BorderSide(color: AppColors.neutral200)),
        leadingWidth: 52,
        leading: IconButton(
          key: const ValueKey('application-detail-back'),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/applications');
            }
          },
          icon: const Icon(Icons.chevron_left, size: 28),
          color: AppColors.neutral600,
        ),
        titleSpacing: 0,
        title: Text(
          '지원 상세',
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
      ),
      body: ApplicationDetailBody(
        state: state,
        onRetry: viewModel.retry,
        onBrowseJobs: () => context.go('/jobs'),
        onWithdraw: () => _confirmWithdraw(context, viewModel),
        onResubmit: viewModel.resubmitApplication,
      ),
    );
  }

  Future<void> _confirmWithdraw(
    BuildContext context,
    ApplicationDetailViewModel viewModel,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          surfaceTintColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            '지원을 취소하시겠습니까?',
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          content: Text(
            '재지원 시 이전에 제출한 답변과 첨부 파일은 자동으로 불러오지 않으며, 처음부터 다시 작성해야 합니다.',
            style: AppTypography.body.copyWith(color: AppColors.neutral600),
          ),
          actions: [
            TextButton(
              key: const ValueKey('application-withdraw-close'),
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                '닫기',
                style: AppTypography.label.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
            ),
            TextButton(
              key: const ValueKey('application-withdraw-confirm'),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                '지원 취소',
                style: AppTypography.label.copyWith(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !context.mounted) return;
    viewModel.withdrawApplication();
  }
}

class ApplicationDetailBody extends StatelessWidget {
  const ApplicationDetailBody({
    required this.state,
    required this.onRetry,
    required this.onBrowseJobs,
    required this.onWithdraw,
    required this.onResubmit,
    super.key,
  });

  final ApplicationDetailViewState state;
  final VoidCallback onRetry;
  final VoidCallback onBrowseJobs;
  final VoidCallback onWithdraw;
  final VoidCallback onResubmit;

  @override
  Widget build(BuildContext context) {
    if (state.screenStatus != ApplicationDetailScreenStatus.loaded) {
      return ApplicationDetailStateContent(
        status: state.screenStatus,
        onRetry: onRetry,
        onBrowseJobs: onBrowseJobs,
      );
    }

    final detail = state.detail!;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Center(
              child: SizedBox(
                width: 326.w,
                child: Column(
                  children: [
                    ApplicationDetailSummary(detail: detail),
                    if (detail.noticeTitle != null) ...[
                      SizedBox(height: 12.h),
                      ApplicationDetailNotice(detail: detail),
                    ],
                    for (final answer in detail.answers) ...[
                      SizedBox(height: 12.h),
                      SubmittedAnswerSection(
                        title: answer.title,
                        answer: answer.value,
                      ),
                    ],
                    for (final file in detail.files) ...[
                      SizedBox(height: 12.h),
                      ApplicationAttachmentSection(
                        fileName: file.name,
                        fileDescription: file.description,
                      ),
                    ],
                    if (detail.history.isNotEmpty) ...[
                      SizedBox(height: 12.h),
                      ApplicationStatusHistorySection(history: detail.history),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        if (detail.variant == ApplicationDetailVariant.revisionRequested ||
            detail.variant == ApplicationDetailVariant.submitted)
          _ApplicationDetailActions(
            variant: detail.variant,
            onWithdraw: onWithdraw,
            onResubmit: onResubmit,
          ),
      ],
    );
  }
}

class _ApplicationDetailActions extends StatelessWidget {
  const _ApplicationDetailActions({
    required this.variant,
    required this.onWithdraw,
    required this.onResubmit,
  });

  final ApplicationDetailVariant variant;
  final VoidCallback onWithdraw;
  final VoidCallback onResubmit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.w, 12.h, 32.w, 16.h),
        child: Row(
          children: [
            Expanded(
              flex: variant == ApplicationDetailVariant.revisionRequested
                  ? 114
                  : 1,
              child: _ActionButton(
                key: const ValueKey('application-detail-withdraw'),
                label: '지원 취소',
                foregroundColor: AppColors.error,
                borderColor: AppColors.error,
                onTap: onWithdraw,
              ),
            ),
            if (variant == ApplicationDetailVariant.revisionRequested) ...[
              SizedBox(width: 16.w),
              Expanded(
                flex: 196,
                child: _ActionButton(
                  key: const ValueKey('application-detail-resubmit'),
                  label: '웹에서 수정·재제출',
                  foregroundColor: AppColors.onPrimary,
                  backgroundColor: AppColors.primary,
                  onTap: onResubmit,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.foregroundColor,
    required this.onTap,
    this.backgroundColor = AppColors.surface,
    this.borderColor,
    super.key,
  });

  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: borderColor == null
                  ? null
                  : Border.all(color: borderColor!),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              label,
              maxLines: 1,
              style: AppTypography.label.copyWith(color: foregroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
