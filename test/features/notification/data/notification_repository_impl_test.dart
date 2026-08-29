import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/notification/data/dto/notification_list_response_dto.dart'
    as dto;
import 'package:geti_app/features/notification/data/repository/notification_repository_impl.dart';
import 'package:geti_app/features/notification/domain/model/notification_summary.dart'
    as domain;

void main() {
  group('NotificationListApiResponseDto', () {
    test('Swagger 정상 응답과 pagination metadata를 파싱한다', () {
      final response = dto.NotificationListApiResponseDto.fromJson({
        'success': true,
        'data': {
          'content': [
            {
              'notificationId': 101,
              'notificationType': 'JOB_APPLICATION_STATUS_CHANGED',
              'title': '지원 상태가 변경되었습니다.',
              'content': '지원서가 검토 중으로 변경되었습니다.',
              'targetType': 'JOB_APPLICATION',
              'targetId': 55,
              'targetAvailable': true,
              'targetUnavailableReason': null,
              'deepLink': '/applications/55',
              'read': false,
              'readAt': null,
              'createdAt': '2026-08-29T08:30:00Z',
            },
          ],
          'page': 0,
          'size': 20,
          'totalElements': 21,
          'totalPages': 2,
          'first': true,
          'last': false,
          'unreadCount': 7,
        },
        'meta': {'requestId': 'request-1'},
      });

      expect(response.success, isTrue);
      expect(response.meta?.requestId, 'request-1');
      expect(response.data?.page, 0);
      expect(response.data?.size, 20);
      expect(response.data?.totalElements, 21);
      expect(response.data?.totalPages, 2);
      expect(response.data?.first, isTrue);
      expect(response.data?.last, isFalse);
      expect(response.data?.unreadCount, 7);
      final notification = response.data!.content.single;
      expect(
        notification.notificationType,
        dto.NotificationTypeDto.jobApplicationStatusChanged,
      );
      expect(
        notification.targetType,
        dto.NotificationTargetTypeDto.jobApplication,
      );
      expect(notification.targetUnavailableReason, isNull);
      expect(notification.isRead, isFalse);
      expect(notification.readAt, isNull);
      expect(notification.createdAt, DateTime.utc(2026, 8, 29, 8, 30));
    });

    test('nullable target 필드와 알 수 없는 enum 값을 안전하게 파싱한다', () {
      final response = dto.NotificationListApiResponseDto.fromJson({
        'success': true,
        'data': {
          'content': [
            {
              'notificationId': 1,
              'notificationType': 'FUTURE_TYPE',
              'title': '시스템 알림',
              'content': '내용',
              'targetType': null,
              'targetId': null,
              'targetAvailable': true,
              'targetUnavailableReason': null,
              'deepLink': null,
              'read': true,
              'readAt': '2026-08-29T09:00:00Z',
              'createdAt': '2026-08-29T08:30:00Z',
            },
          ],
          'page': 0,
          'size': 20,
          'totalElements': 1,
          'totalPages': 1,
          'first': true,
          'last': true,
          'unreadCount': 0,
        },
      });

      final notification = response.data!.content.single;
      expect(notification.notificationType, dto.NotificationTypeDto.unknown);
      expect(notification.targetType, isNull);
      expect(notification.targetId, isNull);
      expect(notification.deepLink, isNull);
      expect(notification.isRead, isTrue);
      expect(notification.readAt, isNotNull);
    });
  });

  group('NotificationRepositoryImpl', () {
    test('전체 페이지를 순서대로 조회하고 첫 페이지 unreadCount를 유지한다', () async {
      final client = _FakeRestClient({
        0: _response(
          content: [
            _item(
              id: 1,
              type: dto.NotificationTypeDto.jobPublished,
              targetType: dto.NotificationTargetTypeDto.job,
              targetId: 10,
              deepLink: '/jobs/10',
            ),
          ],
          page: 0,
          totalPages: 2,
          last: false,
          unreadCount: 9,
        ),
        1: _response(
          content: [
            _item(
              id: 2,
              type: dto.NotificationTypeDto.programDeleted,
              targetType: dto.NotificationTargetTypeDto.program,
              targetId: 20,
              targetAvailable: false,
              reason: dto.NotificationUnavailableReasonDto.deleted,
              isRead: true,
            ),
          ],
          page: 1,
          totalPages: 2,
          last: true,
          unreadCount: 8,
        ),
      });

      final result = await NotificationRepositoryImpl(
        client,
      ).getNotifications(unreadOnly: false);

      expect(client.calls, [(false, 0, 20), (false, 1, 20)]);
      expect(result.unreadCount, 9);
      expect(result.notifications, hasLength(2));
      expect(
        result.notifications.first.notificationType,
        domain.NotificationType.jobPublished,
      );
      expect(
        result.notifications.first.targetType,
        domain.NotificationTargetType.job,
      );
      expect(result.notifications.first.targetId, 10);
      expect(result.notifications.first.deepLink, '/jobs/10');
      expect(result.notifications.last.isRead, isTrue);
      expect(
        result.notifications.last.targetUnavailableReason,
        domain.NotificationUnavailableReason.deleted,
      );
    });

    test('읽지 않음 조회 여부를 API에 전달한다', () async {
      final client = _FakeRestClient({
        0: _response(
          content: const [],
          page: 0,
          totalPages: 1,
          last: true,
          unreadCount: 0,
        ),
      });

      await NotificationRepositoryImpl(
        client,
      ).getNotifications(unreadOnly: true);

      expect(client.calls, [(true, 0, 20)]);
    });

    test('네트워크 예외를 호출자에게 전달한다', () async {
      final client = _FakeRestClient({}, error: Exception('network'));

      expect(
        () => NotificationRepositoryImpl(
          client,
        ).getNotifications(unreadOnly: false),
        throwsException,
      );
    });

    test('필수 알림 필드가 없으면 FormatException을 발생시킨다', () async {
      final client = _FakeRestClient({
        0: _response(
          content: const [
            dto.NotificationSummaryResponseDto(
              notificationId: 1,
              title: '제목',
              content: '내용',
              targetAvailable: true,
              isRead: false,
            ),
          ],
          page: 0,
          totalPages: 1,
          last: true,
          unreadCount: 1,
        ),
      });

      expect(
        () => NotificationRepositoryImpl(
          client,
        ).getNotifications(unreadOnly: false),
        throwsA(isA<FormatException>()),
      );
    });
  });
}

