import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/application/data/repository/application_repository_impl.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';
import 'package:geti_app/features/application/domain/model/job_application_detail.dart';
import 'package:geti_app/features/application/domain/repository/application_repository.dart';
import 'package:geti_app/features/application/presentation/view/application_detail_view.dart';
import 'package:geti_app/features/application/presentation/view/application_view.dart';
import 'package:geti_app/features/application/presentation/view_model/application_detail_view_model.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';
import 'package:geti_app/features/application/presentation/widgets/application_detail_state_content.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('목록 상세 라우팅은 status가 아니라 ApplicationItem id를 사용한다', () {
    const first = ApplicationItem(
      id: 'first-submitted',
      companyName: 'A',
      positionName: 'Frontend',
      status: ApplicationProgressStatus.submitted,
      submittedDate: '2026.08.01',
    );
    const second = ApplicationItem(
      id: 'second-submitted',
      companyName: 'B',
      positionName: 'Backend',
      status: ApplicationProgressStatus.submitted,
      submittedDate: '2026.08.02',
    );

    expect(first.detailId, 'first-submitted');
    expect(second.detailId, 'second-submitted');
  });

  test('withdrawApplication updates the list mock status too', () async {
    final container = ProviderContainer(
      overrides: [
        applicationRepositoryProvider.overrideWithValue(_fixtureRepository),
        applicationViewModelProvider.overrideWith(
          _DetailApplicationListViewModel.new,
        ),
      ],
    );
    final detailSubscription = container.listen(
      applicationDetailViewModelProvider('2'),
      (_, _) {},
      fireImmediately: true,
    );
    final listSubscription = container.listen(
      applicationViewModelProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(detailSubscription.close);
    addTearDown(listSubscription.close);
    addTearDown(container.dispose);

    await container
        .read(applicationDetailViewModelProvider('2').notifier)
        .retry();
    container
        .read(applicationDetailViewModelProvider('2').notifier)
        .withdrawApplication();

    final application = container
        .read(applicationViewModelProvider)
        .applications
        .singleWhere((application) => application.id == '2');
    expect(application.status, ApplicationProgressStatus.cancelled);
  });

  test('resubmitApplication updates the list mock status too', () async {
    final container = ProviderContainer(
      overrides: [
        applicationRepositoryProvider.overrideWithValue(_fixtureRepository),
        applicationViewModelProvider.overrideWith(
          _DetailApplicationListViewModel.new,
        ),
      ],
    );
    final detailSubscription = container.listen(
      applicationDetailViewModelProvider('1'),
      (_, _) {},
      fireImmediately: true,
    );
    final listSubscription = container.listen(
      applicationViewModelProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(detailSubscription.close);
    addTearDown(listSubscription.close);
    addTearDown(container.dispose);

    await container
        .read(applicationDetailViewModelProvider('1').notifier)
        .retry();
    container
        .read(applicationDetailViewModelProvider('1').notifier)
        .resubmitApplication();

    final application = container
        .read(applicationViewModelProvider)
        .applications
        .singleWhere((application) => application.id == '1');
    expect(application.status, ApplicationProgressStatus.submitted);
  });

  test('submitted 상세는 수정 보완 요청 notice를 표시하지 않는다', () {
    final submitted = mockApplicationDetails['submitted'];

    expect(submitted, isNotNull);
    expect(submitted!.variant, ApplicationDetailVariant.submitted);
    expect(submitted.noticeTitle, isNull);
    expect(submitted.noticeDescription, isNull);
  });

  final detailCases = <String, List<String>>{
    '1': ['수정 요청', '수정·보완 요청', '웹에서 수정·재제출'],
    '2': ['제출 완료', '지원 취소'],
    '3': ['취소', '취소 완료', '해당 지원이 취소되었습니다.'],
  };

  for (final detailCase in detailCases.entries) {
    testWidgets('${detailCase.key} 상세 상태를 표시한다', (tester) async {
      await _pumpWidget(
        tester,
        ProviderScope(
          child: ApplicationDetailView(applicationId: detailCase.key),
        ),
      );

      for (final text in detailCase.value) {
        expect(find.text(text), findsAtLeastNWidgets(1));
      }
      expect(find.text('지원 동기'), findsOneWidget);
      expect(find.text('portfolio.pdf'), findsOneWidget);
      expect(find.text('상태 이력'), findsNothing);
      expect(find.byType(BottomNavigationBar), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('삭제 공고와 기존 상태 이력 fixture UI는 유지된다', (tester) async {
    await _pumpWidget(
      tester,
      ApplicationDetailBody(
        state: ApplicationDetailViewState(
          detail: mockApplicationDetails['deleted'],
        ),
        onRetry: () {},
        onBrowseJobs: () {},
        onWithdraw: () {},
        onResubmit: () {},
      ),
    );

    expect(find.text('지원 종료'), findsOneWidget);
    expect(find.text('삭제된 공고'), findsAtLeastNWidgets(1));
    expect(find.text('상태 이력'), findsOneWidget);
  });

  testWidgets('제출 완료 상세에서 지원 취소를 누르면 취소 완료 상태로 전환된다', (tester) async {
    await _pumpWidget(
      tester,
      const ProviderScope(child: ApplicationDetailView(applicationId: '2')),
    );

    await tester.tap(find.byKey(const ValueKey('application-detail-withdraw')));
    await tester.pumpAndSettle();
    expect(
      find.byKey(const ValueKey('application-withdraw-confirm')),
      findsOneWidget,
    );

    await tester.tap(
      find.byKey(const ValueKey('application-withdraw-confirm')),
    );
    await tester.pumpAndSettle();

    expect(find.text('취소'), findsOneWidget);
    expect(find.text('취소 완료'), findsOneWidget);
    expect(find.text('해당 지원이 취소되었습니다.'), findsOneWidget);
    expect(find.text('지원 취소'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('application-detail-withdraw')),
      findsNothing,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('withdraw dialog close keeps submitted state', (tester) async {
    await _pumpWidget(
      tester,
      const ProviderScope(child: ApplicationDetailView(applicationId: '2')),
    );

    await tester.tap(find.byKey(const ValueKey('application-detail-withdraw')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('application-withdraw-close')));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey('application-withdraw-confirm')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('application-detail-withdraw')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('수정 요청 상세에서 웹 수정 재제출을 누르면 제출 완료 상태로 전환된다', (tester) async {
    await _pumpWidget(
      tester,
      const ProviderScope(child: ApplicationDetailView(applicationId: '1')),
    );

    await tester.tap(find.byKey(const ValueKey('application-detail-resubmit')));
    await tester.pump();

    expect(find.text('제출 완료'), findsAtLeastNWidgets(1));
    expect(find.text('재제출 완료'), findsOneWidget);
    expect(find.text('수정·보완 요청'), findsNothing);
    expect(
      find.byKey(const ValueKey('application-detail-resubmit')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('application-detail-withdraw')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('수정 요청 상세에서 지원 취소를 누르면 취소 완료 상태로 전환된다', (tester) async {
    await _pumpWidget(
      tester,
      const ProviderScope(child: ApplicationDetailView(applicationId: '1')),
    );

    await tester.tap(find.byKey(const ValueKey('application-detail-withdraw')));
    await tester.pumpAndSettle();
    expect(
      find.byKey(const ValueKey('application-withdraw-confirm')),
      findsOneWidget,
    );

    await tester.tap(
      find.byKey(const ValueKey('application-withdraw-confirm')),
    );
    await tester.pumpAndSettle();

    expect(find.text('취소'), findsOneWidget);
    expect(find.text('취소 완료'), findsOneWidget);
    expect(find.text('해당 지원이 취소되었습니다.'), findsOneWidget);
    expect(find.text('지원 취소'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('application-detail-resubmit')),
      findsNothing,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('로딩 상태를 표시한다', (tester) async {
    await _pumpState(tester, ApplicationDetailScreenStatus.loading);
    expect(
      find.byKey(const ValueKey('application-detail-loading')),
      findsOneWidget,
    );
    expect(find.text('불러오는 중이에요.'), findsOneWidget);
  });

  testWidgets('빈 상태를 표시한다', (tester) async {
    await _pumpState(tester, ApplicationDetailScreenStatus.empty);
    expect(find.text('지원 내역이 없습니다.'), findsOneWidget);
  });

  testWidgets('네트워크 오류에서 다시 시도를 실행한다', (tester) async {
    var retried = false;
    await _pumpWidget(
      tester,
      ApplicationDetailStateContent(
        status: ApplicationDetailScreenStatus.networkError,
        onRetry: () => retried = true,
      ),
    );
    await tester.tap(find.text('다시 시도'));
    expect(retried, isTrue);
  });

  testWidgets('목록 카드를 누르면 상세로 이동하고 뒤로 돌아온다', (tester) async {
    await _setViewport(tester);
    final router = GoRouter(
      initialLocation: '/applications',
      routes: [
        GoRoute(
          path: '/applications',
          builder: (context, state) => const ApplicationView(),
          routes: [
            GoRoute(
              path: ':applicationId',
              builder: (context, state) => ApplicationDetailView(
                applicationId: state.pathParameters['applicationId']!,
              ),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          applicationRepositoryProvider.overrideWithValue(_fixtureRepository),
          applicationViewModelProvider.overrideWith(
            _DetailApplicationListViewModel.new,
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) => MaterialApp.router(routerConfig: router),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('웹 프론트엔드 인턴').first);
    await tester.pumpAndSettle();
    expect(find.text('지원 상세'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('application-detail-back')));
    await tester.pumpAndSettle();
    expect(find.text('내 지원 목록'), findsOneWidget);
  });

  testWidgets('missing application CTA navigates to the jobs route', (
    tester,
  ) async {
    await _setViewport(tester);
    final router = GoRouter(
      initialLocation: '/applications/missing',
      routes: [
        GoRoute(
          path: '/applications/:applicationId',
          builder: (context, state) => ApplicationDetailView(
            applicationId: state.pathParameters['applicationId']!,
          ),
        ),
        GoRoute(
          path: '/jobs',
          builder: (context, state) =>
              const Scaffold(body: SizedBox(key: ValueKey('jobs-route'))),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) => MaterialApp.router(routerConfig: router),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FilledButton));
    await tester.pumpAndSettle();

    expect(router.state.uri.path, '/jobs');
    expect(find.byKey(const ValueKey('jobs-route')), findsOneWidget);
  });
}

class _DetailApplicationListViewModel extends ApplicationViewModel {
  @override
  ApplicationViewState build() => const ApplicationViewState(
    screenStatus: ApplicationScreenStatus.loaded,
    applications: [
      ApplicationItem(
        id: '2',
        companyName: '당근',
        positionName: '웹 프론트엔드 인턴',
        status: ApplicationProgressStatus.submitted,
        submittedDate: '2026.08.01',
      ),
      ApplicationItem(
        id: '1',
        companyName: '당근',
        positionName: '웹 프론트엔드 인턴',
        status: ApplicationProgressStatus.revisionRequested,
        submittedDate: '2026.08.01',
      ),
    ],
  );
}

Future<void> _pumpState(
  WidgetTester tester,
  ApplicationDetailScreenStatus status,
) {
  return _pumpWidget(
    tester,
    ApplicationDetailStateContent(status: status, onRetry: () {}),
  );
}

Future<void> _pumpWidget(WidgetTester tester, Widget child) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        applicationRepositoryProvider.overrideWithValue(_fixtureRepository),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, _) => MaterialApp(home: Scaffold(body: child)),
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

final ApplicationRepository _fixtureRepository = _FakeDetailRepository({
  1: _detail(
    id: 1,
    status: ApplicationStatus.revisionRequested,
    statusReason: '지원 동기의 프로젝트 경험을 조금 더 구체적으로 작성해 주세요.',
  ),
  2: _detail(id: 2, status: ApplicationStatus.submitted),
  3: _detail(id: 3, status: ApplicationStatus.withdrawn),
});

class _FakeDetailRepository implements ApplicationRepository {
  const _FakeDetailRepository(this.details);

  final Map<int, JobApplicationDetail> details;

  @override
  Future<JobApplicationDetail?> getApplicationDetail(int applicationId) async =>
      details[applicationId];

  @override
  Future<List<ApplicationSummary>> getMyApplications() async => const [];
}

JobApplicationDetail _detail({
  required int id,
  required ApplicationStatus status,
  String? statusReason,
}) {
  return JobApplicationDetail(
    applicationId: id,
    jobId: 10,
    jobTitle: 'Frontend Developer',
    companyName: '토스페이먼츠',
    managerMemberId: null,
    managerName: null,
    formId: 20,
    formVersion: 1,
    status: status,
    statusReason: statusReason,
    contactEmail: 'student@example.com',
    contactPhone: null,
    privacyConsent: true,
    applicantName: null,
    applicantCohort: null,
    applicantDepartment: null,
    applicantMajors: const [],
    applicantDesiredJob: null,
    applicantTechStacks: const [],
    answers: const [
      JobApplicationAnswer(
        fieldId: 'motivation',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
        fileIds: null,
      ),
    ],
    files: const [
      JobApplicationFile(
        fileId: 30,
        originalName: 'portfolio.pdf',
        contentType: 'application/pdf',
        size: 1887437,
        downloadUrl: 'https://example.com/portfolio.pdf',
      ),
    ],
    submittedAt: DateTime(2026, 8, 1, 14, 32),
    withdrawnAt: status == ApplicationStatus.withdrawn
        ? DateTime(2026, 8, 8, 15, 20)
        : null,
    createdAt: DateTime(2026, 8, 1),
    updatedAt: DateTime(2026, 8, 2),
    availableActions: const [],
    questions: const [
      JobApplicationQuestion(
        fieldId: 'motivation',
        type: ApplicationQuestionType.textarea,
        title: '지원 동기',
        description: null,
        isRequired: true,
        order: 1,
        options: null,
        filePolicy: null,
      ),
    ],
  );
}
