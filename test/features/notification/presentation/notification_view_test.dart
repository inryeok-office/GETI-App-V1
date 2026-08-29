import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/notification/data/repository/notification_repository_impl.dart';
import 'package:geti_app/features/notification/domain/model/notification_summary.dart';
import 'package:geti_app/features/notification/domain/repository/notification_repository.dart';
import 'package:geti_app/features/notification/presentation/view/notification_view.dart';
import 'package:geti_app/features/notification/presentation/view_model/notification_view_model.dart';
import 'package:geti_app/features/notification/presentation/widgets/notification_card.dart';
import 'package:geti_app/features/notification/presentation/widgets/notification_state_content.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('기본 알림 목록과 알림 탭 선택 상태를 표시한다', (tester) async {
    await _pumpNotificationView(tester);

    expect(find.text('알림'), findsWidgets);
    expect(find.text('전체'), findsOneWidget);
    expect(find.text('읽지 않음'), findsOneWidget);
    expect(find.text('읽지 않은 알림 2개'), findsOneWidget);
    expect(find.text('전체 읽음'), findsOneWidget);
    expect(find.text('지원 상태가 변경되었습니다.'), findsOneWidget);
    expect(find.text('토스페이먼츠 지원서가 검토 중으로 변경되었습니다.'), findsOneWidget);
    expect(find.text('방금'), findsOneWidget);

    final notificationNavigation = tester.widget<Semantics>(
      find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.label == '알림',
      ),
    );
    expect(notificationNavigation.properties.selected, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('읽지 않음 탭은 읽지 않은 알림만 표시한다', (tester) async {
    await _pumpNotificationView(tester);

    await tester.tap(find.byKey(const ValueKey('notification-filter-unread')));
    await tester.pumpAndSettle();

    expect(find.byType(NotificationCard), findsNWidgets(2));
    expect(find.text('지원 상태가 변경되었습니다.'), findsOneWidget);
    expect(find.text('새로운 맞춤 공고가 도착했습니다.'), findsOneWidget);
    expect(find.text('프로그램 신청이 완료되었습니다.'), findsNothing);
  });

  testWidgets('읽음과 읽지 않음 카드 상태를 구분한다', (tester) async {
    await _pumpBody(tester, _notificationUiState);

    final unreadCard = tester.widget<NotificationCard>(
      find.byKey(const ValueKey('notification-card-application-status')),
    );
    final readCard = tester.widget<NotificationCard>(
      find.byKey(const ValueKey('notification-card-program-applied')),
    );

    expect(unreadCard.notification.isRead, isFalse);
    expect(readCard.notification.isRead, isTrue);
    expect(
      find.byKey(const ValueKey('notification-unread-application-status')),
      findsOneWidget,
    );
  });

  testWidgets('전체 읽음 Action은 기존 로컬 카드 상태를 갱신한다', (tester) async {
    await _pumpNotificationView(tester);

    await tester.tap(find.byKey(const ValueKey('notification-mark-all-read')));
    await tester.pump();
    expect(find.text('읽지 않은 알림 0개'), findsOneWidget);
    expect(find.byKey(const ValueKey('notification-unread-1')), findsNothing);
    expect(find.byKey(const ValueKey('notification-unread-2')), findsNothing);
  });

  testWidgets('전체 알림 없음 상태를 표시한다', (tester) async {
    await _pumpBody(
      tester,
      const NotificationViewState(
        screenStatus: NotificationScreenStatus.loaded,
        notifications: [],
      ),
    );

    expect(find.text('알림이 없어요'), findsOneWidget);
    expect(find.text('새로운 알림이 도착하면 여기에 표시됩니다.'), findsOneWidget);
  });

  testWidgets('읽지 않은 알림 없음 상태를 표시한다', (tester) async {
    await _pumpBody(
      tester,
      const NotificationViewState(
        screenStatus: NotificationScreenStatus.loaded,
        selectedFilter: NotificationFilter.unread,
        notifications: [],
      ),
    );

    expect(find.text('읽지 않은 알림이 없어요'), findsOneWidget);
    expect(find.text('모든 알림을 확인했어요.'), findsOneWidget);
  });

  testWidgets('로딩 상태를 표시한다', (tester) async {
    await _pumpBody(
      tester,
      const NotificationViewState(
        screenStatus: NotificationScreenStatus.loading,
      ),
    );

    expect(find.text('알림을 불러오는 중이에요.'), findsOneWidget);
    expect(find.text('잠시만 기다려 주세요.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('notification-loading-icon')),
      findsOneWidget,
    );
  });

  testWidgets('네트워크 오류와 다시 시도 Action을 표시한다', (tester) async {
    var retried = false;
    await _pumpBody(
      tester,
      const NotificationViewState(
        screenStatus: NotificationScreenStatus.networkError,
      ),
      onRetry: () => retried = true,
    );

    expect(find.text('알림을 불러오지 못했어요'), findsOneWidget);
    expect(find.text('다시 시도'), findsOneWidget);

    await tester.tap(find.text('다시 시도'));
    expect(retried, isTrue);
  });

  testWidgets('대상 삭제 상태와 알림 목록으로 Action을 표시한다', (tester) async {
    var requestedList = false;
    await _pumpStateContent(
      tester,
      NotificationStateContentType.targetDeleted,
      onAction: () => requestedList = true,
    );

    expect(find.text('삭제된 항목이에요.'), findsOneWidget);
    expect(find.text('알림 목록으로'), findsOneWidget);

    await tester.tap(find.text('알림 목록으로'));
    expect(requestedList, isTrue);
  });

  testWidgets('접근 권한 없음 상태와 알림 목록으로 Action을 표시한다', (tester) async {
    var requestedList = false;
    await _pumpStateContent(
      tester,
      NotificationStateContentType.targetForbidden,
      onAction: () => requestedList = true,
    );

    expect(find.text('접근할 수 없는 항목이에요.'), findsOneWidget);
    expect(find.text('알림 목록으로'), findsOneWidget);

    await tester.tap(find.text('알림 목록으로'));
    expect(requestedList, isTrue);
  });

  testWidgets('Bottom Navigation에서 알림 화면으로 진입한다', (tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            bottomNavigationBar: AppBottomNavigation(
              currentIndex: 0,
              onTap: (index) => navigateToBottomTab(context, index),
            ),
          ),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationView(),
        ),
      ],
    );
    addTearDown(router.dispose);

    await _pumpRouter(tester, router);
    await tester.tap(find.text('알림'));
    await tester.pumpAndSettle();

    expect(find.text('지원 상태가 변경되었습니다.'), findsOneWidget);
    final notificationNavigation = tester.widget<Semantics>(
      find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.label == '알림',
      ),
    );
    expect(notificationNavigation.properties.selected, isTrue);
  });

  testWidgets('일반 알림 Tap은 ViewModel Handler에서 읽음 처리하고 이동하지 않는다', (
    tester,
  ) async {
    const initialState = NotificationViewState(
      screenStatus: NotificationScreenStatus.loaded,
      unreadCount: 1,
      notifications: [
        NotificationItem(
          id: 'unread-general-target',
          title: '지원 상태가 변경되었습니다.',
          description: '토스페이먼츠 지원서가 검토 중으로 변경되었습니다.',
          time: '방금',
          isRead: false,
        ),
      ],
    );
    final container = ProviderContainer(
      overrides: [
        notificationViewModelProvider.overrideWith(
          () => _SeededNotificationViewModel(initialState),
        ),
      ],
    );
    addTearDown(container.dispose);

    final router = GoRouter(
      initialLocation: '/notifications',
      routes: [
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationView(),
        ),
      ],
    );
    addTearDown(router.dispose);

    await _pumpRouter(tester, router, container: container);
    expect(container.read(notificationViewModelProvider).unreadCount, 1);

    await tester.tap(find.text('지원 상태가 변경되었습니다.'));
    await tester.pumpAndSettle();

    expect(container.read(notificationViewModelProvider).unreadCount, 0);
    expect(router.state.uri.path, '/notifications');
    expect(find.text('지원 상태가 변경되었습니다.'), findsOneWidget);
  });

  testWidgets('삭제된 대상 알림은 읽음 처리 후 삭제 상태 화면으로 이동한다', (tester) async {
    const initialState = NotificationViewState(
      screenStatus: NotificationScreenStatus.loaded,
      unreadCount: 1,
      notifications: [
        NotificationItem(
          id: 'unread-deleted-target',
          title: '프로그램 신청이 완료되었습니다.',
          description: '프론트엔드 특강 신청이 완료되었습니다.',
          time: '방금',
          isRead: false,
          targetState: NotificationTargetState.deleted,
        ),
      ],
    );
    final container = ProviderContainer(
      overrides: [
        notificationViewModelProvider.overrideWith(
          () => _SeededNotificationViewModel(initialState),
        ),
      ],
    );
    addTearDown(container.dispose);

    final router = _notificationRouter();
    addTearDown(router.dispose);

    await _pumpRouter(tester, router, container: container);
    expect(container.read(notificationViewModelProvider).unreadCount, 1);

    await tester.tap(find.text('프로그램 신청이 완료되었습니다.'));
    await tester.pumpAndSettle();

    expect(container.read(notificationViewModelProvider).unreadCount, 0);
    expect(router.state.uri.path, '/notifications/deleted');
    expect(find.text('삭제된 항목이에요.'), findsOneWidget);
  });

  testWidgets('접근할 수 없는 대상 알림은 읽음 처리 후 권한 없음 화면으로 이동한다', (tester) async {
    const initialState = NotificationViewState(
      screenStatus: NotificationScreenStatus.loaded,
      unreadCount: 1,
      notifications: [
        NotificationItem(
          id: 'unread-forbidden-target',
          title: '포트폴리오 제출 요청',
          description: '2026 상반기 포트폴리오 제출 요청이 도착했습니다.',
          time: '방금',
          isRead: false,
          targetState: NotificationTargetState.forbidden,
        ),
      ],
    );
    final container = ProviderContainer(
      overrides: [
        notificationViewModelProvider.overrideWith(
          () => _SeededNotificationViewModel(initialState),
        ),
      ],
    );
    addTearDown(container.dispose);

    final router = _notificationRouter();
    addTearDown(router.dispose);

    await _pumpRouter(tester, router, container: container);
    expect(container.read(notificationViewModelProvider).unreadCount, 1);

    await tester.tap(find.text('포트폴리오 제출 요청'));
    await tester.pumpAndSettle();

    expect(container.read(notificationViewModelProvider).unreadCount, 0);
    expect(router.state.uri.path, '/notifications/forbidden');
    expect(find.text('접근할 수 없는 항목이에요.'), findsOneWidget);
  });

  testWidgets('대상 삭제 Route에서 알림 목록으로 돌아간다', (tester) async {
    final router = GoRouter(
      initialLocation: '/notifications/deleted',
      routes: [
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationView(),
          routes: [
            GoRoute(
              path: 'deleted',
              builder: (context, state) =>
                  const NotificationTargetDeletedView(),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);

    await _pumpRouter(tester, router);
    expect(find.text('삭제된 항목이에요.'), findsOneWidget);

    await tester.tap(find.text('알림 목록으로'));
    await tester.pumpAndSettle();

    expect(find.text('지원 상태가 변경되었습니다.'), findsOneWidget);
  });
}

GoRouter _notificationRouter() {
  return GoRouter(
    initialLocation: '/notifications',
    routes: [
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationView(),
        routes: [
          GoRoute(
            path: 'deleted',
            name: 'notification-target-deleted',
            builder: (context, state) => const NotificationTargetDeletedView(),
          ),
          GoRoute(
            path: 'forbidden',
            name: 'notification-target-forbidden',
            builder: (context, state) =>
                const NotificationTargetForbiddenView(),
          ),
        ],
      ),
    ],
  );
}

Future<void> _pumpNotificationView(WidgetTester tester) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        notificationRepositoryProvider.overrideWithValue(
          _fixtureNotificationRepository,
        ),
      ],
      child: const ScreenUtilInit(
        designSize: Size(390, 844),
        child: MaterialApp(home: NotificationView()),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _pumpBody(
  WidgetTester tester,
  NotificationViewState state, {
  VoidCallback? onRetry,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        home: Scaffold(
          body: NotificationScreenBody(
            state: state,
            onFilterSelected: (_) {},
            onMarkAllAsRead: () {},
            onRetry: onRetry ?? () {},
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _pumpStateContent(
  WidgetTester tester,
  NotificationStateContentType type, {
  VoidCallback? onAction,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 326,
              child: NotificationStateContent(type: type, onAction: onAction),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _pumpRouter(
  WidgetTester tester,
  GoRouter router, {
  ProviderContainer? container,
}) async {
  await _setViewport(tester);
  final child = ScreenUtilInit(
    designSize: const Size(390, 844),
    builder: (context, child) => MaterialApp.router(routerConfig: router),
  );
  await tester.pumpWidget(
    container == null
        ? ProviderScope(
            overrides: [
              notificationRepositoryProvider.overrideWithValue(
                _fixtureNotificationRepository,
              ),
            ],
            child: child,
          )
        : UncontrolledProviderScope(container: container, child: child),
  );
  await tester.pump();
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

class _SeededNotificationViewModel extends NotificationViewModel {
  _SeededNotificationViewModel(this.initialState);

  final NotificationViewState initialState;

  @override
  NotificationViewState build() => initialState;
}

const _notificationUiState = NotificationViewState(
  screenStatus: NotificationScreenStatus.loaded,
  unreadCount: 2,
  notifications: [
    NotificationItem(
      id: 'application-status',
      title: '지원 상태가 변경되었습니다.',
      description: '토스페이먼츠 지원서가 검토 중으로 변경되었습니다.',
      time: '방금',
      isRead: false,
    ),
    NotificationItem(
      id: 'program-applied',
      title: '프로그램 신청이 완료되었습니다.',
      description: '프론트엔드 특강 신청이 완료되었습니다.',
      time: '어제',
      isRead: true,
    ),
  ],
);

final NotificationRepository _fixtureNotificationRepository =
    _FakeNotificationRepository(
      NotificationListResult(
        unreadCount: 2,
        notifications: [
          _notification(
            id: 1,
            title: '지원 상태가 변경되었습니다.',
            content: '토스페이먼츠 지원서가 검토 중으로 변경되었습니다.',
            createdAt: DateTime.now(),
          ),
          _notification(
            id: 2,
            title: '새로운 맞춤 공고가 도착했습니다.',
            content: '기술 스택과 잘 맞는 공고 3개를 확인해 보세요.',
            createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          ),
          _notification(
            id: 3,
            title: '프로그램 신청이 완료되었습니다.',
            content: '프론트엔드 특강 신청이 완료되었습니다.',
            createdAt: DateTime.now().subtract(const Duration(days: 1)),
            isRead: true,
            targetAvailable: false,
            unavailableReason: NotificationUnavailableReason.deleted,
          ),
          _notification(
            id: 4,
            title: '포트폴리오 제출 요청',
            content: '2026 상반기 포트폴리오 제출 요청이 도착했습니다.',
            createdAt: DateTime.now().subtract(const Duration(days: 2)),
            isRead: true,
            targetAvailable: false,
            unavailableReason: NotificationUnavailableReason.forbidden,
          ),
        ],
      ),
    );

class _FakeNotificationRepository implements NotificationRepository {
  const _FakeNotificationRepository(this.result);

  final NotificationListResult result;

  @override
  Future<NotificationListResult> getNotifications({
    required bool unreadOnly,
  }) async {
    return NotificationListResult(
      notifications: unreadOnly
          ? result.notifications
                .where((notification) => !notification.isRead)
                .toList(growable: false)
          : result.notifications,
      unreadCount: result.unreadCount,
    );
  }
}

NotificationSummary _notification({
  required int id,
  required String title,
  required String content,
  required DateTime createdAt,
  bool isRead = false,
  bool targetAvailable = true,
  NotificationUnavailableReason? unavailableReason,
}) {
  return NotificationSummary(
    notificationId: id,
    notificationType: NotificationType.system,
    title: title,
    content: content,
    targetType: null,
    targetId: null,
    targetAvailable: targetAvailable,
    targetUnavailableReason: unavailableReason,
    deepLink: null,
    isRead: isRead,
    readAt: null,
    createdAt: createdAt,
  );
}
