import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/notification/presentation/view_model/notification_view_model.dart';
import 'package:geti_app/features/notification/presentation/widgets/notification_card.dart';
import 'package:geti_app/features/notification/presentation/widgets/notification_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationViewModelProvider);
    final viewModel = ref.read(notificationViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const NotificationAppBar(),
            Expanded(
              child: NotificationScreenBody(
                state: state,
                onFilterSelected: viewModel.selectFilter,
                onMarkAllAsRead: viewModel.markAllAsRead,
                onRetry: viewModel.retry,
                onNotificationTap: (notification) {
                  final action = viewModel.handleNotificationTap(notification);
                  if (action != null) {
                    context.pushNamed(action.routeName);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: AppBottomNavigation(
          currentIndex: 2,
          onTap: (index) => navigateToBottomTab(context, index),
        ),
      ),
    );
  }
}

class NotificationTargetDeletedView extends StatelessWidget {
  const NotificationTargetDeletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NotificationTargetStateView(
      type: NotificationStateContentType.targetDeleted,
    );
  }
}

class NotificationTargetForbiddenView extends StatelessWidget {
  const NotificationTargetForbiddenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NotificationTargetStateView(
      type: NotificationStateContentType.targetForbidden,
    );
  }
}

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({
    required this.state,
    required this.onFilterSelected,
    required this.onMarkAllAsRead,
    required this.onRetry,
    this.onNotificationTap,
    super.key,
  });

  final NotificationViewState state;
  final ValueChanged<NotificationFilter> onFilterSelected;
  final VoidCallback onMarkAllAsRead;
  final VoidCallback onRetry;
  final ValueChanged<NotificationItem>? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 326.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _NotificationHeader(
              selectedFilter: state.selectedFilter,
              unreadCount: state.unreadCount,
              onFilterSelected: onFilterSelected,
              onMarkAllAsRead: onMarkAllAsRead,
            ),
            SizedBox(height: 16.h),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return switch (state.screenStatus) {
      NotificationScreenStatus.loading => const NotificationStateContent(
        type: NotificationStateContentType.loading,
      ),
      NotificationScreenStatus.networkError => NotificationStateContent(
        type: NotificationStateContentType.networkError,
        onAction: onRetry,
      ),
      NotificationScreenStatus.loaded => _LoadedNotificationContent(
        state: state,
        onNotificationTap: onNotificationTap,
      ),
    };
  }
}

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      padding: EdgeInsets.only(left: 8.w, right: 20.w),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.neutral200)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 44.w,
            height: 44.h,
            child: IconButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.chevron_left, size: 24.w),
              color: AppColors.neutral600,
              padding: EdgeInsets.zero,
            ),
          ),
          Text(
            '알림',
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
        ],
      ),
    );
  }
}

class _NotificationHeader extends StatelessWidget {
  const _NotificationHeader({
    required this.selectedFilter,
    required this.unreadCount,
    required this.onFilterSelected,
    required this.onMarkAllAsRead,
  });

  final NotificationFilter selectedFilter;
  final int unreadCount;
  final ValueChanged<NotificationFilter> onFilterSelected;
  final VoidCallback onMarkAllAsRead;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48.h,
          child: Row(
            children: NotificationFilter.values
                .map((filter) {
                  final selected = selectedFilter == filter;
                  return Expanded(
                    child: InkWell(
                      key: ValueKey('notification-filter-${filter.name}'),
                      onTap: () => onFilterSelected(filter),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            filter == NotificationFilter.all ? '전체' : '읽지 않음',
                            style:
                                (selected
                                        ? AppTypography.label
                                        : AppTypography.body)
                                    .copyWith(
                                      color: selected
                                          ? AppColors.primary
                                          : AppColors.neutral600,
                                    ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: selected ? 2.h : 1.h,
                            color: selected
                                ? AppColors.primary
                                : AppColors.neutral200,
                          ),
                        ],
                      ),
                    ),
                  );
                })
                .toList(growable: false),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 32.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '읽지 않은 알림 $unreadCount개',
                style: AppTypography.captionMedium.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              InkWell(
                key: const ValueKey('notification-mark-all-read'),
                onTap: onMarkAllAsRead,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  child: Text(
                    '전체 읽음',
                    style: AppTypography.captionMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoadedNotificationContent extends StatelessWidget {
  const _LoadedNotificationContent({
    required this.state,
    required this.onNotificationTap,
  });

  final NotificationViewState state;
  final ValueChanged<NotificationItem>? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final notifications = state.visibleNotifications;
    if (notifications.isEmpty) {
      return NotificationStateContent(
        type: state.selectedFilter == NotificationFilter.unread
            ? NotificationStateContentType.emptyUnread
            : NotificationStateContentType.emptyAll,
      );
    }

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationCard(
          key: ValueKey('notification-card-${notification.id}'),
          notification: notification,
          onTap: onNotificationTap == null
              ? null
              : () => onNotificationTap!(notification),
        );
      },
    );
  }
}

class _NotificationTargetStateView extends StatelessWidget {
  const _NotificationTargetStateView({required this.type});

  final NotificationStateContentType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral50,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const NotificationAppBar(),
            Expanded(
              child: SizedBox(
                width: 326.w,
                child: NotificationStateContent(
                  type: type,
                  onAction: () => context.go('/notifications'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
