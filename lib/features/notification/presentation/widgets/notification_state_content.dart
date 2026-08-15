import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

enum NotificationStateContentType {
  emptyAll,
  emptyUnread,
  loading,
  networkError,
  targetDeleted,
  targetForbidden,
}

class NotificationStateContent extends StatelessWidget {
  const NotificationStateContent({
    required this.type,
    this.onAction,
    super.key,
  });

  final NotificationStateContentType type;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final definition = _definitionFor(type);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 48.w,
              height: 48.h,
              child: Center(child: definition.icon),
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
              width: 326.w,
              child: Text(
                definition.description,
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(color: AppColors.stateBody),
              ),
            ),
            if (definition.actionLabel != null) ...[
              SizedBox(height: 16.h),
              SizedBox(
                width: 280.w,
                height: 42.h,
                child: FilledButton(
                  key: ValueKey('notification-action-${type.name}'),
                  onPressed: onAction,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
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

  _StateDefinition _definitionFor(NotificationStateContentType type) {
    return switch (type) {
      NotificationStateContentType.emptyAll => _StateDefinition(
        icon: SvgPicture.asset(
          'assets/icons/notification_bell_off.svg',
          width: 40.w,
          height: 40.h,
        ),
        title: '알림이 없어요',
        description: '새로운 알림이 도착하면 여기에 표시됩니다.',
      ),
      NotificationStateContentType.emptyUnread => _StateDefinition(
        icon: SvgPicture.asset(
          'assets/icons/notification_bell_off.svg',
          width: 40.w,
          height: 40.h,
        ),
        title: '읽지 않은 알림이 없어요',
        description: '모든 알림을 확인했어요.',
      ),
      NotificationStateContentType.loading => _StateDefinition(
        icon: SvgPicture.asset(
          'assets/icons/loading.svg',
          key: const ValueKey('notification-loading-icon'),
          width: 48.w,
          height: 48.h,
        ),
        title: '알림을 불러오는 중이에요.',
        description: '잠시만 기다려 주세요.',
      ),
      NotificationStateContentType.networkError => _StateDefinition(
        icon: SvgPicture.asset(
          'assets/icons/notification_wifi_off.svg',
          width: 48.w,
          height: 48.h,
        ),
        title: '알림을 불러오지 못했어요',
        description: '네트워크 연결을 확인하고 다시 시도해 주세요.',
        actionLabel: '다시 시도',
      ),
      NotificationStateContentType.targetDeleted => _StateDefinition(
        icon: SvgPicture.asset(
          'assets/icons/notification_delete.svg',
          width: 32.w,
          height: 36.h,
        ),
        title: '삭제된 항목이에요.',
        description: '해당 공고 또는 프로그램이 삭제되어 내용을\n확인할 수 없어요.',
        actionLabel: '알림 목록으로',
      ),
      NotificationStateContentType.targetForbidden => _StateDefinition(
        icon: SvgPicture.asset(
          'assets/icons/notification_lock.svg',
          width: 48.w,
          height: 48.h,
        ),
        title: '접근할 수 없는 항목이에요.',
        description: '현재 계정으로는 해당 내용을 확인할 수 없어요.',
        actionLabel: '알림 목록으로',
      ),
    };
  }
}

class _StateDefinition {
  const _StateDefinition({
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
  });

  final Widget icon;
  final String title;
  final String description;
  final String? actionLabel;
}
