import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/application/presentation/view_model/application_detail_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ApplicationDetailStateContent extends StatelessWidget {
  const ApplicationDetailStateContent({
    required this.status,
    required this.onRetry,
    this.onBrowseJobs,
    super.key,
  });

  final ApplicationDetailScreenStatus status;
  final VoidCallback onRetry;
  final VoidCallback? onBrowseJobs;

  @override
  Widget build(BuildContext context) {
    if (status == ApplicationDetailScreenStatus.loading) {
      return _StateLayout(
        icon: SizedBox(
          key: const ValueKey('application-detail-loading'),
          width: 40.w,
          height: 40.h,
          child: const CircularProgressIndicator(
            strokeWidth: 4,
            color: AppColors.primary,
            backgroundColor: AppColors.primaryAccent,
          ),
        ),
        title: '불러오는 중이에요.',
        description: '잠시만 기다려 주세요.',
      );
    }
    if (status == ApplicationDetailScreenStatus.networkError) {
      return _StateLayout(
        icon: Icon(Icons.error_outline, size: 44.sp, color: AppColors.error),
        title: '네트워크 연결에 실패했습니다.',
        description: '인터넷 연결 상태를 확인한 후 다시 시도해 주세요.',
        actionLabel: '다시 시도',
        onAction: onRetry,
      );
    }
    return _StateLayout(
      icon: Icon(Icons.search, size: 44.sp, color: AppColors.neutral600),
      title: '지원 내역이 없습니다.',
      description: '지원한 공고가 없다면 새로운 공고에 지원해 보세요.',
      actionLabel: '공고 둘러보기',
      onAction: onBrowseJobs,
    );
  }
}

class _StateLayout extends StatelessWidget {
  const _StateLayout({
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
  });

  final Widget icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 326.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(height: 24.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTypography.heading3.copyWith(
                color: AppColors.stateTitle,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTypography.body.copyWith(color: AppColors.stateBody),
            ),
            if (actionLabel != null) ...[
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: onAction == null
                    ? Semantics(
                        button: true,
                        enabled: false,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            actionLabel!,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ),
                      )
                    : FilledButton(
                        onPressed: onAction,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(actionLabel!, style: AppTypography.caption),
                      ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
