import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/application/presentation/view/application_view.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';
import 'package:geti_app/features/application/presentation/widgets/application_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('진행 중 필터는 진행 중인 지원만 표시한다', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await _pumpApplicationView(tester, container);

    await tester.tap(
      find.byKey(const ValueKey('application-filter-inProgress')),
    );
    await tester.pump();

    final applications = tester
        .widgetList<ApplicationCard>(find.byType(ApplicationCard))
        .map((card) => card.application);
    expect(applications, hasLength(4));
    expect(applications.every((item) => item.status.isInProgress), isTrue);
  });

  testWidgets('종료 필터는 종료된 지원만 표시한다', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await _pumpApplicationView(tester, container);

    await tester.tap(find.byKey(const ValueKey('application-filter-closed')));
    await tester.pump();

    final applications = tester
        .widgetList<ApplicationCard>(find.byType(ApplicationCard))
        .map((card) => card.application);
    expect(applications, hasLength(4));
    expect(applications.every((item) => item.status.isClosed), isTrue);
  });

  testWidgets('선택한 필터에 지원 내역이 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpWidget(
      tester,
      ApplicationScreenBody(
        state: const ApplicationViewState(
          selectedFilter: ApplicationFilter.closed,
          applications: [
            ApplicationItem(
              companyName: 'GETI',
              positionName: 'Flutter Developer',
              status: ApplicationProgressStatus.submitted,
              submittedDate: '2026.08.11',
            ),
          ],
        ),
        onFilterSelected: (_) {},
        onRetry: () {},
      ),
    );

    expect(find.byType(ApplicationCard), findsNothing);
    expect(find.text('지원 내역이 없습니다.'), findsOneWidget);
  });

  testWidgets('기본 내 지원 목록과 마이 탭을 표시한다', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await _pumpApplicationView(tester, container);

    expect(find.text('내 지원'), findsOneWidget);
    expect(find.text('내 지원 목록'), findsOneWidget);
    expect(find.text('제출 완료'), findsOneWidget);
    expect(find.text('검토 중'), findsOneWidget);
    final myNavigation = tester.widget<Semantics>(
      find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.label == '마이',
      ),
    );
    expect(myNavigation.properties.selected, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('필터 선택 상태를 ViewModel에 반영한다', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await _pumpApplicationView(tester, container);

    await tester.tap(
      find.byKey(const ValueKey('application-filter-inProgress')),
    );
    await tester.pump();

    expect(
      container.read(applicationViewModelProvider).selectedFilter,
      ApplicationFilter.inProgress,
    );
    expect(find.text('제출 완료'), findsOneWidget);
  });

  testWidgets('수정 요청 카드를 표시한다', (tester) async {
    await _pumpCard(tester, ApplicationProgressStatus.revisionRequested);
    expect(find.text('수정 요청'), findsOneWidget);
    expect(find.text('제출일 2026.08.01'), findsOneWidget);
  });

  testWidgets('삭제된 공고 카드와 안내를 표시한다', (tester) async {
    await _pumpWidget(
      tester,
      const ApplicationCard(
        application: ApplicationItem(
          companyName: '네이버클라우드',
          positionName: '삭제된 공고',
          status: ApplicationProgressStatus.ended,
          submittedDate: '2026.07.20',
          isDeleted: true,
        ),
      ),
    );
    expect(find.text('지원 종료'), findsOneWidget);
    expect(find.text('공고가 삭제되어 상세 내용을 확인할 수 없습니다.'), findsOneWidget);
    expect(find.byType(ApplicationCard), findsOneWidget);
  });

  final badgeCases = <ApplicationProgressStatus, String>{
    ApplicationProgressStatus.submitted: '제출 완료',
    ApplicationProgressStatus.reviewing: '검토 중',
    ApplicationProgressStatus.interviewing: '면접 진행',
    ApplicationProgressStatus.accepted: '합격',
    ApplicationProgressStatus.rejected: '불합격',
    ApplicationProgressStatus.cancelled: '취소',
  };

  for (final badgeCase in badgeCases.entries) {
    testWidgets('${badgeCase.value} Badge를 표시한다', (tester) async {
      await _pumpCard(tester, badgeCase.key);
      expect(find.text(badgeCase.value), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('로딩 상태를 표시한다', (tester) async {
    await _pumpState(tester, ApplicationScreenStatus.loading);
    expect(find.text('불러오는 중이에요.'), findsOneWidget);
    expect(find.text('잠시만 기다려 주세요.'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('application-loading-icon')),
      findsOneWidget,
    );
  });

  testWidgets('네트워크 오류와 재시도를 표시한다', (tester) async {
    var retried = false;
    await _pumpState(
      tester,
      ApplicationScreenStatus.networkError,
      onRetry: () => retried = true,
    );
    expect(find.text('네트워크 연결에 실패했습니다.'), findsOneWidget);
    await tester.tap(find.text('다시 시도'));
    expect(retried, isTrue);
  });

  testWidgets('지원 내역 없음 상태를 표시한다', (tester) async {
    await _pumpState(tester, ApplicationScreenStatus.empty);
    expect(find.text('지원 내역이 없습니다.'), findsOneWidget);
    expect(find.text('새로운 공고 둘러보기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

Future<void> _pumpApplicationView(
  WidgetTester tester,
  ProviderContainer container,
) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => const MaterialApp(home: ApplicationView()),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _pumpState(
  WidgetTester tester,
  ApplicationScreenStatus status, {
  VoidCallback? onRetry,
}) {
  return _pumpWidget(
    tester,
    ApplicationScreenBody(
      state: ApplicationViewState(screenStatus: status),
      onFilterSelected: (_) {},
      onRetry: onRetry ?? () {},
    ),
  );
}

Future<void> _pumpCard(WidgetTester tester, ApplicationProgressStatus status) {
  return _pumpWidget(
    tester,
    ApplicationCard(
      application: ApplicationItem(
        companyName: '당근',
        positionName: '웹 프론트엔드 인턴',
        status: status,
        submittedDate: '2026.08.01',
      ),
    ),
  );
}

Future<void> _pumpWidget(WidgetTester tester, Widget child) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: Center(child: SizedBox(width: 326, child: child)),
        ),
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
