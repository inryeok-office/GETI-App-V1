import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/program/presentation/view_model/program_detail_view_model.dart';
import 'package:geti_app/features/program/presentation/widgets/program_detail_sections.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class ProgramDetailView extends ConsumerWidget {
  const ProgramDetailView({required this.programId, super.key});
  final String programId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(programDetailViewModelProvider(programId)).detail!;
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
          '프로그램 상세',
          style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
        ),
      ),
      body: ProgramDetailBody(detail: detail),
    );
  }
}

class ProgramDetailBody extends StatelessWidget {
  const ProgramDetailBody({required this.detail, super.key});
  final ProgramDetail detail;

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
      ProgramDetailAction(status: detail.actionStatus),
    ],
  );
}

class ProgramDetailAction extends StatelessWidget {
  const ProgramDetailAction({required this.status, super.key});
  final ProgramDetailActionStatus status;

  @override
  Widget build(BuildContext context) {
    final isAvailable = status == ProgramDetailActionStatus.available;
    final label = switch (status) {
      ProgramDetailActionStatus.available => '신청하기',
      ProgramDetailActionStatus.upcoming => '모집 전입니다.',
      ProgramDetailActionStatus.full => '정원이 마감되었습니다.',
      ProgramDetailActionStatus.closed => '신청 기간이 종료되었습니다.',
      ProgramDetailActionStatus.applied => '신청 완료',
    };
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.w, 12.h, 32.w, 16.h),
        child: Container(
          key: ValueKey('program-detail-action-${status.name}'),
          width: double.infinity,
          height: 42.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isAvailable ? AppColors.primary : AppColors.background,
            border: isAvailable
                ? null
                : Border.all(color: AppColors.neutral200),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            label,
            style: AppTypography.caption.copyWith(
              color: isAvailable ? AppColors.onPrimary : AppColors.neutral600,
            ),
          ),
        ),
      ),
    );
  }
}
