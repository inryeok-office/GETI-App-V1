import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/notification/data/repository/notification_repository_impl.dart';
import 'package:geti_app/features/notification/domain/model/notification_summary.dart';
import 'package:geti_app/features/notification/domain/repository/notification_repository.dart';
import 'package:geti_app/features/notification/presentation/view_model/notification_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('초기 로딩 후 API 응답을 UI 모델로 변환한다', () async {
    final repository = _FakeNotificationRepository((unreadOnly) async {
      return NotificationListResult(
        unreadCount: 7,
        notifications: [
          _notification(
            id: 101,
            type: NotificationType.jobApplicationStatusChanged,
            targetType: NotificationTargetType.jobApplication,
            targetId: 55,
            deepLink: '/applications/55',
          ),
        ],
      );
    });
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    expect(harness.state.screenStatus, NotificationScreenStatus.loading);
    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.loaded,
    );

    expect(repository.calls, [false]);
    expect(harness.state.unreadCount, 7);
    final item = harness.state.notifications.single;
    expect(item.id, '101');
    expect(item.title, '제목 101');
    expect(item.description, '내용 101');
    expect(item.time, '방금');
    expect(item.notificationType, NotificationType.jobApplicationStatusChanged);
    expect(item.targetType, NotificationTargetType.jobApplication);
    expect(item.targetId, 55);
    expect(item.targetAvailable, isTrue);
    expect(item.deepLink, '/applications/55');
    expect(item.targetState, isNull);
  });

  test('서버 unreadCount를 현재 목록의 읽지 않은 개수와 별도로 유지한다', () async {
    final repository = _FakeNotificationRepository((unreadOnly) async {
      return NotificationListResult(
        unreadCount: 12,
        notifications: [_notification(id: 1, isRead: true)],
      );
    });
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.loaded,
    );

    expect(harness.state.notifications.single.isRead, isTrue);
    expect(harness.state.unreadCount, 12);
  });

  test('삭제/권한/비노출/미확인 대상 상태를 기존 화면 상태에 매핑한다', () async {
    final repository = _FakeNotificationRepository((unreadOnly) async {
      return NotificationListResult(
        unreadCount: 4,
        notifications: [
          _notification(
            id: 1,
            targetAvailable: false,
            reason: NotificationUnavailableReason.deleted,
          ),
          _notification(
            id: 2,
            targetAvailable: false,
            reason: NotificationUnavailableReason.forbidden,
          ),
          _notification(
            id: 3,
            targetAvailable: false,
            reason: NotificationUnavailableReason.notVisible,
          ),
          _notification(id: 4, targetAvailable: false),
        ],
      );
    });
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.loaded,
    );

    expect(harness.state.notifications.map((item) => item.targetState), [
      NotificationTargetState.deleted,
      NotificationTargetState.forbidden,
      NotificationTargetState.forbidden,
      null,
    ]);
  });

  test('nullable target와 readAt을 그대로 보존한다', () async {
    final readAt = DateTime.now().subtract(const Duration(minutes: 1));
    final repository = _FakeNotificationRepository((unreadOnly) async {
      return NotificationListResult(
        unreadCount: 0,
        notifications: [_notification(id: 1, isRead: true, readAt: readAt)],
      );
    });
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.loaded,
    );

    final item = harness.state.notifications.single;
    expect(item.targetType, isNull);
    expect(item.targetId, isNull);
    expect(item.deepLink, isNull);
    expect(item.readAt, readAt);
    expect(item.createdAt, isNotNull);
  });

  test('빈 응답을 loaded empty 상태로 표시한다', () async {
    final repository = _FakeNotificationRepository(
      (unreadOnly) async =>
          const NotificationListResult(notifications: [], unreadCount: 0),
    );
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.loaded,
    );

    expect(harness.state.notifications, isEmpty);
    expect(harness.state.unreadCount, 0);
  });

  test('네트워크 오류를 표시하고 retry로 다시 조회한다', () async {
    var attempts = 0;
    final repository = _FakeNotificationRepository((unreadOnly) async {
      attempts += 1;
      if (attempts == 1) throw Exception('network');
      return NotificationListResult(
        notifications: [_notification(id: 9)],
        unreadCount: 1,
      );
    });
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.networkError,
    );
    expect(harness.state.notifications, isEmpty);

    await harness.notifier.retry();

    expect(harness.state.screenStatus, NotificationScreenStatus.loaded);
    expect(harness.state.notifications.single.id, '9');
    expect(repository.calls, [false, false]);
  });

  test('읽지 않음 탭은 unreadOnly=true로 서버를 다시 조회한다', () async {
    final repository = _FakeNotificationRepository((unreadOnly) async {
      return NotificationListResult(
        unreadCount: 1,
        notifications: [_notification(id: unreadOnly ? 2 : 1)],
      );
    });
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(
      () => harness.state.screenStatus == NotificationScreenStatus.loaded,
    );
    harness.notifier.selectFilter(NotificationFilter.unread);
    await _waitUntil(
      () =>
          repository.calls.length == 2 &&
          harness.state.screenStatus == NotificationScreenStatus.loaded,
    );

    expect(repository.calls, [false, true]);
    expect(harness.state.selectedFilter, NotificationFilter.unread);
    expect(harness.state.notifications.single.id, '2');
  });

  test('빠른 탭 전환에서 이전 요청의 늦은 응답을 무시한다', () async {
    final allCompleter = Completer<NotificationListResult>();
    final unreadCompleter = Completer<NotificationListResult>();
    final repository = _FakeNotificationRepository(
      (unreadOnly) => unreadOnly ? unreadCompleter.future : allCompleter.future,
    );
    final harness = _createHarness(repository);
    addTearDown(harness.dispose);

    await _waitUntil(() => repository.calls.length == 1);
    expect(repository.calls.single, isFalse);
    harness.notifier.selectFilter(NotificationFilter.unread);
    await _waitUntil(() => repository.calls.length == 2);

    unreadCompleter.complete(
      NotificationListResult(
        notifications: [_notification(id: 2)],
        unreadCount: 1,
      ),
    );
    await _waitUntil(
      () =>
          harness.state.screenStatus == NotificationScreenStatus.loaded &&
          harness.state.notifications.single.id == '2',
    );

    allCompleter.complete(
      NotificationListResult(
        notifications: [_notification(id: 1)],
        unreadCount: 9,
      ),
    );
    await pumpEventQueue(times: 10);

    expect(harness.state.selectedFilter, NotificationFilter.unread);
    expect(harness.state.notifications.single.id, '2');
    expect(harness.state.unreadCount, 1);
  });
}

