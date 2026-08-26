import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/app/app.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/suitability_level.dart';
import 'package:geti_app/features/recommendation/presentation/widgets/recommendation_uninterested_bottom_sheet.dart';

class _FakeAuthTokenStorage implements AuthTokenStorage {
  String? accessToken = 'existing';
  String? refreshToken = 'existing';

  @override
  Future<String?> readAccessToken() async => accessToken;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    accessToken = tokens.accessToken;
    refreshToken = tokens.refreshToken;
  }

  @override
  Future<void> clear() async {
    accessToken = null;
    refreshToken = null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('관심 없음 버튼을 누르면 설정 BottomSheet를 표시한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authTokenStorageProvider.overrideWithValue(_FakeAuthTokenStorage()),
        ],
        child: const GetiApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('관심 없음').first);
    await tester.pumpAndSettle();

    expect(find.text('관심 없는 공고로 설정'), findsOneWidget);
    expect(find.text('이 공고만'), findsOneWidget);
    expect(find.text('비슷한 공고도'), findsOneWidget);
    expect(find.text('취소'), findsOneWidget);
    expect(find.text('설정'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('북마크를 누르면 저장 상태만 전환한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authTokenStorageProvider.overrideWithValue(_FakeAuthTokenStorage()),
        ],
        child: const GetiApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('bookmark-filled')), findsNothing);

    await tester.tap(find.byKey(const ValueKey('bookmark')).first);
    await tester.pump();

    expect(find.byKey(const ValueKey('bookmark-filled')), findsOneWidget);
    expect(find.text('저장되었습니다.'), findsNothing);

    await tester.tap(find.byKey(const ValueKey('bookmark-filled')));
    await tester.pump();

    expect(find.byKey(const ValueKey('bookmark-filled')), findsNothing);
    expect(find.byKey(const ValueKey('bookmark')), findsWidgets);
  });

  testWidgets('관심 없음으로 설정된 공고는 카드 버튼을 해제로 표시한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final container = ProviderContainer(
      overrides: [
        authTokenStorageProvider.overrideWithValue(_FakeAuthTokenStorage()),
      ],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(
      recommendationViewModelProvider,
      (_, _) {},
    );
    addTearDown(subscription.close);

    final job = container.read(recommendationViewModelProvider).jobs.first;
    container
        .read(recommendationViewModelProvider.notifier)
        .openUninterested(job);
    container
        .read(recommendationViewModelProvider.notifier)
        .confirmUninterested();
    await tester.pump(const Duration(milliseconds: 900));

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const GetiApp()),
    );
    await tester.pumpAndSettle();

    expect(find.text('해제'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('관심 없음으로 설정되었습니다.'), findsNothing);
  });

  testWidgets('설정 범위를 변경할 수 있다', (tester) async {
    UninterestedScope? selectedScope;
    await _pumpSheet(
      tester,
      status: UninterestedSheetStatus.selecting,
      onScopeChanged: (scope) => selectedScope = scope,
    );

    await tester.tap(find.text('비슷한 공고도'));

    expect(selectedScope, UninterestedScope.similarJobs);
    expect(tester.takeException(), isNull);
  });

  testWidgets('관심 없음 설정 해제 UI를 표시한다', (tester) async {
    await _pumpSheet(tester, status: UninterestedSheetStatus.unsetting);

    expect(find.text('관심 없음 설정 해제'), findsOneWidget);
    expect(find.text('Cloud Platform Engineer'), findsOneWidget);
    expect(find.text('해제'), findsOneWidget);
    expect(find.text('확인'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('처리 중 상태에서 회전 로딩을 표시한다', (tester) async {
    await _pumpSheet(tester, status: UninterestedSheetStatus.processing);

    expect(find.text('관심 없음 설정 중...'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('uninterested-loading-spinner')),
      findsOneWidget,
    );
    expect(find.text('잠시만 기다려 주세요.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('해제 처리 중에는 설정 해제 중 문구를 표시한다', (tester) async {
    await _pumpSheet(
      tester,
      status: UninterestedSheetStatus.processing,
      isUnsetting: true,
    );

    expect(find.text('관심 없음 설정 해제 중...'), findsOneWidget);
    expect(find.text('관심 없음 설정 중...'), findsNothing);
  });

  final failureCases =
      <({UninterestedSheetStatus status, String title, String action})>[
        (
          status: UninterestedSheetStatus.settingFailed,
          title: '관심 없음 설정에 실패했습니다.',
          action: '다시 시도',
        ),
        (
          status: UninterestedSheetStatus.alreadyUninterested,
          title: '이미 관심없음으로 설정한 공고입니다.',
          action: '확인',
        ),
        (
          status: UninterestedSheetStatus.unsettingFailed,
          title: '관심 없음 설정 해제에 실패했습니다.',
          action: '다시 시도',
        ),
        (
          status: UninterestedSheetStatus.notUninterested,
          title: '이미 관심 없음 공고가 아닙니다.',
          action: '확인',
        ),
      ];

  for (final testCase in failureCases) {
    testWidgets('${testCase.status.name} 실패 Frame을 표시한다', (tester) async {
      await _pumpSheet(tester, status: testCase.status);

      expect(find.text(testCase.title), findsOneWidget);
      expect(find.text(testCase.action), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('설정 완료 성공 알림을 표시한다', (tester) async {
    await _pumpWidget(tester, UninterestedSuccessBanner(onClose: () {}));

    expect(find.text('관심 없음으로 설정되었습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('현재 공고 설정은 처리 중을 거쳐 완료 상태로 전환한다', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(
      recommendationViewModelProvider,
      (previous, next) {},
    );
    addTearDown(subscription.close);
    final viewModel = container.read(recommendationViewModelProvider.notifier);
    final job = container.read(recommendationViewModelProvider).jobs.first;

    viewModel.openUninterested(job);
    final future = viewModel.confirmUninterested();

    expect(
      container.read(recommendationViewModelProvider).uninterestedSheetStatus,
      UninterestedSheetStatus.processing,
    );

    await future;

    final state = container.read(recommendationViewModelProvider);
    expect(state.uninterestedSheetStatus, UninterestedSheetStatus.hidden);
    expect(state.uninterestedJobs, contains(job));
    expect(state.showUninterestedSuccess, isTrue);

    await Future<void>.delayed(const Duration(seconds: 1));
    expect(
      container.read(recommendationViewModelProvider).showUninterestedSuccess,
      isFalse,
    );
  });
}

const _job = RecommendationJob(
  companyName: '네이버클라우드',
  positionName: 'Cloud Platform Engineer',
  summary: '분당 · 정규직 · D-18',
  tags: ['React', 'TypeScript'],
  availability: RecommendationJobAvailability.active,
  suitabilityLevel: SuitabilityLevel.highlyRecommended,
  matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
);

Future<void> _pumpSheet(
  WidgetTester tester, {
  required UninterestedSheetStatus status,
  ValueChanged<UninterestedScope>? onScopeChanged,
  bool isUnsetting = false,
}) {
  return _pumpWidget(
    tester,
    RecommendationUninterestedBottomSheet(
      status: status,
      job: _job,
      scope: UninterestedScope.currentJob,
      isUnsetting: isUnsetting,
      onScopeChanged: onScopeChanged ?? (_) {},
      onClose: () {},
      onConfirm: () {},
      onUnset: () {},
      onRetry: () {},
    ),
  );
}

Future<void> _pumpWidget(WidgetTester tester, Widget child) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: Align(alignment: Alignment.bottomCenter, child: child),
        ),
      ),
    ),
  );
  await tester.pump();
}
