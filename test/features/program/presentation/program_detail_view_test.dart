import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/program/presentation/view/program_detail_view.dart';
import 'package:geti_app/features/program/presentation/view/program_view.dart';
import 'package:geti_app/features/program/presentation/view_model/program_detail_view_model.dart';
import 'package:geti_app/features/program/presentation/widgets/program_card.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('프로그램 목록 카드에서 해당 프로그램 상세로 이동한다', (tester) async {
    final router = _router();
    addTearDown(router.dispose);
    await _pumpRouter(tester, router);

    await tester.tap(find.byType(ProgramCard).first);
    await tester.pumpAndSettle();

    expect(router.state.pathParameters['programId'], 'applied');
    expect(find.text('현직자와 함께하는 프론트엔드 특강'), findsOneWidget);
    expect(find.text('신청 취소'), findsOneWidget);
  });

  testWidgets('취소됨과 삭제됨 Mock 프로그램도 기존 상세 Route를 사용한다', (tester) async {
    final router = _router();
    addTearDown(router.dispose);
    await _pumpRouter(tester, router);

    await tester.tap(find.byType(ProgramCard).at(1));
    await tester.pumpAndSettle();

    expect(router.state.uri.path, '/programs/cancelled');
    expect(find.text('프로그램 취소'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('program-detail-back')));
    await tester.pumpAndSettle();

    final deletedProgram = find.text('삭제된 프로그램입니다.');
    await tester.ensureVisible(deletedProgram);
    await tester.pumpAndSettle();
    await tester.tap(deletedProgram);
    await tester.pumpAndSettle();

    expect(router.state.uri.path, '/programs/deleted');
    expect(find.text('삭제된 프로그램입니다.'), findsOneWidget);
  });

  testWidgets('프로그램 상세 Back은 기존 프로그램 목록으로 돌아간다', (tester) async {
    final router = _router();
    addTearDown(router.dispose);
    await _pumpRouter(tester, router);
    await tester.tap(find.byType(ProgramCard).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('program-detail-back')));
    await tester.pumpAndSettle();

    expect(router.state.uri.path, '/programs');
    expect(find.byType(ProgramView), findsOneWidget);
  });

  testWidgets('존재하지 않는 프로그램 id는 not-found 상태를 표시한다', (tester) async {
    await _setViewport(tester);
    await tester.pumpWidget(
      const ProviderScope(
        child: ScreenUtilInit(
          designSize: Size(390, 844),
          child: MaterialApp(
            home: ProgramDetailView(programId: 'missing-program'),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('프로그램 정보를 찾을 수 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('프로그램 취소됨 상태는 Figma 안내와 신청 이력을 표시한다', (tester) async {
    final router = _detailRouter(programId: 'cancelled');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    expect(router.state.uri.path, '/programs/cancelled');
    expect(find.text('프로그램 취소'), findsOneWidget);
    expect(find.text('현직자와 함께하는 프론트엔드 특강'), findsOneWidget);
    expect(find.text('신청 08.01–08.10   ·   조회수 128'), findsOneWidget);
    expect(find.text('해당 프로그램은 운영 사정으로 취소되었습니다.'), findsOneWidget);
    expect(find.text('취소 사유'), findsOneWidget);
    expect(find.text('강사 사정으로 인해 프로그램이 취소되었습니다.'), findsOneWidget);
    expect(find.text('이용에 불편을 드려 죄송합니다.'), findsOneWidget);
    expect(find.text('신청일'), findsOneWidget);
    expect(find.text('2026.08.01 14:32'), findsOneWidget);
    expect(find.text('상태'), findsOneWidget);
    expect(find.text('취소됨 (2026.08.05 10:30)'), findsOneWidget);
    expect(find.text('※ 프로그램은 취소되었지만 신청 내역은 확인할 수 있습니다.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-detail-action-applied')),
      findsNothing,
    );
    expect(find.byType(AppBottomNavigation), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('삭제된 프로그램 상태는 삭제 안내와 신청 이력을 표시한다', (tester) async {
    final router = _detailRouter(programId: 'deleted');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    expect(router.state.uri.path, '/programs/deleted');
    expect(find.text('삭제된 프로그램입니다.'), findsOneWidget);
    expect(find.text('운영에 의해 해당 프로그램 정보가\n삭제되었습니다.'), findsOneWidget);
    expect(find.text('신청일'), findsOneWidget);
    expect(find.text('2026.08.01 14:32'), findsOneWidget);
    expect(find.text('상태'), findsOneWidget);
    expect(find.text('삭제됨 (2026.08.05 10:30)'), findsOneWidget);
    expect(find.text('※ 프로그램은 삭제되었지만 신청 내역은 확인할 수 있습니다.'), findsOneWidget);
    expect(find.text('프로그램 취소'), findsNothing);
    expect(
      find.byKey(const ValueKey('program-detail-action-applied')),
      findsNothing,
    );
    expect(find.byType(AppBottomNavigation), findsNothing);
    expect(tester.takeException(), isNull);
  });

  test('서로 다른 Mock ID는 서로 다른 상세 데이터와 연결된다', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final available = container.read(
      programDetailViewModelProvider('available'),
    );
    final full = container.read(programDetailViewModelProvider('full'));

    expect(available.detail!.id, 'available');
    expect(available.detail!.actionStatus, ProgramDetailActionStatus.available);
    expect(full.detail!.id, 'full');
    expect(full.detail!.title, '2026 하반기 취업 전략 설명회');
    expect(full.detail!.actionStatus, ProgramDetailActionStatus.full);
    final cancelled = container.read(
      programDetailViewModelProvider('cancelled'),
    );
    expect(cancelled.detail!.actionStatus, ProgramDetailActionStatus.applied);
    expect(
      cancelled.detail!.operationalStatus,
      ProgramOperationalStatus.cancelled,
    );
    expect(
      container.read(programDetailViewModelProvider('deleted')).detail!.id,
      'deleted',
    );
    expect(
      container
          .read(programDetailViewModelProvider('deleted'))
          .detail!
          .operationalStatus,
      ProgramOperationalStatus.deleted,
    );
  });

  test('신청 처리 중에는 중복 신청을 실행하지 않고 완료 상태로 전환한다', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(
      programDetailViewModelProvider('available'),
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);
    final notifier = container.read(
      programDetailViewModelProvider('available').notifier,
    );

    final firstApplication = notifier.applyProgram();
    expect(
      container
          .read(programDetailViewModelProvider('available'))
          .detail!
          .actionStatus,
      ProgramDetailActionStatus.applying,
    );

    await notifier.applyProgram();
    expect(
      container
          .read(programDetailViewModelProvider('available'))
          .detail!
          .actionStatus,
      ProgramDetailActionStatus.applying,
    );

    await firstApplication;
    expect(
      container
          .read(programDetailViewModelProvider('available'))
          .detail!
          .actionStatus,
      ProgramDetailActionStatus.applied,
    );
  });

  test('신청 취소 처리 중에는 중복 취소를 실행하지 않고 완료 상태로 전환한다', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(
      programDetailViewModelProvider('applied'),
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);
    final notifier = container.read(
      programDetailViewModelProvider('applied').notifier,
    );

    final firstCancellation = notifier.cancelProgram();
    expect(
      container
          .read(programDetailViewModelProvider('applied'))
          .detail!
          .actionStatus,
      ProgramDetailActionStatus.cancelling,
    );

    await notifier.cancelProgram();
    expect(
      container
          .read(programDetailViewModelProvider('applied'))
          .detail!
          .actionStatus,
      ProgramDetailActionStatus.cancelling,
    );

    await firstCancellation;
    expect(
      container
          .read(programDetailViewModelProvider('applied'))
          .detail!
          .actionStatus,
      ProgramDetailActionStatus.cancelled,
    );
  });

  testWidgets('신청하기 Tap 후 처리 중 UI를 거쳐 신청 완료를 표시한다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(find.text('신청하기'));
    await tester.pump();

    expect(find.text('신청을 처리 중입니다.'), findsOneWidget);
    expect(find.text('잠시만 기다려 주세요.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-applying-loading')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();
    expect(find.text('신청 취소'), findsOneWidget);
  });

  testWidgets('신청 취소 Tap은 확인 BottomSheet를 표시하고 계속 참여하기로 닫는다', (tester) async {
    final router = _detailRouter(programId: 'applied');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-applied')),
    );
    await tester.pumpAndSettle();

    expect(find.text('프로그램 신청을 취소할까요?'), findsOneWidget);
    expect(find.text('취소 후 정원이 마감되면 다시 신청할 수 없습니다.'), findsOneWidget);
    expect(find.text('유의사항'), findsOneWidget);
    expect(find.text('프로그램 시작 2일 전까지 취소할 수 있습니다.'), findsOneWidget);
    expect(find.text('프로그램 시작 이후에는 취소가 불가능합니다.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-cancel-confirm')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('program-cancel-continue')),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const ValueKey('program-cancel-continue')));
    await tester.pumpAndSettle();

    expect(find.text('프로그램 신청을 취소할까요?'), findsNothing);
    expect(find.text('신청 취소'), findsOneWidget);
  });

  testWidgets('신청 취소 확인 BottomSheet는 빠른 중복 Tap에도 하나만 표시된다', (tester) async {
    final router = _detailRouter(programId: 'applied');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    final cancelAction = find.byKey(
      const ValueKey('program-detail-action-applied'),
    );
    await tester.tap(cancelAction);
    await tester.tap(cancelAction, warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.text('프로그램 신청을 취소할까요?'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-cancel-confirm')),
      findsOneWidget,
    );
  });

  testWidgets('신청 취소 성공은 처리 중 UI를 거쳐 완료 Dialog를 표시한다', (tester) async {
    final router = _detailRouter(programId: 'applied');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-applied')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('program-cancel-confirm')));
    await tester.pump();

    expect(find.text('신청 취소 처리 중입니다.'), findsOneWidget);
    expect(find.text('잠시만 기다려 주세요.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-cancelling-loading')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(find.text('신청이 취소되었습니다'), findsOneWidget);
    expect(find.text('취소일'), findsOneWidget);
    expect(find.text('2026.08.08 (금) 15:20'), findsOneWidget);
    expect(find.text('취소 사유'), findsOneWidget);
    expect(find.text('사용자 취소'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('program-cancel-go-programs')));
    await tester.pumpAndSettle();

    expect(router.state.uri.path, '/programs');
  });

  testWidgets('신청 취소 실패는 실패 Dialog와 재시도/닫기 Action을 표시한다', (tester) async {
    final router = _detailRouter(programId: 'applied');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router, cancellationFailure: true);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-applied')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('program-cancel-confirm')));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(find.text('신청을 취소하지 못했어요'), findsOneWidget);
    expect(find.text('사유'), findsOneWidget);
    expect(find.text('이미 취소 가능한 기한이 지났거나\n다른 이유로 취소가 불가능합니다.'), findsOneWidget);
    expect(find.byKey(const ValueKey('program-cancel-retry')), findsOneWidget);
    expect(find.byKey(const ValueKey('program-cancel-close')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('program-cancel-retry')));
    await tester.pump();

    expect(find.text('신청 취소 처리 중입니다.'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('program-cancel-close')));
    await tester.pump();

    expect(find.text('신청을 취소하지 못했어요'), findsNothing);
    expect(find.text('신청 취소'), findsOneWidget);
  });

  testWidgets('동시성 실패 문구와 확인 Action을 표시한다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router, concurrencyFailure: true);

    await tester.tap(find.text('신청하기'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(find.text('정원이 마감되어 신청할 수 없어요.'), findsOneWidget);
    expect(find.text('다른 프로그램을 확인해 주세요.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-concurrency-confirm')),
      findsOneWidget,
    );
  });

  testWidgets('동시성 실패 확인은 Overlay를 닫고 신청 가능 상태로 돌아간다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router, concurrencyFailure: true);

    await tester.tap(find.text('신청하기'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('program-concurrency-confirm')));
    await tester.pump();

    expect(find.text('정원이 마감되어 신청할 수 없어요.'), findsNothing);
    expect(find.text('신청하기'), findsOneWidget);
    expect(find.textContaining('취소'), findsNothing);
  });

  final actionCases = <ProgramDetailActionStatus, String>{
    ProgramDetailActionStatus.available: '신청하기',
    ProgramDetailActionStatus.upcoming: '모집 전입니다.',
    ProgramDetailActionStatus.full: '정원이 마감되었습니다.',
    ProgramDetailActionStatus.closed: '신청 기간이 종료되었습니다.',
    ProgramDetailActionStatus.applied: '신청 취소',
    ProgramDetailActionStatus.cancelling: '신청 취소',
    ProgramDetailActionStatus.cancelled: '신청 취소 완료',
    ProgramDetailActionStatus.cancelFailure: '신청 취소',
  };

  for (final actionCase in actionCases.entries) {
    testWidgets('${actionCase.key.name} 상세 Action을 표시한다', (tester) async {
      await _pumpBody(
        tester,
        ProgramDetail(
          id: actionCase.key.name,
          title: '테스트 프로그램',
          actionStatus: actionCase.key,
        ),
      );

      expect(find.text(actionCase.value), findsOneWidget);
      expect(
        find.byKey(ValueKey('program-detail-action-${actionCase.key.name}')),
        findsOneWidget,
      );
      expect(find.byType(AppBottomNavigation), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
}

GoRouter _router() => GoRouter(
  initialLocation: '/programs',
  routes: [
    GoRoute(
      path: '/programs',
      builder: (_, _) => const ProgramView(),
      routes: [
        GoRoute(
          path: ':programId',
          builder: (_, state) =>
              ProgramDetailView(programId: state.pathParameters['programId']!),
        ),
      ],
    ),
  ],
);

GoRouter _detailRouter({String programId = 'available'}) => GoRouter(
  initialLocation: '/programs/$programId',
  routes: [
    GoRoute(
      path: '/programs',
      builder: (_, _) => const ProgramView(),
      routes: [
        GoRoute(
          path: ':programId',
          builder: (_, state) =>
              ProgramDetailView(programId: state.pathParameters['programId']!),
        ),
      ],
    ),
  ],
);

Future<void> _pumpRouter(WidgetTester tester, GoRouter router) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp.router(routerConfig: router),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _pumpDetailRouter(
  WidgetTester tester,
  GoRouter router, {
  bool concurrencyFailure = false,
  bool cancellationFailure = false,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        if (concurrencyFailure)
          programApplicationOutcomeProvider.overrideWithValue(
            ProgramApplicationOutcome.concurrencyFailure,
          ),
        if (cancellationFailure)
          programCancellationOutcomeProvider.overrideWithValue(
            ProgramCancellationOutcome.failure,
          ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp.router(routerConfig: router),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _pumpBody(WidgetTester tester, ProgramDetail detail) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        home: Scaffold(body: ProgramDetailBody(detail: detail)),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}
