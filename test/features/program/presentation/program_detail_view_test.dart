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
    expect(find.text('신청 완료'), findsOneWidget);
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
  });

  final actionCases = <ProgramDetailActionStatus, String>{
    ProgramDetailActionStatus.available: '신청하기',
    ProgramDetailActionStatus.upcoming: '모집 전입니다.',
    ProgramDetailActionStatus.full: '정원이 마감되었습니다.',
    ProgramDetailActionStatus.closed: '신청 기간이 종료되었습니다.',
    ProgramDetailActionStatus.applied: '신청 완료',
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
