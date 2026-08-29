import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/notification/data/dto/notification_list_response_dto.dart';
import 'package:geti_app/features/notification/domain/model/notification_summary.dart';
import 'package:geti_app/features/notification/domain/repository/notification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository_impl.g.dart';

const _notificationPageSize = 20;

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl(this._client);

  final RestClient _client;

  @override
  Future<NotificationListResult> getNotifications({
    required bool unreadOnly,
  }) async {
    final notifications = <NotificationSummary>[];
    var unreadCount = 0;
    var page = 0;

    while (true) {
      final response = await _client.getNotifications(
        unreadOnly: unreadOnly,
        page: page,
        size: _notificationPageSize,
      );
      final data = response.data;
      if (response.success != true || data == null) {
        throw StateError('알림 목록 조회에 실패했습니다.');
      }

      final pageUnreadCount = data.unreadCount;
      final last = data.last;
      final totalPages = data.totalPages;
      if (pageUnreadCount == null || last == null || totalPages == null) {
        throw const FormatException('알림 목록 응답의 페이지 정보가 올바르지 않습니다.');
      }

      if (page == 0) {
        unreadCount = pageUnreadCount;
      }
      notifications.addAll(data.content.map(_toDomain));

      final nextPage = page + 1;
      if (last || nextPage >= totalPages) break;
      page = nextPage;
    }

    return NotificationListResult(
      notifications: List.unmodifiable(notifications),
      unreadCount: unreadCount,
    );
  }

  NotificationSummary _toDomain(NotificationSummaryResponseDto dto) {
    final notificationId = dto.notificationId;
    final title = dto.title;
    final content = dto.content;
    final targetAvailable = dto.targetAvailable;
    final isRead = dto.isRead;
    final createdAt = dto.createdAt;
    if (notificationId == null ||
        title == null ||
        content == null ||
        targetAvailable == null ||
        isRead == null ||
        createdAt == null) {
      throw const FormatException('알림 응답의 필수 필드가 없습니다.');
    }

    return NotificationSummary(
      notificationId: notificationId,
      notificationType: _toNotificationType(dto.notificationType),
      title: title,
      content: content,
      targetType: _toTargetType(dto.targetType),
      targetId: dto.targetId,
      targetAvailable: targetAvailable,
      targetUnavailableReason: _toUnavailableReason(
        dto.targetUnavailableReason,
      ),
      deepLink: dto.deepLink,
      isRead: isRead,
      readAt: dto.readAt,
      createdAt: createdAt,
    );
  }

  NotificationType? _toNotificationType(NotificationTypeDto? type) {
    if (type == null) return null;
    return switch (type) {
      NotificationTypeDto.jobPublished => NotificationType.jobPublished,
      NotificationTypeDto.jobUpdated => NotificationType.jobUpdated,
      NotificationTypeDto.jobClosed => NotificationType.jobClosed,
      NotificationTypeDto.jobDeleted => NotificationType.jobDeleted,
      NotificationTypeDto.jobApplicationStatusChanged =>
        NotificationType.jobApplicationStatusChanged,
      NotificationTypeDto.programPublished => NotificationType.programPublished,
      NotificationTypeDto.programUpdated => NotificationType.programUpdated,
      NotificationTypeDto.programClosed => NotificationType.programClosed,
      NotificationTypeDto.programDeleted => NotificationType.programDeleted,
      NotificationTypeDto.programApplicationApplied =>
        NotificationType.programApplicationApplied,
      NotificationTypeDto.programApplicationCanceled =>
        NotificationType.programApplicationCanceled,
      NotificationTypeDto.programVacancyAvailable =>
        NotificationType.programVacancyAvailable,
      NotificationTypeDto.inquiryAnswered => NotificationType.inquiryAnswered,
      NotificationTypeDto.memberApprovalResult =>
        NotificationType.memberApprovalResult,
      NotificationTypeDto.system => NotificationType.system,
      NotificationTypeDto.unknown => NotificationType.unknown,
    };
  }

  NotificationTargetType? _toTargetType(NotificationTargetTypeDto? type) {
    if (type == null) return null;
    return switch (type) {
      NotificationTargetTypeDto.job => NotificationTargetType.job,
      NotificationTargetTypeDto.jobApplication =>
        NotificationTargetType.jobApplication,
      NotificationTargetTypeDto.program => NotificationTargetType.program,
      NotificationTargetTypeDto.portfolioRequest =>
        NotificationTargetType.portfolioRequest,
      NotificationTargetTypeDto.inquiry => NotificationTargetType.inquiry,
      NotificationTargetTypeDto.memberApproval =>
        NotificationTargetType.memberApproval,
      NotificationTargetTypeDto.unknown => NotificationTargetType.unknown,
    };
  }

  NotificationUnavailableReason? _toUnavailableReason(
    NotificationUnavailableReasonDto? reason,
  ) {
    if (reason == null) return null;
    return switch (reason) {
      NotificationUnavailableReasonDto.deleted =>
        NotificationUnavailableReason.deleted,
      NotificationUnavailableReasonDto.notVisible =>
        NotificationUnavailableReason.notVisible,
      NotificationUnavailableReasonDto.forbidden =>
        NotificationUnavailableReason.forbidden,
      NotificationUnavailableReasonDto.unknown =>
        NotificationUnavailableReason.unknown,
    };
  }
}

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepositoryImpl(ref.watch(restClientProvider));
}
