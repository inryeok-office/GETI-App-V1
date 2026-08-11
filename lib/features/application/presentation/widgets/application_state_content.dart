import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ApplicationStateContent extends StatelessWidget {
  const ApplicationStateContent({
    required this.status,
    required this.onRetry,
    super.key,
  });

  final ApplicationScreenStatus status;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final definition = switch (status) {
      ApplicationScreenStatus.loading => const _StateDefinition(
        icon: '◔',
        iconColor: Color(0xFF0A5994),
        title: '불러오는 중이에요.',
        description: '잠시만 기다려 주세요.',
      ),
      ApplicationScreenStatus.networkError => const _StateDefinition(
        icon: '!',
        iconColor: Color(0xFFE0383D),
        title: '네트워크 연결에 실패했습니다.',
        description: '인터넷 연결을 확인한 후\n다시 시도해 주세요.',
        actionLabel: '다시 시도',
      ),
      ApplicationScreenStatus.empty => const _StateDefinition(
        icon: '□',
        iconColor: Color(0xFF0A5994),
        title: '지원 내역이 없습니다.',
        description: '지원한 공고가 없습니다.\n새로운 공고에 지원해 보세요.',
        actionLabel: '새로운 공고 둘러보기',
      ),
      ApplicationScreenStatus.loaded => throw StateError(
        '목록 상태는 ApplicationStateContent에서 표시하지 않습니다.',
      ),
    };

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.w,
              height: 72.h,
              decoration: const BoxDecoration(
                color: AppColors.stateIconBackground,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                definition.icon,
                key: status == ApplicationScreenStatus.loading
                    ? const ValueKey('application-loading-icon')
                    : null,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 28.sp,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: definition.iconColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              definition.title,
              textAlign: TextAlign.center,
              style: AppTypography.heading3.copyWith(
                color: AppColors.stateTitle,
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 280.w,
              child: Text(
                definition.description,
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(
                  color: AppColors.stateDescription,
                ),
              ),
            ),
            if (definition.actionLabel != null) ...[
              SizedBox(height: 16.h),
              SizedBox(
                width: 280.w,
                height: 42.h,
                child: FilledButton(
                  onPressed: status == ApplicationScreenStatus.networkError
                      ? onRetry
                      : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    disabledForegroundColor: AppColors.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                  ),
                  child: Text(
                    definition.actionLabel!,
                    style: AppTypography.caption.copyWith(
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

class _StateDefinition {
  const _StateDefinition({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    this.actionLabel,
  });
  final String icon;
  final Color iconColor;
  final String title;
  final String description;
  final String? actionLabel;
}