class _Harness {
  _Harness(this.container, this.subscription);

  final ProviderContainer container;
  final ProviderSubscription<NotificationViewState> subscription;

  NotificationViewState get state =>
      container.read(notificationViewModelProvider);
  NotificationViewModel get notifier =>
      container.read(notificationViewModelProvider.notifier);

  void dispose() {
    subscription.close();
    container.dispose();
  }
}

_Harness _createHarness(NotificationRepository repository) {
  final container = ProviderContainer(
    overrides: [notificationRepositoryProvider.overrideWithValue(repository)],
  );
  final subscription = container.listen(
    notificationViewModelProvider,
    (_, _) {},
    fireImmediately: true,
  );
  return _Harness(container, subscription);
}

class _FakeNotificationRepository implements NotificationRepository {
  _FakeNotificationRepository(this.handler);

  final Future<NotificationListResult> Function(bool unreadOnly) handler;
  final calls = <bool>[];

  @override
  Future<NotificationListResult> getNotifications({required bool unreadOnly}) {
    calls.add(unreadOnly);
    return handler(unreadOnly);
  }
}

NotificationSummary _notification({
  required int id,
  NotificationType? type = NotificationType.system,
  NotificationTargetType? targetType,
  int? targetId,
  bool targetAvailable = true,
  NotificationUnavailableReason? reason,
  String? deepLink,
  bool isRead = false,
  DateTime? readAt,
}) {
  return NotificationSummary(
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
    readAt: readAt,
    createdAt: DateTime.now().subtract(const Duration(seconds: 10)),
  );
}

Future<void> _waitUntil(bool Function() predicate) async {
  for (var attempt = 0; attempt < 100; attempt += 1) {
    if (predicate()) return;
    await pumpEventQueue();
  }
  fail('비동기 상태 변경을 기다리는 동안 제한 횟수를 초과했습니다.');
}
