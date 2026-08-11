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
      body: ApplicationDetailBody(state: state, onRetry: viewModel.retry),
    );
  }
}

class ApplicationDetailBody extends StatelessWidget {
  const ApplicationDetailBody({
    required this.state,
    required this.onRetry,
    super.key,
  });

  final ApplicationDetailViewState state;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (state.screenStatus != ApplicationDetailScreenStatus.loaded) {
      return ApplicationDetailStateContent(
        status: state.screenStatus,
        onRetry: onRetry,
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
                    SizedBox(height: 12.h),
                    SubmittedAnswerSection(answer: detail.answer),
                    SizedBox(height: 12.h),
                    ApplicationAttachmentSection(
                      fileName: detail.fileName,
                      fileDescription: detail.fileDescription,
                    ),
                    SizedBox(height: 12.h),
                    ApplicationStatusHistorySection(history: detail.history),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (detail.variant == ApplicationDetailVariant.revisionRequested ||
            detail.variant == ApplicationDetailVariant.submitted)
          _ApplicationDetailActions(variant: detail.variant),
      ],
    );
  }
}

class _ApplicationDetailActions extends StatelessWidget {
  const _ApplicationDetailActions({required this.variant});

  final ApplicationDetailVariant variant;

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
                label: '지원 취소',
                foregroundColor: AppColors.error,
                borderColor: AppColors.error,
              ),
            ),
            if (variant == ApplicationDetailVariant.revisionRequested) ...[
              SizedBox(width: 16.w),
              Expanded(
                flex: 196,
                child: Container(
                  height: 44.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '웹에서 수정·재제출',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 14.sp,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.14.sp,
                      color: AppColors.onPrimary,
                    ),
                  ),
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
    this.borderColor,
  });

  final String label;
  final Color foregroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: borderColor == null ? null : Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            label,
            maxLines: 1,
            style: AppTypography.label.copyWith(color: foregroundColor),
          ),
        ),
      ),
    );
  }
}
