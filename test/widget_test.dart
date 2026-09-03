import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/app/app.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/core/network/session_provider.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:geti_app/features/recommendation/data/recommendation_repository.dart';
import 'package:geti_app/shared/theme/app_colors.dart';

void main() {
  testWidgets('기본 경로는 로그인 화면이며, 로그인 후 맞춤 추천 결과를 표시한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [_recommendationOverride()],
        child: const GetiApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('교내 계정으로 로그인'), findsOneWidget);

    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();

    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(find.text('추천 공고 6개'), findsOneWidget);
    expect(find.text('Cloud Platform Engineer'), findsAtLeastNWidgets(1));
    expect(find.text('공고'), findsOneWidget);

    final homeNavigation = find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.label == '홈',
    );
    final jobsNavigation = find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.label == '공고',
    );
    final homeIcon = tester.widget<SvgPicture>(
      find.descendant(of: homeNavigation, matching: find.byType(SvgPicture)),
    );
    final jobsIcon = tester.widget<SvgPicture>(
      find.descendant(of: jobsNavigation, matching: find.byType(SvgPicture)),
    );

    expect(
      homeIcon.colorFilter,
      const ColorFilter.mode(AppColors.primaryAccent, BlendMode.srcIn),
    );
    expect(
      jobsIcon.colorFilter,
      const ColorFilter.mode(AppColors.neutral500, BlendMode.srcIn),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('세션이 만료되면 자동으로 재로그인 안내로 이동한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final container = ProviderContainer(overrides: [_recommendationOverride()]);
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const GetiApp()),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('교내 계정으로 로그인'));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();
    expect(find.text('맞춤 추천'), findsOneWidget);

    container.read(sessionExpiredProvider.notifier).notifyExpired();
    await tester.pumpAndSettle();

    expect(find.text('로그인이 만료되었습니다.'), findsOneWidget);
    expect(container.read(sessionExpiredProvider), isFalse);
    expect(container.read(authViewModelProvider).loginResult, isNull);
    expect(tester.takeException(), isNull);
  });
}

dynamic _recommendationOverride() {
  return recommendationRepositoryProvider.overrideWithValue(
    RecommendationRepository(
      _FakeRestClient(
        response: ApiResponseRecommendationListResponse(
          success: true,
          data: RecommendationListResponse(
            enabled: true,
            status: 'READY',
            generatedAt: null,
            nextGenerationAt: null,
            content: List.generate(6, (index) => _recommendationItem(index)),
            page: 0,
            size: 20,
            totalElements: 6,
            totalPages: 1,
            first: true,
            last: true,
          ),
        ),
      ),
    ),
  );
}

RecommendationItemResponse _recommendationItem(int index) {
  return RecommendationItemResponse(
    recommendationId: index + 1,
    job: RecommendationJobResponse(
      jobId: index + 10,
      title: 'Cloud Platform Engineer',
      postingType: 'GENERAL',
      applicationMethod: 'INTERNAL',
      status: 'PUBLISHED',
      company: const RecommendationCompanySummaryResponse(
        companyId: 1,
        name: '네이버클라우드',
        logoUrl: null,
      ),
      endDate: null,
      viewCount: 12,
      bookmarked: false,
      techStacks: const [
        RecommendationTechStackResponse(techStackId: 1, name: 'React'),
        RecommendationTechStackResponse(techStackId: 2, name: 'TypeScript'),
      ],
      bookmarkCount: 3,
    ),
    score: 93,
    suitabilityLevel: 'HIGHLY_RECOMMENDED',
    rank: index + 1,
    reasons: const [
      RecommendationReasonResponse(
        type: 'REQUIRED_SKILL_MATCH',
        matchedCount: 2,
        totalCount: 3,
      ),
    ],
    generatedAt: DateTime.utc(2026, 9, 2, 9),
  );
}

class _FakeRestClient implements RestClient {
  const _FakeRestClient({required this.response});

  final ApiResponseRecommendationListResponse response;

  @override
  Future<ApiResponseRecommendationListResponse> getMyRecommendations({
    String? suitabilityLevel,
    int page = 0,
    int size = 20,
  }) async {
    return response;
  }
}
