import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
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

  test('submitted 상세는 수정 보완 요청 notice를 표시하지 않는다', () {
    final submitted = mockApplicationDetails['submitted'];

    expect(submitted, isNotNull);
    expect(submitted!.variant, ApplicationDetailVariant.submitted);
    expect(submitted.noticeTitle, isNull);
    expect(submitted.noticeDescription, isNull);
  });

  final detailCases = <String, List<String>>{
    'revision': ['수정 요청', '수정·보완 요청', '웹에서 수정·재제출'],
    'submitted': ['제출 완료', '지원 취소'],
    'cancelled': ['취소', '취소 완료', '해당 지원이 취소되었습니다.'],
    'deleted': ['지원 종료', '삭제된 공고'],
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
      expect(find.text('상태 이력'), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

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
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => MaterialApp(home: Scaffold(body: child)),
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
