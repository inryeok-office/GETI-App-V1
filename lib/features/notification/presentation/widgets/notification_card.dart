import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/notification/presentation/view_model/notification_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, this.onTap, super.key});

  final NotificationItem notification;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8.r);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: notification.isRead
                ? AppColors.surface
                : AppColors.primarySurface,
            border: Border.all(color: AppColors.background),
            borderRadius: borderRadius,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 82.h),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!notification.isRead) ...[
                              Padding(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Container(
                                  key: ValueKey(
                                    'notification-unread-${notification.id}',
                                  ),
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                            ],
                            Expanded(
                              child: Text(
                                notification.title,
                                style: AppTypography.label.copyWith(
                                  color: AppColors.neutral900,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        notification.time,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.neutral600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    notification.description,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral600,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
