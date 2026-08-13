import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/program/presentation/view_model/program_detail_view_model.dart';
import 'package:geti_app/features/program/presentation/widgets/program_detail_sections.dart';
import 'package:geti_app/features/program/presentation/widgets/program_application_overlay.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class ProgramDetailView extends ConsumerWidget {
  const ProgramDetailView({required this.programId, super.key});
  final String programId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(programDetailViewModelProvider(programId));
    final viewModel = ref.read(
      programDetailViewModelProvider(programId).notifier,
    );
    final detail = state.detail;
    if (detail == null) {
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
            key: const ValueKey('program-detail-back'),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/programs');
              }
            },
            icon: Icon(Icons.chevron_left, size: 28.w),
            color: AppColors.neutral600,
          ),
          titleSpacing: 0,
          title: Text(
            '?꾨줈洹몃옩 ?곸꽭',
            style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
          ),
        ),
        body: Center(
          child: Text(
            '프로그램 정보를 찾을 수 없습니다.',
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.neutral600,
            ),
          ),
        ),
      );
    }
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            toolbarHeight: 56.h,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.surface,
            surfaceTintColor: AppColors.surface,
            shape: const Border(
              bottom: BorderSide(color: AppColors.neutral200),
            ),
            leadingWidth: 52.w,
            leading: IconButton(
              key: const ValueKey('program-detail-back'),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/programs');
                }
              },
              icon: Icon(Icons.chevron_left, size: 28.w),
              color: AppColors.neutral600,
            ),
            titleSpacing: 0,
            title: Text(
              '프로그램 상세',
              style: AppTypography.heading2.copyWith(
                color: AppColors.neutral900,
              ),
            ),
          ),
          body: ProgramDetailBody(
            detail: detail,
            onApply: viewModel.applyProgram,
            onCancel: () => _showCancelConfirmation(context, viewModel),
          ),
        ),
        if (detail.actionStatus == ProgramDetailActionStatus.applying)
          const ProgramApplyingOverlay(),
        if (detail.actionStatus == ProgramDetailActionStatus.cancelling)
          const ProgramCancellingOverlay(),
        if (detail.actionStatus == ProgramDetailActionStatus.cancelled)
          ProgramCancelSuccessOverlay(
            detail: detail,
            onGoToPrograms: () => context.go('/programs'),
          ),
        if (detail.actionStatus == ProgramDetailActionStatus.cancelFailure)
          ProgramCancelFailureOverlay(
            onRetry: viewModel.cancelProgram,
            onClose: viewModel.closeCancelFailure,
          ),
        if (detail.actionStatus == ProgramDetailActionStatus.concurrencyFailure)
          ProgramConcurrencyFailureOverlay(
            onConfirm: viewModel.confirmConcurrencyFailure,
          ),
      ],
    );
  }

  Future<void> _showCancelConfirmation(
    BuildContext context,
    ProgramDetailViewModel viewModel,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0x40111111),
      builder: (sheetContext) => ProgramCancelConfirmBottomSheet(
        onCancel: () {
          Navigator.of(sheetContext).pop();
          viewModel.cancelProgram();
        },
        onContinue: () => Navigator.of(sheetContext).pop(),
      ),
    );
  }
}

class ProgramDetailBody extends StatelessWidget {
  const ProgramDetailBody({
    required this.detail,
    this.onApply,
    this.onCancel,
    super.key,
  });
  final ProgramDetail detail;
  final VoidCallback? onApply;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Center(
            child: SizedBox(
              width: 326.w,
              child: Column(
                children: [
                  ProgramDetailSummary(detail: detail),
                  SizedBox(height: 12.h),
                  ProgramDetailField(label: '일정', value: detail.schedule),
                  SizedBox(height: 12.h),
                  ProgramDetailField(label: '장소', value: detail.location),
                  SizedBox(height: 12.h),
                  ProgramDetailField(label: '정원', value: detail.capacity),
                  SizedBox(height: 12.h),
                  ProgramDetailField(
                    label: '프로그램 설명',
                    value: detail.description,
                  ),
                  SizedBox(height: 12.h),
                  ProgramApplicationInfo(detail: detail),
                ],
              ),
            ),
          ),
        ),
      ),
      ProgramDetailAction(
        status: detail.actionStatus,
        onApply: onApply,
        onCancel: onCancel,
      ),
    ],
  );
}

class ProgramDetailAction extends StatelessWidget {
  const ProgramDetailAction({
    required this.status,
    this.onApply,
    this.onCancel,
    super.key,
  });
  final ProgramDetailActionStatus status;
  final VoidCallback? onApply;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final showsPrimaryAction =
        status == ProgramDetailActionStatus.available ||
        status == ProgramDetailActionStatus.applying ||
        status == ProgramDetailActionStatus.concurrencyFailure;
    final showsCancelAction =
        status == ProgramDetailActionStatus.applied ||
        status == ProgramDetailActionStatus.cancelling ||
        status == ProgramDetailActionStatus.cancelFailure;
    final isFilledAction = showsPrimaryAction || showsCancelAction;
    final label = switch (status) {
      ProgramDetailActionStatus.available => '신청하기',
      ProgramDetailActionStatus.applying => '신청하기',
      ProgramDetailActionStatus.concurrencyFailure => '신청하기',
      ProgramDetailActionStatus.upcoming => '모집 전입니다.',
      ProgramDetailActionStatus.full => '정원이 마감되었습니다.',
      ProgramDetailActionStatus.closed => '신청 기간이 종료되었습니다.',
      ProgramDetailActionStatus.applied => '신청 취소',
      ProgramDetailActionStatus.cancelling => '신청 취소',
      ProgramDetailActionStatus.cancelled => '신청 취소 완료',
      ProgramDetailActionStatus.cancelFailure => '신청 취소',
    };
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.w, 12.h, 32.w, 16.h),
        child: Material(
          key: ValueKey('program-detail-action-${status.name}'),
          color: isFilledAction
              ? (showsCancelAction ? AppColors.error : AppColors.primary)
              : AppColors.background,
          borderRadius: BorderRadius.circular(8.r),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: switch (status) {
              ProgramDetailActionStatus.available => onApply,
              ProgramDetailActionStatus.applied => onCancel,
              _ => null,
            },
            child: Container(
              width: double.infinity,
              height: 42.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: isFilledAction
                    ? null
                    : Border.all(color: AppColors.neutral200),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                label,
                style: AppTypography.caption.copyWith(
                  color: isFilledAction
                      ? AppColors.onPrimary
                      : AppColors.neutral600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
