enum NotificationType {
  jobPublished,
  jobUpdated,
  jobClosed,
  jobDeleted,
  jobApplicationStatusChanged,
  programPublished,
  programUpdated,
  programClosed,
  programDeleted,
  programApplicationApplied,
  programApplicationCanceled,
  programVacancyAvailable,
  inquiryAnswered,
  memberApprovalResult,
  system,
  unknown,
}

enum NotificationTargetType {
  job,
  jobApplication,
  program,
  portfolioRequest,
  inquiry,
  memberApproval,
  unknown,
}

enum NotificationUnavailableReason { deleted, notVisible, forbidden, unknown }

class NotificationListResult {
  const NotificationListResult({
    required this.notifications,
    required this.unreadCount,
  });

  final List<NotificationSummary> notifications;
  final int unreadCount;
}

class NotificationSummary {
  const NotificationSummary({
    required this.notificationId,
    required this.notificationType,
    required this.title,
    required this.content,
    required this.targetType,
    required this.targetId,
    required this.targetAvailable,
    required this.targetUnavailableReason,
    required this.deepLink,
    required this.isRead,
    required this.readAt,
    required this.createdAt,
  });

  final int notificationId;
  final NotificationType? notificationType;
  final String title;
  final String content;
  final NotificationTargetType? targetType;
  final int? targetId;
  final bool targetAvailable;
  final NotificationUnavailableReason? targetUnavailableReason;
  final String? deepLink;
  final bool isRead;
  final DateTime? readAt;
  final DateTime createdAt;
}
