import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/program/data/dto/program_detail_response.dart';
import 'package:geti_app/features/program/data/dto/program_list_response.dart';
import 'package:geti_app/features/program/data/program_repository.dart';
import 'package:geti_app/features/program/presentation/view/program_detail_view.dart';
import 'package:geti_app/features/program/presentation/view/program_view.dart';
import 'package:geti_app/features/program/presentation/view_model/program_detail_view_model.dart';
import 'package:geti_app/features/program/presentation/view_model/program_type.dart';
import 'package:geti_app/features/program/presentation/widgets/program_card.dart';
import 'package:geti_app/features/program/presentation/widgets/program_detail_sections.dart';
import 'package:geti_app/features/program/presentation/widgets/program_state_content.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('ProgramDetailResponse parses nullable values and files', () {
    final response = ProgramDetailResponse.fromJson({
      'programId': 9,
      'title': 'API detail',
      'content': null,
      'location': null,
      'programType': 'EDUCATION',
      'targetGrades': [1, 2, 3],
      'startAt': null,
      'endAt': null,
      'applicationStartAt': '2026-08-01T00:00:00',
      'applicationEndAt': '2026-08-10T23:59:00',
      'capacity': null,
      'currentApplicants': 12,
      'remainingCapacity': null,
      'firstComeServed': false,
      'canApply': false,
      'eligibilityReason': 'PROGRAM_FULL',
      'eligibilityMessage': 'full',
      'availableActions': ['CANCEL'],
      'canSubscribeVacancy': true,
      'vacancySubscribed': false,
      'vacancySubscriptionStatus': null,
      'status': 'PUBLISHED',
      'files': [
        {
          'fileId': 1,
          'originalName': 'guide.pdf',
          'contentType': 'application/pdf',
          'size': 1000,
          'downloadUrl': 'https://example.com/guide.pdf',
        },
      ],
    });

    expect(response.programId, 9);
    expect(response.programType, 'EDUCATION');
    expect(response.targetGrades, [1, 2, 3]);
    expect(response.content, isNull);
    expect(response.location, isNull);
    expect(response.capacity, isNull);
    expect(response.remainingCapacity, isNull);
    expect(response.availableActions, ['CANCEL']);
    expect(response.files.single.originalName, 'guide.pdf');
  });

  test('ProgramDetailResponse maps server action fields to UI status', () {
    expect(
      programDetailActionStatusFrom(_detail(canApply: true)),
      ProgramDetailActionStatus.available,
    );
    expect(
      programDetailActionStatusFrom(
        _detail(eligibilityReason: 'ALREADY_APPLIED'),
      ),
      ProgramDetailActionStatus.applied,
    );
    expect(
      programDetailActionStatusFrom(_detail(availableActions: ['CANCEL'])),
      ProgramDetailActionStatus.applied,
    );
    expect(
      programDetailActionStatusFrom(
        _detail(
          canApply: false,
          eligibilityReason: 'PROGRAM_NOT_OPEN',
          availableActions: const [],
        ),
      ),
      ProgramDetailActionStatus.upcoming,
    );
    expect(
      programDetailActionStatusFrom(
        _detail(
          canApply: false,
          eligibilityReason: 'PROGRAM_FULL',
          availableActions: const [],
        ),
      ),
      ProgramDetailActionStatus.full,
    );
    expect(
      programDetailActionStatusFrom(
        _detail(
          canApply: false,
          eligibilityReason: 'PROGRAM_CLOSED',
          availableActions: const [],
        ),
      ),
      ProgramDetailActionStatus.closed,
    );
  });

  test('ProgramDetail maps API detail to existing UI model safely', () {
    final detail = ProgramDetail.fromResponse(_detail());

    expect(detail.id, '1');
    expect(detail.title, 'API 상세 프로그램');
    expect(detail.type, ProgramType.specialLecture);
    expect(detail.actionStatus, ProgramDetailActionStatus.available);
    expect(detail.applicationPeriod, '신청 08.01-08.10');
    expect(detail.schedule, '2026.08.12 14:00-16:00');
    expect(detail.location, '장소 A');
    expect(detail.capacity, '30명');
    expect(detail.currentApplicants, '12명');
    expect(detail.remainingCapacity, '18명');
    expect(detail.admissionType, '선착순');
  });

  testWidgets('프로그램 목록 카드에서 API programId 상세 Route로 이동한다', (tester) async {
    final router = _router();
    addTearDown(router.dispose);
    await _pumpRouter(tester, router);

    await tester.tap(find.byType(ProgramCard).first);
    await tester.pumpAndSettle();

    expect(router.state.pathParameters['programId'], '1');
    expect(find.text('API 상세 프로그램'), findsOneWidget);
  });

  testWidgets('프로그램 목록의 다음 카드도 API programId를 보존한다', (tester) async {
    final router = _router();
    addTearDown(router.dispose);
    await _pumpRouter(tester, router);

    await tester.tap(find.byType(ProgramCard).at(1));
    await tester.pumpAndSettle();

    expect(router.state.pathParameters['programId'], '2');
    expect(find.text('두 번째 API 상세'), findsOneWidget);
  });

  testWidgets('프로그램 상세 Back은 기존 프로그램 목록으로 돌아간다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(find.byKey(const ValueKey('program-detail-back')));
    await tester.pumpAndSettle();

    expect(router.state.uri.path, '/programs');
    expect(find.byType(ProgramView), findsOneWidget);
  });

  testWidgets('상세 API 데이터가 기존 Program Detail UI에 표시된다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    expect(find.text('API 상세 프로그램'), findsOneWidget);
    expect(find.text('신청 08.01-08.10'), findsOneWidget);
    expect(find.text('2026.08.12 14:00-16:00'), findsOneWidget);
    expect(find.text('장소 A'), findsOneWidget);
    expect(find.text('30명'), findsWidgets);
    expect(find.text('API 상세 설명'), findsOneWidget);
    expect(find.text('12명'), findsOneWidget);
    expect(find.text('18명'), findsOneWidget);
    expect(find.text('선착순'), findsOneWidget);
    expect(find.byType(AppBottomNavigation), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('nullable 상세 API 값은 crash 없이 fallback으로 표시된다', (tester) async {
    final router = _detailRouter(programId: '2');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    expect(find.text('두 번째 API 상세'), findsOneWidget);
    expect(find.text('일정 미정'), findsOneWidget);
    expect(find.text('장소 미정'), findsOneWidget);
    expect(find.text('정원 미정'), findsWidgets);
    expect(find.text('남은 인원 미정'), findsOneWidget);
    expect(find.text('프로그램 설명이 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('숫자가 아닌 programId는 API 호출 없이 not-found 상태를 표시한다', (tester) async {
    final repository = _DetailTestProgramRepository();

    await _pumpDetailView(
      tester,
      programId: 'missing-program',
      repository: repository,
    );

    expect(
      find.byKey(const ValueKey('program-detail-not-found')),
      findsOneWidget,
    );
    expect(repository.detailRequests, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('404 PROGRAM_NOT_FOUND는 not-found 상태를 표시한다', (tester) async {
    await _pumpDetailView(
      tester,
      programId: '404',
      repository: _DetailTestProgramRepository(
        detailError: ProgramRepositoryException(
          'not found',
          statusCode: 404,
          code: 'PROGRAM_NOT_FOUND',
        ),
      ),
    );

    expect(
      find.byKey(const ValueKey('program-detail-not-found')),
      findsOneWidget,
    );
  });

  testWidgets('410 PROGRAM_DELETED는 기존 삭제된 프로그램 UI를 표시한다', (tester) async {
    await _pumpDetailView(
      tester,
      programId: '410',
      repository: _DetailTestProgramRepository(
        detailError: ProgramRepositoryException(
          'deleted',
          statusCode: 410,
          code: 'PROGRAM_DELETED',
        ),
      ),
    );

    expect(find.byType(ProgramDeletedDetailBody), findsOneWidget);
    expect(
      find.byKey(const ValueKey('program-status-history')),
      findsOneWidget,
    );
  });

  testWidgets('상세 API 실패는 기존 네트워크 에러 UI를 표시하고 재시도한다', (tester) async {
    final repository = _DetailTestProgramRepository(
      detailError: const ProgramRepositoryException('network error'),
      retryDetail: _detail(title: '재시도 성공'),
    );

    await _pumpDetailView(tester, programId: '1', repository: repository);

    expect(find.byType(ProgramNetworkErrorState), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('program-retry')));
    await tester.pumpAndSettle();

    expect(find.text('재시도 성공'), findsOneWidget);
  });

  testWidgets('상세 로딩 상태를 표시한다', (tester) async {
    final completer = Completer<ProgramDetailResponse>();

    await _pumpDetailView(
      tester,
      programId: '1',
      repository: _DetailTestProgramRepository(pendingDetail: completer.future),
      settle: false,
    );

    expect(find.byType(ProgramLoadingState), findsOneWidget);
    completer.complete(_detail());
    await tester.pumpAndSettle();
  });

  test('신청 처리 중에는 중복 신청을 실행하지 않고 완료 상태로 전환한다', () async {
    final container = ProviderContainer(
      overrides: [
        programRepositoryProvider.overrideWithValue(
          _DetailTestProgramRepository(),
        ),
      ],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(
      programDetailViewModelProvider('1'),
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);
    await _waitForDetail(container, '1');
    final notifier = container.read(
      programDetailViewModelProvider('1').notifier,
    );

    final firstApplication = notifier.applyProgram();
    expect(
      container.read(programDetailViewModelProvider('1')).detail!.actionStatus,
      ProgramDetailActionStatus.applying,
    );

    await notifier.applyProgram();
    expect(
      container.read(programDetailViewModelProvider('1')).detail!.actionStatus,
      ProgramDetailActionStatus.applying,
    );

    await firstApplication;
    expect(
      container.read(programDetailViewModelProvider('1')).detail!.actionStatus,
      ProgramDetailActionStatus.applied,
    );
  });

  testWidgets('신청 취소 Tap은 확인 BottomSheet를 표시하고 계속 참여하기로 닫는다', (tester) async {
    final router = _detailRouter(programId: '3');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-applied')),
    );
    await tester.pumpAndSettle();

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

    expect(find.byKey(const ValueKey('program-cancel-confirm')), findsNothing);
    expect(
      find.byKey(const ValueKey('program-detail-action-applied')),
      findsOneWidget,
    );
  });

  testWidgets('신청 취소 처리 중에는 중복 취소를 실행하지 않고 완료 상태로 전환한다', (tester) async {
    final router = _detailRouter(programId: '3');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-applied')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('program-cancel-confirm')));
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-cancelling-loading')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-cancel-go-programs')),
      findsOneWidget,
    );
  });

  testWidgets('신청하기 Tap 후 처리 중 UI를 거쳐 신청 완료 상태를 표시한다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-available')),
    );
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-applying-loading')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-detail-action-applied')),
      findsOneWidget,
    );
  });

  testWidgets('신청 취소 확인 BottomSheet는 빠른 중복 Tap에도 하나만 표시된다', (tester) async {
    final router = _detailRouter(programId: '3');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router);

    final cancelAction = find.byKey(
      const ValueKey('program-detail-action-applied'),
    );
    await tester.tap(cancelAction);
    await tester.tap(cancelAction, warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey('program-cancel-confirm')),
      findsOneWidget,
    );
  });

  testWidgets('신청 취소 실패는 실패 Dialog와 재시도/닫기 Action을 표시한다', (tester) async {
    final router = _detailRouter(programId: '3');
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router, cancellationFailure: true);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-applied')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('program-cancel-confirm')));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(find.byKey(const ValueKey('program-cancel-retry')), findsOneWidget);
    expect(find.byKey(const ValueKey('program-cancel-close')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('program-cancel-retry')));
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-cancelling-loading')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('program-cancel-close')));
    await tester.pump();

    expect(find.byKey(const ValueKey('program-cancel-retry')), findsNothing);
    expect(
      find.byKey(const ValueKey('program-detail-action-applied')),
      findsOneWidget,
    );
  });

  testWidgets('동시성 실패 확인은 Overlay를 닫고 신청 가능 상태로 돌아간다', (tester) async {
    final router = _detailRouter();
    addTearDown(router.dispose);
    await _pumpDetailRouter(tester, router, concurrencyFailure: true);

    await tester.tap(
      find.byKey(const ValueKey('program-detail-action-available')),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-concurrency-confirm')),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const ValueKey('program-concurrency-confirm')));
    await tester.pump();

    expect(
      find.byKey(const ValueKey('program-concurrency-confirm')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('program-detail-action-available')),
      findsOneWidget,
    );
  });

  testWidgets('프로그램 취소됨 상태는 기존 안내와 신청 이력 UI를 유지한다', (tester) async {
    await _pumpBody(
      tester,
      const ProgramDetail(
        id: 'cancelled',
        title: '취소된 프로그램',
        actionStatus: ProgramDetailActionStatus.applied,
        operationalStatus: ProgramOperationalStatus.cancelled,
        type: ProgramType.specialLecture,
      ),
    );

    expect(
      find.byKey(const ValueKey('program-cancelled-alert')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('program-status-history')),
      findsOneWidget,
    );
    expect(find.byType(AppBottomNavigation), findsNothing);
    expect(tester.takeException(), isNull);
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
          type: ProgramType.specialLecture,
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

Future<void> _waitForDetail(
  ProviderContainer container,
  String programId,
) async {
  for (var i = 0; i < 10; i++) {
    final state = container.read(programDetailViewModelProvider(programId));
    if (state.detail != null) return;
    await Future<void>.delayed(Duration.zero);
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

GoRouter _detailRouter({String programId = '1'}) => GoRouter(
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
      overrides: [
        programRepositoryProvider.overrideWithValue(
          _DetailTestProgramRepository(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp.router(routerConfig: router),
      ),
    ),
  );
  await tester.pumpAndSettle();
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
        programRepositoryProvider.overrideWithValue(
          _DetailTestProgramRepository(),
        ),
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
  await tester.pumpAndSettle();
}

Future<void> _pumpDetailView(
  WidgetTester tester, {
  required String programId,
  required ProgramRepository repository,
  bool settle = true,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [programRepositoryProvider.overrideWithValue(repository)],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp(home: ProgramDetailView(programId: programId)),
      ),
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }
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

class _DetailTestProgramRepository implements ProgramRepository {
  _DetailTestProgramRepository({
    this.detailError,
    this.retryDetail,
    this.pendingDetail,
  });

  final ProgramRepositoryException? detailError;
  final ProgramDetailResponse? retryDetail;
  final Future<ProgramDetailResponse>? pendingDetail;

  final detailRequests = <int>[];

  @override
  Future<ProgramListResponse> getPrograms({
    String? programType,
    String? status,
    bool? openOnly,
    int page = 0,
    int size = 20,
    List<String>? sort,
  }) async {
    return ProgramListResponse(
      content: _detailTestPrograms,
      page: page,
      size: size,
      totalElements: _detailTestPrograms.length,
      totalPages: 1,
      first: true,
      last: true,
    );
  }

  @override
  Future<ProgramDetailResponse> getProgramDetail(int programId) async {
    detailRequests.add(programId);

    if (pendingDetail != null) {
      return pendingDetail!;
    }
    if (detailError != null) {
      if (retryDetail != null && detailRequests.length > 1) return retryDetail!;
      throw detailError!;
    }

    final detail = _detailFixtures[programId];
    if (detail == null) {
      throw const ProgramRepositoryException(
        'not found',
        statusCode: 404,
        code: 'PROGRAM_NOT_FOUND',
      );
    }
    return detail;
  }
}

final _detailTestPrograms = [
  ProgramSummaryResponse(
    programId: 1,
    title: '목록 API 프로그램',
    programType: 'SPECIAL_LECTURE',
    status: 'PUBLISHED',
    location: '장소 A',
    startAt: DateTime(2026, 8, 12, 14),
    endAt: DateTime(2026, 8, 12, 16),
    applicationStartAt: DateTime(2026, 8),
    applicationEndAt: DateTime(2026, 8, 10),
    currentApplicants: 12,
    applied: false,
  ),
  ProgramSummaryResponse(
    programId: 2,
    title: '두 번째 API 프로그램',
    programType: 'EDUCATION',
    status: 'CLOSED',
    currentApplicants: 0,
  ),
];

final _detailFixtures = {
  1: _detail(),
  2: _detail(
    programId: 2,
    title: '두 번째 API 상세',
    content: null,
    location: null,
    capacity: null,
    remainingCapacity: null,
    firstComeServed: false,
    canApply: false,
    eligibilityReason: 'PROGRAM_CLOSED',
    status: 'CLOSED',
    useNullDates: true,
  ),
  3: _detail(
    programId: 3,
    title: '신청 완료 API 상세',
    canApply: false,
    eligibilityReason: 'ALREADY_APPLIED',
    availableActions: ['CANCEL'],
  ),
};

ProgramDetailResponse _detail({
  int programId = 1,
  String title = 'API 상세 프로그램',
  String? content = 'API 상세 설명',
  String? location = '장소 A',
  String programType = 'SPECIAL_LECTURE',
  DateTime? startAt,
  DateTime? endAt,
  DateTime? applicationStartAt,
  DateTime? applicationEndAt,
  int? capacity = 30,
  int currentApplicants = 12,
  int? remainingCapacity = 18,
  bool firstComeServed = true,
  bool canApply = true,
  String eligibilityReason = 'AVAILABLE',
  List<String> availableActions = const ['APPLY'],
  String status = 'PUBLISHED',
  bool useNullDates = false,
}) {
  return ProgramDetailResponse(
    programId: programId,
    title: title,
    content: content,
    location: location,
    programType: programType,
    targetGrades: const [1, 2, 3],
    startAt: useNullDates ? null : (startAt ?? DateTime(2026, 8, 12, 14)),
    endAt: useNullDates ? null : (endAt ?? DateTime(2026, 8, 12, 16)),
    applicationStartAt: useNullDates
        ? null
        : (applicationStartAt ?? DateTime(2026, 8)),
    applicationEndAt: useNullDates
        ? null
        : (applicationEndAt ?? DateTime(2026, 8, 10)),
    capacity: capacity,
    currentApplicants: currentApplicants,
    remainingCapacity: remainingCapacity,
    firstComeServed: firstComeServed,
    canApply: canApply,
    eligibilityReason: eligibilityReason,
    eligibilityMessage: '',
    availableActions: availableActions,
    canSubscribeVacancy: false,
    vacancySubscribed: false,
    vacancySubscriptionStatus: null,
    status: status,
    files: const [],
  );
}
