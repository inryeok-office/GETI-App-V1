import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/api_error.dart';
import 'package:geti_app/features/job/data/dto/ai_reanalysis_response.dart';
import 'package:geti_app/features/job/data/dto/job_detail_response.dart';
import 'package:geti_app/features/job/data/dto/job_search_response.dart';
import 'package:geti_app/features/job/data/dto/job_source_response.dart';
import 'package:geti_app/features/job/data/dto/recommendation_job_response.dart';
import 'package:geti_app/features/job/data/job_repository.dart';
import 'package:geti_app/features/job/presentation/view/job_bookmark_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_view.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _FakeUrlLauncher extends UrlLauncherPlatform {
  String? launchedUrl;

  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    launchedUrl = url;
    return true;
  }
}

class _FakeJobRepository implements JobRepository {
  List<JobSummaryResponse> jobs = [];
  final Map<int, JobDetailResponse> details = {};
  final Map<int, JobDetailResponse> retryResults = {};
  List<RecommendationJobResponse> bookmarks = [];
  bool searchShouldFail = false;
  Object? getJobDetailError;

  @override
  Future<JobSearchResponse> searchJobs({
    String? query,
    String? postingType,
    String? applicationMethod,
    String? sourceName,
    String? sort,
    String? direction,
    int page = 0,
    int size = 20,
  }) async {
    if (searchShouldFail) {
      throw DioException(requestOptions: RequestOptions(path: '/api/v1/jobs'));
    }
    final filtered = jobs.where((job) {
      final matchesQuery =
          query == null ||
          query.isEmpty ||
          job.title.contains(query) ||
          (job.company?.name.contains(query) ?? false);
      final matchesType = postingType == null || job.postingType == postingType;
      final matchesMethod =
          applicationMethod == null ||
          job.applicationMethod == applicationMethod;
      return matchesQuery && matchesType && matchesMethod;
    }).toList();
    final start = page * size;
    final pageItems = start >= filtered.length
        ? <JobSummaryResponse>[]
        : filtered.skip(start).take(size).toList();
    return JobSearchResponse(
      content: pageItems,
      page: page,
      size: size,
      totalElements: filtered.length,
      totalPages: filtered.isEmpty ? 1 : ((filtered.length - 1) ~/ size) + 1,
      first: page == 0,
      last: start + pageItems.length >= filtered.length,
    );
  }

  @override
  Future<JobDetailResponse> getJobDetail(int jobId) async {
    if (getJobDetailError != null) throw getJobDetailError!;
    final detail = details[jobId];
    if (detail == null) {
      throw DioException(
        requestOptions: RequestOptions(path: '/api/v1/jobs/$jobId'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/jobs/$jobId'),
          statusCode: 404,
        ),
      );
    }
    return detail;
  }

  @override
  Future<List<PublicJobSourceResponse>> getJobSources({
    bool activeOnly = false,
  }) async => [];

  @override
  Future<void> addBookmark(int jobId) async {
    _setBookmarked(jobId, true);
  }

  @override
  Future<void> removeBookmark(int jobId) async {
    _setBookmarked(jobId, false);
  }

  void _setBookmarked(int jobId, bool bookmarked) {
    final jobIndex = jobs.indexWhere((job) => job.jobId == jobId);
    if (jobIndex != -1) {
      jobs[jobIndex] = jobs[jobIndex].copyWith(bookmarked: bookmarked);
    }
    final detail = details[jobId];
    if (detail != null) {
      details[jobId] = detail.copyWith(bookmarked: bookmarked);
    }
    if (bookmarked) {
      if (bookmarks.every((job) => job.jobId != jobId)) {
        final summary = jobIndex == -1 ? null : jobs[jobIndex];
        final recommendation = summary != null
            ? RecommendationJobResponse(
                jobId: jobId,
                title: summary.title,
                postingType: summary.postingType,
                applicationMethod: summary.applicationMethod,
                status: summary.status,
                company: summary.company,
                endDate: summary.endDate,
                bookmarked: true,
              )
            : detail == null
            ? null
            : RecommendationJobResponse(
                jobId: jobId,
                title: detail.title,
                postingType: detail.postingType,
                applicationMethod: detail.applicationMethod,
                status: detail.status,
                company: detail.company,
                endDate: detail.endDate,
                bookmarked: true,
              );
        if (recommendation != null) {
          bookmarks.add(recommendation);
        }
      }
    } else {
      bookmarks.removeWhere((job) => job.jobId == jobId);
    }
  }

