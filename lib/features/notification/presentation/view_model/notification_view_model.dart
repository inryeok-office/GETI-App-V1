import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_view_model.g.dart';

enum NotificationScreenStatus {
  loaded,
  loading,
  networkError,
  targetDeleted,
  targetForbidden,
}

enum NotificationFilter { all, unread }

enum NotificationTargetState { deleted, forbidden }

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isRead,
    this.targetState,
  });

  final String id;
  final String title;
  final String description;
  final String time;
  final bool isRead;
  final NotificationTargetState? targetState;

  NotificationItem copyWith({bool? isRead}) {
    return NotificationItem(
      id: id,
      title: title,
      description: description,
      time: time,
      isRead: isRead ?? this.isRead,
      targetState: targetState,
    );
  }
}

class NotificationViewState {
  const NotificationViewState({
    this.screenStatus = NotificationScreenStatus.loaded,
    this.selectedFilter = NotificationFilter.all,
    this.notifications = mockNotifications,
  });

  final NotificationScreenStatus screenStatus;
  final NotificationFilter selectedFilter;
  final List<NotificationItem> notifications;

  int get unreadCount =>
      notifications.where((notification) => !notification.isRead).length;

  List<NotificationItem> get visibleNotifications {
    return switch (selectedFilter) {
      NotificationFilter.all => notifications,
      NotificationFilter.unread =>
        notifications
            .where((notification) => !notification.isRead)
            .toList(growable: false),
    };
  }

  NotificationViewState copyWith({
    NotificationScreenStatus? screenStatus,
    NotificationFilter? selectedFilter,
    List<NotificationItem>? notifications,
  }) {
    return NotificationViewState(
      screenStatus: screenStatus ?? this.screenStatus,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      notifications: notifications ?? this.notifications,
    );
  }
}

@riverpod
class NotificationViewModel extends _$NotificationViewModel {
  @override
  NotificationViewState build() => const NotificationViewState();

  void selectFilter(NotificationFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  void markAsRead(String id) {
    state = state.copyWith(
      notifications: [
        for (final notification in state.notifications)
          notification.id == id
              ? notification.copyWith(isRead: true)
              : notification,
      ],
    );
  }

  void markAllAsRead() {
    state = state.copyWith(
      notifications: [
        for (final notification in state.notifications)
          notification.copyWith(isRead: true),
      ],
    );
  }

  Future<void> retry() async {
    state = state.copyWith(screenStatus: NotificationScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = state.copyWith(screenStatus: NotificationScreenStatus.loaded);
  }
}

const mockNotifications = [
  NotificationItem(
    id: 'application-status',
    title: '지원 상태가 변경되었습니다.',
    description: '토스페이먼츠 지원서가 검토 중으로 변경되었습니다.',
    time: '방금',
    isRead: false,
  ),
  NotificationItem(
    id: 'matched-jobs',
    title: '새로운 맞춤 공고가 도착했습니다.',
    description: '기술 스택과 잘 맞는 공고 3개를 확인해 보세요.',
    time: '1시간 전',
    isRead: false,
  ),
  NotificationItem(
    id: 'program-applied',
    title: '프로그램 신청이 완료되었습니다.',
    description: '프론트엔드 특강 신청이 완료되었습니다.',
    time: '어제',
    isRead: true,
    targetState: NotificationTargetState.deleted,
  ),
  NotificationItem(
    id: 'portfolio-request',
    title: '포트폴리오 제출 요청',
    description: '2026 상반기 포트폴리오 제출 요청이 도착했습니다.',
    time: '2일 전',
    isRead: true,
    targetState: NotificationTargetState.forbidden,
  ),
];
