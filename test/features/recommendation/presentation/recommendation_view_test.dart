import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/recommendation/presentation/view/recommendation_view.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('추천 생성 액션은 생성 중 상태로 전환한다', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(recommendationViewModelProvider.notifier).startGeneration();

    expect(
      container.read(recommendationViewModelProvider).status,
      RecommendationStatus.generating,
    );
  });

  testWidgets('추천 결과 없음 상태를 표시한다', (tester) async {
    await _pumpState(tester, RecommendationStatus.empty);

    expect(find.text('추천 공고가 없습니다.'), findsOneWidget);
    expect(find.text('프로필 관리하기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('추천 생성 전 상태에서 생성 액션을 실행한다', (tester) async {
    var generated = false;
    await _pumpState(
      tester,
      RecommendationStatus.beforeGeneration,
      onGenerate: () => generated = true,
    );

    await tester.tap(find.text('추천 생성하기'));

    expect(generated, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('추천 생성 중 상태를 표시한다', (tester) async {
    await _pumpState(tester, RecommendationStatus.generating);

    expect(
      find.byKey(const ValueKey('recommendation-loading-spinner')),
      findsOneWidget,
    );
    expect(find.text('추천 공고를 생성하고 있습니다.'), findsOneWidget);
    expect(find.textContaining('잠시만 기다려 주세요.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('추천 생성 실패 상태에서 재시도를 실행한다', (tester) async {
    var retried = false;
    await _pumpState(
      tester,
      RecommendationStatus.failure,
      onRetry: () => retried = true,
    );

    await tester.tap(find.text('다시 시도'));

    expect(retried, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감 및 접근 불가 Job Card를 표시한다', (tester) async {
    const jobs = [
      RecommendationJob(
        companyName: '네이버클라우드',
        positionName: 'Cloud Platform Engineer',
        summary: '분당 · 정규직 · D-18',
        tags: ['React', 'TypeScript'],
        availability: RecommendationJobAvailability.closed,
      ),
      RecommendationJob(
        companyName: '네이버클라우드',
        positionName: 'Cloud Platform Engineer',
        summary: '분당 · 정규직 · D-18',
        tags: [],
        availability: RecommendationJobAvailability.unavailable,
      ),
    ];

    await _pumpBody(
      tester,
      const RecommendationViewState(
        status: RecommendationStatus.loaded,
        jobs: jobs,
      ),
    );

    expect(
      find.text('마감된 공고입니다.\n지원 기간이 종료되어 더이상 지원할 수 없습니다.'),
      findsOneWidget,
    );
    expect(find.text('삭제 또는 비공개 처리되어 더이상 접근할 수 없습니다.'), findsOneWidget);
    expect(find.text('공고 보기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

Future<void> _pumpState(
  WidgetTester tester,
  RecommendationStatus status, {
  VoidCallback? onGenerate,
  VoidCallback? onRetry,
}) {
  return _pumpBody(
    tester,
    RecommendationViewState(status: status),
    onGenerate: onGenerate,
    onRetry: onRetry,
  );
}

Future<void> _pumpBody(
  WidgetTester tester,
  RecommendationViewState state, {
  VoidCallback? onGenerate,
  VoidCallback? onRetry,
}) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: RecommendationScreenBody(
            state: state,
            onGenerate: onGenerate ?? () {},
            onRetry: onRetry ?? () {},
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}