  @override
  Future<RecommendationJobListResponse> getJobBookmarks({
    String? query,
    String? postingType,
    String? sort,
    int page = 0,
    int size = 20,
  }) async => RecommendationJobListResponse(
    content: bookmarks,
    page: 0,
    size: size,
    totalElements: bookmarks.length,
    totalPages: 1,
    first: true,
    last: true,
  );

  @override
  Future<AiReanalysisResponse> requestAiReanalysis(int jobId) async {
    // 재분석 중 상태를 위젯 테스트에서 관찰할 수 있도록 약간의 지연을 둡니다.
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final retried = retryResults[jobId];
    if (retried != null) {
      details[jobId] = retried;
    }
    return AiReanalysisResponse(
      jobId: jobId,
      status: 'PROCESSING',
      reanalysisCount: 1,
      remainingReanalysisCount: 2,
      canReanalyze: true,
      requestedAt: DateTime.now().toIso8601String(),
      reanalysis: true,
    );
  }
}

class _SequencedSearchRepository implements JobRepository {
  final List<Completer<JobSearchResponse>> pendingCompleters = [];

  @override
  Future<JobSearchResponse> searchJobs({
    String? query,
    String? postingType,
    String? applicationMethod,
    String? sourceName,
    String? sort,
    String? direction,
    int page = 0,
    int size = 20,
  }) {
    final completer = Completer<JobSearchResponse>();
    pendingCompleters.add(completer);
    return completer.future;
  }

  @override
  Future<JobDetailResponse> getJobDetail(int jobId) =>
      throw UnimplementedError();

  @override
  Future<List<PublicJobSourceResponse>> getJobSources({
    bool activeOnly = false,
  }) => throw UnimplementedError();

  @override
  Future<void> addBookmark(int jobId) => throw UnimplementedError();

  @override
  Future<void> removeBookmark(int jobId) => throw UnimplementedError();

  @override
  Future<RecommendationJobListResponse> getJobBookmarks({
    String? query,
    String? postingType,
    String? sort,
    int page = 0,
    int size = 20,
  }) => throw UnimplementedError();

  @override
  Future<AiReanalysisResponse> requestAiReanalysis(int jobId) =>
      throw UnimplementedError();
}

JobSearchResponse _searchResponseWithTitles(List<String> titles) =>
    JobSearchResponse(
      content: [
        for (var i = 0; i < titles.length; i++)
          JobSummaryResponse(
            jobId: i + 1,
            title: titles[i],
            postingType: 'GENERAL',
            applicationMethod: 'EXTERNAL',
            status: 'PUBLISHED',
            application: _companyEligible,
          ),
      ],
      page: 0,
      size: 20,
      totalElements: titles.length,
      totalPages: 1,
      first: true,
      last: true,
    );

const _companyEligible = JobEligibilitySnapshotDto(
  canApply: true,
  eligibilityReason: 'AVAILABLE',
  eligibilityMessage: '지원 가능한 공고입니다.',
);

