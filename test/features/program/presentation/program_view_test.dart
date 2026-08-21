import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/program/presentation/view/program_view.dart';
import 'package:geti_app/features/program/presentation/view_model/program_view_model.dart';
import 'package:geti_app/features/program/presentation/view_model/program_type.dart';
import 'package:geti_app/features/program/presentation/widgets/program_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('ProgramType은 GETI PROGRAM_TYPE 명세 값을 UI 라벨과 분리해서 관리한다', () {
    expect(ProgramType.specialLecture.label, '특강');
    expect(ProgramType.education.label, '교육');
  });

  testWidgets('전체 목록과 홈 활성 상태를 표시한다', (tester) async {
    await _pumpView(tester);
    expect(mockPrograms, hasLength(7));
    expect(
      {for (final program in mockPrograms) program.id: program.type},
      {
        'applied': ProgramType.specialLecture,
        'cancelled': ProgramType.specialLecture,
        'deleted': ProgramType.specialLecture,
        'full': ProgramType.education,
        'upcoming': ProgramType.education,
        'closed': ProgramType.education,
        'available': ProgramType.specialLecture,
      },
    );
    expect(find.byType(ProgramCard), findsWidgets);
    final home = tester.widget<Semantics>(
      find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.label == '홈',
      ),
    );
    expect(home.properties.selected, isTrue);
    expect(tester.takeException(), isNull);
  });
  testWidgets('신청 탭은 신청한 프로그램만 표시한다', (tester) async {
    await _pumpView(tester);
    await tester.tap(find.byKey(const ValueKey('program-tab-applied')));
    await tester.pump();
    expect(mockPrograms.where((program) => program.isApplied), hasLength(3));
    expect(find.byType(ProgramCard), findsNWidgets(3));
    expect(find.text('신청 완료'), findsNWidgets(3));
    expect(find.text('프로그램 취소'), findsOneWidget);
    expect(find.text('삭제됨'), findsOneWidget);
    expect(find.text('삭제된 프로그램입니다.'), findsOneWidget);
  });

  testWidgets('목록 카드는 Figma에 없는 프로그램 유형 배지를 표시하지 않는다', (tester) async {
    await _pumpBody(
      tester,
      const ProgramViewState(
        programs: [
          ProgramItem(
            id: 'education',
            title: '취업 교육 프로그램',
            schedule: '08.12 14:00-16:00',
            location: '광주소프트웨어마이스터고 시청각실',
            applicationPeriod: '2026.07.20 - 2026.08.10',
            status: ProgramRecruitmentStatus.recruiting,
            type: ProgramType.education,
          ),
        ],
      ),
    );

    expect(find.text('모집 중'), findsOneWidget);
    expect(find.text('교육'), findsNothing);
    expect(find.byType(ProgramCard), findsOneWidget);
  });
  testWidgets('프로그램 없음 상태를 표시한다', (tester) async {
    await _pumpBody(tester, const ProgramViewState(programs: []));
    expect(find.text('프로그램이 없어요.'), findsOneWidget);
  });
  testWidgets('신청한 프로그램 없음 상태를 표시한다', (tester) async {
    await _pumpBody(
      tester,
      const ProgramViewState(selectedTab: ProgramTab.applied, programs: []),
    );
    expect(find.text('신청한 프로그램이 없어요.'), findsOneWidget);
  });
  testWidgets('로딩 상태를 표시한다', (tester) async {
    await _pumpBody(
      tester,
      const ProgramViewState(screenStatus: ProgramScreenStatus.loading),
    );
    expect(find.text('프로그램을 불러오는 중...'), findsOneWidget);
  });
  testWidgets('네트워크 오류에서 재시도한다', (tester) async {
    var retried = false;
    await _pumpBody(
      tester,
      const ProgramViewState(screenStatus: ProgramScreenStatus.networkError),
      onRetry: () => retried = true,
    );
    expect(find.text('프로그램을 불러오지 못했어요.'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('program-retry')));
    expect(retried, isTrue);
  });
}

Future<void> _pumpView(WidgetTester tester) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    const ProviderScope(
      child: ScreenUtilInit(
        designSize: Size(390, 844),
        child: MaterialApp(home: ProgramView()),
      ),
    ),
  );
  await tester.pump();
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
          ),
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
