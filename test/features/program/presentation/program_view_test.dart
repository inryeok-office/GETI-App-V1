import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/program/data/dto/program_list_response.dart';
import 'package:geti_app/features/program/data/program_repository.dart';
import 'package:geti_app/features/program/presentation/view/program_view.dart';
import 'package:geti_app/features/program/presentation/view_model/program_type.dart';
import 'package:geti_app/features/program/presentation/view_model/program_view_model.dart';
import 'package:geti_app/features/program/presentation/widgets/program_card.dart';
import 'package:geti_app/features/program/presentation/widgets/program_state_content.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('API program type enum values map to existing UI types', () {
    expect(programTypeFrom('SPECIAL_LECTURE'), ProgramType.specialLecture);
    expect(programTypeFrom('EDUCATION'), ProgramType.education);
    expect(programTypeFrom('UNKNOWN'), ProgramType.specialLecture);
  });

  test('ProgramSummaryResponse maps to ProgramItem safely', () {
    final item = ProgramItem.fromSummary(_programFixtures[1]);

    expect(item.id, '2');
    expect(item.title, 'API 교육');
    expect(item.type, ProgramType.education);
    expect(item.status, ProgramRecruitmentStatus.closed);
    expect(item.location, '장소 미정');
    expect(item.schedule, '일정 미정');
    expect(item.applicationPeriod, '신청 기간 미정');
    expect(item.isApplied, isFalse);
  });

  test('API program status enum values map to existing list badges', () {
    expect(
      programRecruitmentStatusFrom('DRAFT'),
      ProgramRecruitmentStatus.upcoming,
    );
    expect(
      programRecruitmentStatusFrom('PUBLISHED'),
      ProgramRecruitmentStatus.recruiting,
    );
    expect(
      programRecruitmentStatusFrom('PUBLISHED', remainingCapacity: 0),
      ProgramRecruitmentStatus.full,
    );
    expect(
      programRecruitmentStatusFrom('CLOSED'),
      ProgramRecruitmentStatus.closed,
    );
    expect(
      programRecruitmentStatusFrom('DELETED'),
      ProgramRecruitmentStatus.deleted,
    );
  });

  testWidgets('API response content is rendered in the all tab', (
    tester,
  ) async {
    await _pumpView(tester);

    expect(find.byType(ProgramCard), findsWidgets);
    expect(find.text('API 특강'), findsOneWidget);
    expect(find.text('API 교육'), findsOneWidget);
    expect(find.text('삭제된 API 프로그램'), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(find.text('초안 API 프로그램'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('applied tab shows API items whose applied flag is true', (
    tester,
  ) async {
    await _pumpView(tester);

    await tester.tap(find.byKey(const ValueKey('program-tab-applied')));
    await tester.pumpAndSettle();

    expect(find.byType(ProgramCard), findsNWidgets(2));
    expect(find.text('API 특강'), findsOneWidget);
    expect(find.text('삭제된 API 프로그램'), findsOneWidget);
    expect(find.text('API 교육'), findsNothing);
  });

  testWidgets('empty all tab state is preserved', (tester) async {
    await _pumpBody(tester, const ProgramViewState(programs: []));

    expect(find.byType(ProgramEmptyState), findsOneWidget);
  });

  testWidgets('empty applied tab state is preserved', (tester) async {
    await _pumpBody(
      tester,
      const ProgramViewState(selectedTab: ProgramTab.applied, programs: []),
    );

    expect(find.byType(ProgramEmptyState), findsOneWidget);
  });

  testWidgets('loading state is preserved', (tester) async {
    await _pumpBody(
      tester,
      const ProgramViewState(screenStatus: ProgramScreenStatus.loading),
    );

    expect(find.byType(ProgramLoadingState), findsOneWidget);
  });

  testWidgets('network error retry UI is preserved', (tester) async {
    var retried = false;
    await _pumpBody(
      tester,
      const ProgramViewState(screenStatus: ProgramScreenStatus.networkError),
      onRetry: () => retried = true,
    );

    expect(find.byType(ProgramNetworkErrorState), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('program-retry')));
    expect(retried, isTrue);
  });

  testWidgets('API failure renders existing network error UI', (tester) async {
    await _pumpView(
      tester,
      repository: const _FakeProgramRepository(fails: true),
    );

    expect(find.byType(ProgramNetworkErrorState), findsOneWidget);
    expect(find.byKey(const ValueKey('program-retry')), findsOneWidget);
  });

  test('first page metadata is preserved in state', () async {
    final container = ProviderContainer(
      overrides: [
        programRepositoryProvider.overrideWithValue(
          const _FakeProgramRepository(pageSize: 2),
        ),
      ],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(
      programViewModelProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);

    await container.read(programViewModelProvider.notifier).retry();
    final state = container.read(programViewModelProvider);

    expect(state.programs, hasLength(2));
    expect(state.totalElements, _programFixtures.length);
    expect(state.totalPages, 2);
    expect(state.hasMore, isTrue);
  });

  test(
    'loadMore appends the next page only when more content exists',
    () async {
      final container = ProviderContainer(
        overrides: [
          programRepositoryProvider.overrideWithValue(
            const _FakeProgramRepository(pageSize: 2),
          ),
        ],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(
        programViewModelProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      await container.read(programViewModelProvider.notifier).retry();
      await container.read(programViewModelProvider.notifier).loadMore();
      final state = container.read(programViewModelProvider);

      expect(state.programs, hasLength(_programFixtures.length));
      expect(state.currentPage, 1);
      expect(state.hasMore, isFalse);
    },
  );

  test('older program list responses do not overwrite newer retries', () async {
    final repository = _DeferredProgramRepository();
    final container = ProviderContainer(
      overrides: [programRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(
      programViewModelProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);

    final notifier = container.read(programViewModelProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    repository.completeNext(_programListResponse([]));
    await Future<void>.delayed(Duration.zero);

    final firstRetry = notifier.retry();
    final secondRetry = notifier.retry();

    repository.completeLast(_programListResponse([_programFixtures[0]]));
    await secondRetry;

    repository.completeNext(_programListResponse([_programFixtures[1]]));
    await firstRetry;

    final state = container.read(programViewModelProvider);
    expect(state.programs.map((program) => program.id), ['1']);
  });
}

Future<void> _pumpView(
  WidgetTester tester, {
  ProgramRepository? repository,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        programRepositoryProvider.overrideWithValue(
          repository ?? const _FakeProgramRepository(),
        ),
      ],
      child: const ScreenUtilInit(
        designSize: Size(390, 844),
        child: MaterialApp(home: ProgramView()),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _pumpBody(
  WidgetTester tester,
  ProgramViewState state, {
  VoidCallback? onRetry,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        home: Scaffold(
          body: ProgramScreenBody(
            state: state,
            onTabSelected: (_) {},
            onRetry: onRetry ?? () {},
            onLoadMore: () {},
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

class _DeferredProgramRepository implements ProgramRepository {
  final _requests = <Completer<ProgramListResponse>>[];

  void completeNext(ProgramListResponse response) {
    _requests.removeAt(0).complete(response);
  }

  void completeLast(ProgramListResponse response) {
    _requests.removeLast().complete(response);
  }

  @override
  Future<ProgramListResponse> getPrograms({
    String? programType,
    String? status,
    bool? openOnly,
    int page = 0,
    int size = 20,
    List<String>? sort,
  }) {
    final completer = Completer<ProgramListResponse>();
    _requests.add(completer);
    return completer.future;
  }
}

ProgramListResponse _programListResponse(List<ProgramSummaryResponse> content) {
  return ProgramListResponse(
    content: content,
    page: 0,
    size: content.length,
    totalElements: content.length,
    totalPages: 1,
    first: true,
    last: true,
  );
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

class _FakeProgramRepository implements ProgramRepository {
  const _FakeProgramRepository({this.fails = false, this.pageSize});

  final bool fails;
  final int? pageSize;

  @override
  Future<ProgramListResponse> getPrograms({
    String? programType,
    String? status,
    bool? openOnly,
    int page = 0,
    int size = 20,
    List<String>? sort,
  }) async {
    if (fails) {
      throw const ProgramRepositoryException('network error');
    }

    final effectiveSize = pageSize ?? size;
    final start = page * effectiveSize;
    final content = start >= _programFixtures.length
        ? <ProgramSummaryResponse>[]
        : _programFixtures
              .skip(start)
              .take(effectiveSize)
              .toList(growable: false);

    return ProgramListResponse(
      content: content,
      page: page,
      size: effectiveSize,
      totalElements: _programFixtures.length,
      totalPages: (_programFixtures.length / effectiveSize).ceil(),
      first: page == 0,
      last: start + content.length >= _programFixtures.length,
    );
  }
}

final _programFixtures = [
  ProgramSummaryResponse(
    programId: 1,
    title: 'API 특강',
    programType: 'SPECIAL_LECTURE',
    status: 'PUBLISHED',
    location: '세미나실',
    startAt: DateTime(2026, 8, 12, 14),
    endAt: DateTime(2026, 8, 12, 16),
    applicationStartAt: DateTime(2026, 7, 20),
    applicationEndAt: DateTime(2026, 8, 10),
    capacity: 30,
    currentApplicants: 12,
    remainingCapacity: 18,
    firstComeServed: true,
    applied: true,
  ),
  ProgramSummaryResponse(
    programId: 2,
    title: 'API 교육',
    programType: 'EDUCATION',
    status: 'CLOSED',
    location: null,
    startAt: null,
    endAt: null,
    applicationStartAt: null,
    applicationEndAt: null,
    capacity: null,
    currentApplicants: 0,
    remainingCapacity: null,
    firstComeServed: false,
    applied: false,
  ),
  ProgramSummaryResponse(
    programId: 3,
    title: '삭제된 API 프로그램',
    programType: 'SPECIAL_LECTURE',
    status: 'DELETED',
    currentApplicants: 1,
    applied: true,
  ),
  ProgramSummaryResponse(
    programId: 4,
    title: '초안 API 프로그램',
    programType: 'EDUCATION',
    status: 'DRAFT',
    currentApplicants: 0,
  ),
];