String _isoDaysFromNow(int days) =>
    DateTime.now().add(Duration(days: days)).toIso8601String();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakeUrlLauncher = _FakeUrlLauncher();
  UrlLauncherPlatform.instance = fakeUrlLauncher;

  late _FakeJobRepository repository;

  void seedDefaultFixtures() {
    repository.jobs = [
      JobSummaryResponse(
        jobId: 1,
        title: '2026년 고졸 채용형 인턴 모집',
        postingType: 'MOU',
        applicationMethod: 'INTERNAL',
        status: 'PUBLISHED',
        company: const CompanySummaryDto(companyId: 1, name: '한국전력공사'),
        endDate: _isoDaysFromNow(17),
        location: '서울',
        employmentType: '인턴',
        application: _companyEligible,
      ),
      JobSummaryResponse(
        jobId: 2,
        title: '2026 AI 서비스 개발 인턴십 참가자 모집',
        postingType: 'GENERAL',
        applicationMethod: 'EXTERNAL',
        status: 'PUBLISHED',
        company: const CompanySummaryDto(companyId: 2, name: '네이버클라우드'),
        endDate: _isoDaysFromNow(23),
        location: '경기 성남',
        employmentType: '인턴',
        sourceName: '네이버 채용',
        application: _companyEligible,
      ),
      JobSummaryResponse(
        jobId: 3,
        title: '웹 프론트엔드 주니어 개발자 채용',
        postingType: 'GENERAL',
        applicationMethod: 'EXTERNAL',
        status: 'CLOSED',
        company: const CompanySummaryDto(companyId: 3, name: '우아한형제들'),
        endDate: _isoDaysFromNow(-1),
        location: '서울',
        employmentType: '신입',
        sourceName: '우아한형제들 채용',
        application: _companyEligible,
      ),
      JobSummaryResponse(
        jobId: 4,
        title: '교내 연계 기업 포트폴리오 우수자 채용',
        postingType: 'SCHOOL',
        applicationMethod: 'INTERNAL',
        status: 'PUBLISHED',
        company: const CompanySummaryDto(companyId: 4, name: '광주소프트웨어마이스터고'),
        endDate: _isoDaysFromNow(34),
        location: '광주',
        employmentType: '정규직',
        application: _companyEligible,
      ),
      JobSummaryResponse(
        jobId: 5,
        title: '3학년 대상 프론트엔드 채용형 인턴',
        postingType: 'MOU',
        applicationMethod: 'INTERNAL',
        status: 'PUBLISHED',
        company: const CompanySummaryDto(companyId: 5, name: '토스페이먼츠'),
        endDate: _isoDaysFromNow(3),
        location: '서울',
        employmentType: '인턴',
        application: const JobEligibilitySnapshotDto(
          canApply: false,
          eligibilityReason: 'NOT_TARGET_GRADE',
          eligibilityMessage: '3학년 재학생만 지원할 수 있는 공고입니다.',
        ),
      ),
    ];

    repository.details
      ..clear()
      ..addEntries(
        repository.jobs.map(
          (summary) => MapEntry(summary.jobId, _detailFor(summary)),
        ),
      );

    repository.retryResults[3] = repository.details[3]!.copyWith(
      aiAnalysis: const JobAiAnalysisSnapshotDto(
        status: 'COMPLETED',
        summary: '프론트엔드 실무 경험과 TypeScript 활용 능력을 중요하게 보는 정규직 신입 공고입니다.',
        requiredSkills: [
          JobAiSkillDto(name: 'HTML/CSS'),
          JobAiSkillDto(name: 'JavaScript'),
          JobAiSkillDto(name: '웹 프론트엔드 개발 경험'),
        ],
        preferredSkills: [
          JobAiSkillDto(name: 'TypeScript'),
          JobAiSkillDto(name: 'React'),
        ],
        entryLevelFit: 'SUITABLE',
        difficulty: 'HARD',
      ),
    );
  }

  setUp(() {
    repository = _FakeJobRepository();
    seedDefaultFixtures();
  });

  testWidgets('채용 공고 목록이 390px 기준으로 오버플로우 없이 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    expect(find.text('채용 공고'), findsAtLeastNWidgets(1));
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색어로 공고를 필터링할 수 있다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.enterText(
      find.byKey(const ValueKey('job-search-field')),
      '네이버',
    );
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    expect(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('검색 결과가 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.enterText(
      find.byKey(const ValueKey('job-search-field')),
      '존재하지 않는 공고',
    );
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    expect(find.text('검색 결과가 없어요.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('목록을 불러오지 못하면 재시도 버튼을 표시하고, 누르면 다시 불러온다', (tester) async {
    repository.searchShouldFail = true;
    await _pumpRoute(tester, '/jobs', repository);

    expect(find.text('채용 공고를 불러오지 못했어요.'), findsOneWidget);

    repository.searchShouldFail = false;
    await tester.tap(find.byKey(const ValueKey('job-retry')));
    await tester.pumpAndSettle();

    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('목록에서 공고를 탭하면 상세로 이동한다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.tap(find.text('2026년 고졸 채용형 인턴 모집'));
    await tester.pumpAndSettle();

    expect(find.text('공고 상세'), findsOneWidget);
    expect(find.text('지원서 작성하기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('학교 공고 상세에서 지원서 작성하기는 jobId와 함께 지원 목록으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/jobs/1', repository);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();

    expect(find.text('내 지원 목록 (jobId=1)'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('외부 공고 상세에서 사이트에서 지원하기는 외부 이동 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/2', repository);
    await tester.pumpAndSettle();

    expect(find.text('사이트에서 지원하기'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();

    expect(find.text('외부 채용 페이지로 이동합니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('외부 공고 지원 확인을 누르면 실제 브라우저 이동이 호출된다', (tester) async {
    fakeUrlLauncher.launchedUrl = null;
    repository.details[2] = repository.details[2]!.copyWith(
      externalUrl: 'recruit.navercorp.com',
    );
    await _pumpRoute(tester, '/jobs/2', repository);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();
    await tester.tap(
      find.byKey(const ValueKey('job-detail-apply-external-confirm')),
    );
    await tester.pumpAndSettle();

    expect(fakeUrlLauncher.launchedUrl, contains('recruit.navercorp.com'));
    expect(tester.takeException(), isNull);
  });

  testWidgets('지원 자격이 없는 공고는 상세에서 지원 버튼이 비활성화되고 사유가 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs/5', repository);
    await tester.pumpAndSettle();

    expect(find.text('3학년 재학생만 지원할 수 있는 공고입니다.'), findsOneWidget);

    final button = tester.widget<ElevatedButton>(
      find.byKey(const ValueKey('job-detail-apply')),
    );
    expect(button.onPressed, isNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets('존재하지 않는 공고 상세는 찾을 수 없음 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/999', repository);
    await tester.pumpAndSettle();

    expect(find.text('해당 공고를 찾을 수 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('서버가 공통 응답 포맷의 NOT_FOUND 에러로 응답해도 찾을 수 없음 안내를 표시한다', (
    tester,
  ) async {
    repository.getJobDetailError = const ApiException(
      ApiErrorBody(code: 'JOB_NOT_FOUND', message: '공고를 찾을 수 없습니다.'),
    );
    await _pumpRoute(tester, '/jobs/1', repository);
    await tester.pumpAndSettle();

    expect(find.text('해당 공고를 찾을 수 없습니다.'), findsOneWidget);
    expect(find.text('공고를 불러오지 못했어요.'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('유형 필터로 목록을 좁힐 수 있다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.tap(find.byKey(const ValueKey('job-type-filter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('job-filter-option-교내')));
    await tester.pumpAndSettle();

    expect(find.text('교내 연계 기업 포트폴리오 우수자 채용'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('출처 필터로 목록을 좁힐 수 있다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.tap(find.byKey(const ValueKey('job-source-filter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('job-filter-option-외부')));
    await tester.pumpAndSettle();

    expect(find.text('2026 AI 서비스 개발 인턴십 참가자 모집'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감임박 필터를 켜면 D-7 이내 공고만 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.tap(find.byKey(const ValueKey('job-deadline-soon-filter')));
    await tester.pumpAndSettle();

    expect(find.text('3학년 대상 프론트엔드 채용형 인턴'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('첨부파일이 있는 공고는 상세에 첨부파일 섹션이 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs/1', repository);
    await tester.pumpAndSettle();

    expect(find.text('첨부파일'), findsOneWidget);
    expect(find.text('kepco_intern_guide.pdf'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('첨부파일이 없는 공고는 상세에 첨부파일 섹션이 표시되지 않는다', (tester) async {
    await _pumpRoute(tester, '/jobs/3', repository);
    await tester.pumpAndSettle();

    expect(find.text('첨부파일'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('상세 화면에 조회수가 표시된다', (tester) async {
    await _pumpRoute(tester, '/jobs/1', repository);
    await tester.pumpAndSettle();

    expect(find.text('조회수'), findsOneWidget);
    expect(find.text('129회'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('마감된 공고는 상세에서 지원 버튼이 비활성화된다', (tester) async {
    await _pumpRoute(tester, '/jobs/3', repository);
    await tester.pumpAndSettle();

    expect(find.text('마감된 공고입니다'), findsOneWidget);

    final button = tester.widget<ElevatedButton>(
      find.byKey(const ValueKey('job-detail-apply')),
    );
    expect(button.onPressed, isNull);

    await tester.tap(find.byKey(const ValueKey('job-detail-apply')));
    await tester.pumpAndSettle();
    expect(find.text('내 지원 목록'), findsNothing);
    expect(find.text('외부 채용 페이지로 이동합니다.'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 완료 공고는 AI 분석 카드에 핵심 요약과 태그를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/2', repository);
    await tester.pumpAndSettle();

    expect(find.text('AI 공고 분석'), findsOneWidget);
    expect(find.text('분석 완료'), findsOneWidget);
    expect(
      find.text('웹서비스 개발 경험과 JavaScript 기본 역량을 중요하게 보는 신입·고졸 지원 가능 인턴 공고입니다.'),
      findsOneWidget,
    );
    expect(find.text('고졸 지원 가능'), findsOneWidget);
    expect(find.text('보통'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 대기 중인 공고는 대기 안내를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/1', repository);
    await tester.pumpAndSettle();

    expect(find.text('분석 대기 중'), findsOneWidget);
    expect(find.text('AI가 공고 내용을 분석하고 있습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 정보가 부족한 공고는 안내만 표시하고 재시도 버튼이 없다', (tester) async {
    await _pumpRoute(tester, '/jobs/4', repository);
    await tester.pumpAndSettle();

    expect(find.text('분석 정보 부족'), findsOneWidget);
    expect(find.text('공고 내용이 부족하여 분석할 수 없습니다.'), findsOneWidget);
    expect(find.byKey(const ValueKey('job-ai-analysis-retry')), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('분석 실패한 공고는 재시도로 재분석 후 완료 상태가 된다', (tester) async {
    await _pumpRoute(tester, '/jobs/3', repository);
    await tester.pumpAndSettle();

    expect(find.text('분석 실패'), findsOneWidget);
    expect(find.text('AI 분석 중 문제가 발생했습니다.'), findsOneWidget);

    await tester.ensureVisible(
      find.byKey(const ValueKey('job-ai-analysis-retry')),
    );
    await tester.tap(find.byKey(const ValueKey('job-ai-analysis-retry')));
    await tester.pump();
    expect(find.text('재분석 중'), findsOneWidget);
    expect(find.text('AI가 다시 분석하고 있습니다.'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('분석 완료'), findsOneWidget);
    expect(
      find.text('프론트엔드 실무 경험과 TypeScript 활용 능력을 중요하게 보는 정규직 신입 공고입니다.'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('재시도 결과가 없으면 재분석 중에 멈추지 않고 이전 상태로 돌아간다', (tester) async {
    await _pumpRoute(tester, '/jobs/3', repository);
    await tester.pumpAndSettle();
    repository.retryResults.remove(3);

    await tester.ensureVisible(
      find.byKey(const ValueKey('job-ai-analysis-retry')),
    );
    await tester.tap(find.byKey(const ValueKey('job-ai-analysis-retry')));
    await tester.pump();
    expect(find.text('재분석 중'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('분석 실패'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('북마크를 눌러도 재시도로 갱신된 AI 분석 결과가 초기화되지 않는다', (tester) async {
    await _pumpRoute(tester, '/jobs/3', repository);
    await tester.pumpAndSettle();

    await tester.ensureVisible(
      find.byKey(const ValueKey('job-ai-analysis-retry')),
    );
    await tester.tap(find.byKey(const ValueKey('job-ai-analysis-retry')));
    await tester.pumpAndSettle();
    expect(find.text('분석 완료'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('job-detail-bookmark')));
    await tester.pumpAndSettle();

    expect(find.text('북마크 해제하기'), findsOneWidget);
    expect(find.text('분석 완료'), findsOneWidget);
    expect(find.text('분석 실패'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('하단 네비 공고 탭을 누르면 채용 공고 목록으로 이동한다', (tester) async {
    await _pumpRoute(tester, '/', repository);

    expect(find.text('홈 화면'), findsOneWidget);
    await tester.tap(find.text('공고'));
    await tester.pumpAndSettle();

    expect(find.text('채용 공고'), findsAtLeastNWidgets(1));
    expect(tester.takeException(), isNull);
  });

  testWidgets('공고 화면 하단 네비 홈 탭을 누르면 홈으로 돌아간다', (tester) async {
    await _pumpRoute(tester, '/jobs', repository);

    await tester.tap(find.text('홈'));
    await tester.pumpAndSettle();

    expect(find.text('홈 화면'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('상세에서 북마크하면 북마크 화면에 표시된다', (tester) async {
    await _setViewport(tester);
    final router = _buildRouter(initialLocation: '/jobs/1');
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [jobRepositoryProvider.overrideWithValue(repository)],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) => MaterialApp.router(routerConfig: router),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('job-detail-bookmark')));
    await tester.pumpAndSettle();
    expect(find.text('북마크 해제하기'), findsOneWidget);

    router.go('/jobs/bookmarks');
    await tester.pumpAndSettle();

    expect(find.text('저장한 공고 1개'), findsOneWidget);
    expect(find.text('2026년 고졸 채용형 인턴 모집'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('북마크가 없으면 빈 상태를 표시한다', (tester) async {
    await _pumpRoute(tester, '/jobs/bookmarks', repository);

    expect(find.text('북마크한 공고가 없습니다.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('느린 이전 필터 응답이 늦게 도착해도 최신 필터 결과를 덮어쓰지 않는다', () async {
    final sequencedRepository = _SequencedSearchRepository();
    final container = ProviderContainer(
      overrides: [jobRepositoryProvider.overrideWithValue(sequencedRepository)],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(jobViewModelProvider, (_, _) {});
    addTearDown(subscription.close);

    final notifier = container.read(jobViewModelProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    expect(sequencedRepository.pendingCompleters.length, 1); // build()의 초기 요청

    notifier.updatePostingTypeFilter(JobPostingType.mou);
    notifier.updatePostingTypeFilter(JobPostingType.school);
    expect(sequencedRepository.pendingCompleters.length, 3);

    // 최신 요청(교내)이 먼저 도착합니다.
    sequencedRepository.pendingCompleters[2].complete(
      _searchResponseWithTitles(['최신 결과']),
    );
    await Future<void>.delayed(Duration.zero);

    // 뒤늦게 이전 요청(MOU)이 도착해도 최신 결과를 덮어쓰면 안 됩니다.
    sequencedRepository.pendingCompleters[1].complete(
      _searchResponseWithTitles(['오래된 결과']),
    );
    await Future<void>.delayed(Duration.zero);

    final titles = container
        .read(jobViewModelProvider)
        .jobs
        .map((job) => job.title)
        .toList();
    expect(titles, ['최신 결과']);
  });
}

JobDetailResponse _detailFor(JobSummaryResponse summary) {
  final aiAnalysis = switch (summary.jobId) {
    1 => const JobAiAnalysisSnapshotDto(status: 'PENDING'),
    2 => const JobAiAnalysisSnapshotDto(
      status: 'COMPLETED',
      summary: '웹서비스 개발 경험과 JavaScript 기본 역량을 중요하게 보는 신입·고졸 지원 가능 인턴 공고입니다.',
      requiredSkills: [
        JobAiSkillDto(name: 'JavaScript'),
        JobAiSkillDto(name: 'Git'),
        JobAiSkillDto(name: '웹 기본 지식'),
      ],
      preferredSkills: [
        JobAiSkillDto(name: 'React'),
        JobAiSkillDto(name: 'Next.js'),
        JobAiSkillDto(name: 'AI API'),
      ],
      highSchoolGraduateFit: 'SUITABLE',
      entryLevelFit: 'SUITABLE',
      difficulty: 'NORMAL',
    ),
    3 => const JobAiAnalysisSnapshotDto(status: 'FAILED'),
    4 => const JobAiAnalysisSnapshotDto(status: 'COMPLETED'),
    _ => const JobAiAnalysisSnapshotDto(status: 'PENDING'),
  };
  return JobDetailResponse(
    jobId: summary.jobId,
    title: summary.title,
    postingType: summary.postingType,
    applicationMethod: summary.applicationMethod,
    status: summary.status,
    company: summary.company,
    content: '${summary.title} 상세 설명입니다.',
    startDate: _isoDaysFromNow(-10),
    endDate: summary.endDate,
    targetGrade: summary.jobId == 1 || summary.jobId == 5 ? 3 : null,
    location: summary.location,
    employmentType: summary.employmentType,
    sourceName: summary.sourceName,
    viewCount: summary.jobId == 1 ? 129 : 10,
    aiAnalysis: aiAnalysis,
    application: summary.application,
    bookmarked: summary.bookmarked,
    files: summary.jobId == 1
        ? const [
            JobFileDto(
              fileId: 1,
              originalName: 'kepco_intern_guide.pdf',
              contentType: 'application/pdf',
              size: 1258291,
              downloadUrl: 'https://example.com/files/1',
            ),
          ]
        : const [],
  );
}

GoRouter _buildRouter({required String initialLocation}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Scaffold(
        body: const Center(child: Text('홈 화면')),
        bottomNavigationBar: SafeArea(
          top: false,
          child: AppBottomNavigation(
            currentIndex: 0,
            onTap: (index) => navigateToBottomTab(context, index),
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/applications',
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text(
            '내 지원 목록'
            '${state.uri.queryParameters['jobId'] != null ? ' (jobId=${state.uri.queryParameters['jobId']})' : ''}',
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/jobs',
      builder: (context, state) => const JobView(),
      routes: [
        GoRoute(
          path: 'bookmarks',
          builder: (context, state) => const JobBookmarkView(),
        ),
        GoRoute(
          path: ':jobId',
          builder: (context, state) =>
              JobDetailView(jobId: state.pathParameters['jobId']!),
        ),
      ],
    ),
  ],
);

Future<void> _pumpRoute(
  WidgetTester tester,
  String initialLocation,
  JobRepository repository,
) async {
  await _setViewport(tester);
  final router = _buildRouter(initialLocation: initialLocation);
  addTearDown(router.dispose);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [jobRepositoryProvider.overrideWithValue(repository)],
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
