import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/company/presentation/view/company_detail_view.dart';
import 'package:geti_app/features/company/presentation/view/company_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('기업 목록이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/companies');

    expect(find.text('기업 정보'), findsAtLeastNWidgets(1));
    expect(find.text('네이버클라우드'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색어로 기업을 필터링할 수 있다', (tester) async {
    await _pumpRoute(tester, '/companies');

    await tester.enterText(
      find.byKey(const ValueKey('company-search-field')),
      '카카',
    );
    await tester.pumpAndSettle();

    expect(find.text('카카오'), findsOneWidget);
    expect(find.text('네이버클라우드'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색 결과가 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies');

    await tester.enterText(
      find.byKey(const ValueKey('company-search-field')),
      '존재하지 않는 기업',
    );
    await tester.pumpAndSettle();

    expect(find.text('검색 결과가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('목록에서 채용 중인 공고가 있는 기업은 개수가 표시되고, 탭하면 상세로 이동한다', (tester) async {
    await _pumpRoute(tester, '/companies');

    expect(find.text('1개'), findsAtLeastNWidgets(1));

    await tester.tap(find.text('네이버클라우드'));
    await tester.pumpAndSettle();

    expect(find.text('기업 상세'), findsOneWidget);
    expect(find.text('IT 서비스'), findsOneWidget);
    expect(find.text('채용 공고 1'), findsOneWidget);
    expect(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('채용 중인 공고가 없는 기업은 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies/kakao');

    expect(find.text('채용 공고 0'), findsOneWidget);
    expect(find.text('현재 채용 중인 공고가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 상세의 채용 공고를 탭하면 실제 채용 공고 상세로 이동한다', (tester) async {
    await _pumpRoute(tester, '/companies/naver-cloud');

    await tester.ensureVisible(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'));
    await tester.tap(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'));
    await tester.pumpAndSettle();

    expect(find.text('공고 상세'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('기업 홈페이지 버튼을 누르면 이동 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/companies/naver-cloud');

    await tester.tap(find.byKey(const ValueKey('company-homepage-link')));
    await tester.pumpAndSettle();

    expect(find.text('기업 홈페이지로 이동합니다.'), findsOneWidget);
    expect(find.text('naver-cloud.com'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

GoRouter _buildRouter({required String initialLocation}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(body: SizedBox()),
    ),
    GoRoute(
      path: '/companies',
      builder: (context, state) => const CompanyView(),
      routes: [
        GoRoute(
          path: ':companyId',
          builder: (context, state) =>
              CompanyDetailView(companyId: state.pathParameters['companyId']!),
        ),
      ],
    ),
    GoRoute(
      path: '/jobs/:jobId',
      builder: (context, state) =>
          JobDetailView(jobId: state.pathParameters['jobId']!),
    ),
  ],
);

Future<void> _pumpRoute(WidgetTester tester, String initialLocation) async {
  await _setViewport(tester);
  final router = _buildRouter(initialLocation: initialLocation);
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
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}