class _FakeRestClient implements RestClient {
  _FakeRestClient(this.responses, {this.error});

  final Map<int, dto.NotificationListApiResponseDto> responses;
  final Object? error;
  final calls = <(bool, int, int)>[];

  @override
  Future<dto.NotificationListApiResponseDto> getNotifications({
    bool unreadOnly = false,
    String? notificationType,
    int page = 0,
    int size = 20,
  }) async {
    calls.add((unreadOnly, page, size));
    if (error case final error?) throw error;
    return responses[page]!;
  }
}

dto.NotificationListApiResponseDto _response({
  required List<dto.NotificationSummaryResponseDto> content,
  required int page,
  required int totalPages,
  required bool last,
  required int unreadCount,
}) {
  return dto.NotificationListApiResponseDto(
    success: true,
    data: dto.NotificationListResponseDto(
      content: content,
      page: page,
      size: 20,
      totalElements: content.length,
      totalPages: totalPages,
      first: page == 0,
      last: last,
      unreadCount: unreadCount,
    ),
  );
}

dto.NotificationSummaryResponseDto _item({
  required int id,
  required dto.NotificationTypeDto type,
  dto.NotificationTargetTypeDto? targetType,
  int? targetId,
  bool targetAvailable = true,
  dto.NotificationUnavailableReasonDto? reason,
  String? deepLink,
  bool isRead = false,
}) {
  return dto.NotificationSummaryResponseDto(
    notificationId: id,
    notificationType: type,
    title: '제목 $id',
    content: '내용 $id',
    targetType: targetType,
    targetId: targetId,
    targetAvailable: targetAvailable,
    targetUnavailableReason: reason,
    deepLink: deepLink,
    isRead: isRead,
    readAt: isRead ? DateTime.utc(2026, 8, 29, 9) : null,
    createdAt: DateTime.utc(2026, 8, 29, 8),
  );
}
