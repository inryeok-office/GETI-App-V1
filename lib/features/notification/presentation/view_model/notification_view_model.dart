import 'dart:async';

import 'package:geti_app/features/notification/data/repository/notification_repository_impl.dart';
import 'package:geti_app/features/notification/domain/model/notification_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_view_model.g.dart';

enum NotificationScreenStatus { loaded, loading, networkError }

enum NotificationFilter { all, unread }

enum NotificationTargetState { deleted, forbidden }

enum NotificationTapAction {
  targetDeleted('notification-target-deleted'),
  targetForbidden('notification-target-forbidden');

  const NotificationTapAction(this.routeName);

  final String routeName;
}

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isRead,
    this.targetState,
    this.notificationType,
    this.targetType,
    this.targetId,
    this.targetAvailable = true,
    this.targetUnavailableReason,
    this.deepLink,
    this.readAt,
    this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final String time;
  final bool isRead;
  final NotificationTargetState? targetState;
  final NotificationType? notificationType;
  final NotificationTargetType? targetType;
  final int? targetId;
  final bool targetAvailable;
  final NotificationUnavailableReason? targetUnavailableReason;
  final String? deepLink;
  final DateTime? readAt;
  final DateTime? createdAt;

  NotificationItem copyWith({bool? isRead}) {
    return NotificationItem(
      id: id,
      title: title,
      description: description,
      time: time,
      isRead: isRead ?? this.isRead,
      targetState: targetState,
      notificationType: notificationType,
      targetType: targetType,
      targetId: targetId,
      targetAvailable: targetAvailable,
      targetUnavailableReason: targetUnavailableReason,
      deepLink: deepLink,
      readAt: readAt,
      createdAt: createdAt,
    );
  }
}

class NotificationViewState {
  const NotificationViewState({
    this.screenStatus = NotificationScreenStatus.loading,
    this.selectedFilter = NotificationFilter.all,
    this.notifications = const [],
    this.unreadCount = 0,
  });

  final NotificationScreenStatus screenStatus;
  final NotificationFilter selectedFilter;
  final List<NotificationItem> notifications;
  final int unreadCount;

  List<NotificationItem> get visibleNotifications => notifications;

  NotificationViewState copyWith({
    NotificationScreenStatus? screenStatus,
    NotificationFilter? selectedFilter,
    List<NotificationItem>? notifications,
    int? unreadCount,
  }) {
    return NotificationViewState(
      screenStatus: screenStatus ?? this.screenStatus,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}

@riverpod
class NotificationViewModel extends _$NotificationViewModel {
  var _requestSerial = 0;

  @override
  NotificationViewState build() {
    unawaited(Future<void>.microtask(_loadNotifications));
    return const NotificationViewState();
  }

  void selectFilter(NotificationFilter filter) {
    if (state.selectedFilter == filter) return;
    state = state.copyWith(selectedFilter: filter);
    unawaited(_loadNotifications());
  }

  Future<void> retry() => _loadNotifications();

  Future<void> _loadNotifications() async {
    final requestSerial = ++_requestSerial;
    final filter = state.selectedFilter;
    state = state.copyWith(
      screenStatus: NotificationScreenStatus.loading,
      notifications: const [],
    );

    try {
      final result = await ref
          .read(notificationRepositoryProvider)
          .getNotifications(unreadOnly: filter == NotificationFilter.unread);
      if (!ref.mounted || requestSerial != _requestSerial) return;

      state = state.copyWith(
        screenStatus: NotificationScreenStatus.loaded,
        notifications: result.notifications
            .map(_toPresentation)
            .toList(growable: false),
        unreadCount: result.unreadCount,
      );
    } on Object {
      if (!ref.mounted || requestSerial != _requestSerial) return;
      state = state.copyWith(
        screenStatus: NotificationScreenStatus.networkError,
        notifications: const [],
      );
    }
  }

  NotificationItem _toPresentation(NotificationSummary notification) {
    return NotificationItem(
      id: notification.notificationId.toString(),
      title: notification.title,
      description: notification.content,
      time: _formatRelativeTime(notification.createdAt),
      isRead: notification.isRead,
      targetState: _toTargetState(notification),
      notificationType: notification.notificationType,
      targetType: notification.targetType,
      targetId: notification.targetId,
      targetAvailable: notification.targetAvailable,
      targetUnavailableReason: notification.targetUnavailableReason,
      deepLink: notification.deepLink,
      readAt: notification.readAt,
      createdAt: notification.createdAt,
    );
  }

  NotificationTargetState? _toTargetState(NotificationSummary notification) {
    if (notification.targetAvailable) return null;
    return switch (notification.targetUnavailableReason) {
      NotificationUnavailableReason.deleted => NotificationTargetState.deleted,
      NotificationUnavailableReason.notVisible ||
      NotificationUnavailableReason.forbidden =>
        NotificationTargetState.forbidden,
      NotificationUnavailableReason.unknown || null => null,
    };
  }

  void markAsRead(String id) {
    final target = state.notifications
        .where((notification) => notification.id == id)
        .firstOrNull;
    if (target == null || target.isRead) return;

    state = state.copyWith(
      notifications: [
        for (final notification in state.notifications)
          notification.id == id
              ? notification.copyWith(isRead: true)
              : notification,
      ],
      unreadCount: state.unreadCount > 0
          ? state.unreadCount - 1
          : state.unreadCount,
    );
  }

  NotificationTapAction? handleNotificationTap(NotificationItem notification) {
    markAsRead(notification.id);

    return switch (notification.targetState) {
      NotificationTargetState.deleted => NotificationTapAction.targetDeleted,
      NotificationTargetState.forbidden =>
        NotificationTapAction.targetForbidden,
      null => null,
    };
  }

  void markAllAsRead() {
    state = state.copyWith(
      notifications: [
        for (final notification in state.notifications)
          notification.copyWith(isRead: true),
      ],
      unreadCount: 0,
    );
  }

  String _formatRelativeTime(DateTime createdAt) {
    final difference = DateTime.now().difference(createdAt.toLocal());
    if (difference.isNegative || difference < const Duration(minutes: 1)) {
      return '방금';
    }
    if (difference < const Duration(hours: 1)) {
      return '${difference.inMinutes}분 전';
    }
    if (difference < const Duration(days: 1)) {
      return '${difference.inHours}시간 전';
    }
    if (difference < const Duration(days: 2)) {
      return '어제';
    }
    return '${difference.inDays}일 전';
  }
}
