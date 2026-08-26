import 'dart:async';

import 'package:geti_app/features/job/data/dto/job_search_response.dart';
import 'package:geti_app/features/job/data/job_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_view_model.g.dart';

enum JobScreenStatus { loaded, loading, networkError }

/// 공고 지원 방식입니다. 서버의 applicationMethod(INTERNAL/EXTERNAL)와 대응하며,
/// PRD 6.4에 따라 버튼 문구·아이콘을 명확히 구분하는 데 사용합니다.
enum JobApplicationMethod { internal, external }

/// 공고 유형입니다. 서버의 postingType(GENERAL/MOU/SCHOOL)과 대응합니다.
enum JobPostingType { general, mou, school }

class JobItem {
  const JobItem({
    required this.id,
    required this.companyName,
    required this.title,
    required this.applicationMethod,
    required this.postingType,
    required this.sourceDescriptor,
    required this.location,
    required this.jobType,
    required this.deadlineLabel,
    this.dDayLabel,
    this.isClosed = false,
    this.canApply = true,
    this.eligibilityReason,
    this.bookmarked = false,
  });

  final String id;
  final String companyName;
  final String title;
  final JobApplicationMethod applicationMethod;
  final JobPostingType postingType;
  final String sourceDescriptor;
  final String location;
  final String jobType;
  final String deadlineLabel;
  final String? dDayLabel;
  final bool isClosed;

  /// 마감 여부와 별개로, 자격 요건 등으로 지원이 불가능한지 나타냅니다.
  /// 서버가 계산해 내려준 값을 그대로 사용합니다(클라이언트 재계산 금지).
  final bool canApply;

  /// canApply가 false일 때 상세 화면에 표시할 사유입니다.
  final String? eligibilityReason;

  final bool bookmarked;

  /// dDayLabel("D-7")에서 남은 일수를 파싱합니다. 형식이 다르면 null입니다.
  int? get remainingDays {
    final label = dDayLabel;
    if (label == null || !label.startsWith('D-')) return null;
    return int.tryParse(label.substring(2));
  }

  JobItem copyWith({bool? bookmarked}) => JobItem(
    id: id,
    companyName: companyName,
    title: title,
    applicationMethod: applicationMethod,
    postingType: postingType,
    sourceDescriptor: sourceDescriptor,
    location: location,
    jobType: jobType,
    deadlineLabel: deadlineLabel,
    dDayLabel: dDayLabel,
    isClosed: isClosed,
    canApply: canApply,
    eligibilityReason: eligibilityReason,
    bookmarked: bookmarked ?? this.bookmarked,
  );

  factory JobItem.fromSummary(JobSummaryResponse summary) {
    final (deadlineLabel, dDayLabel) = deadlineLabelsFor(summary.endDate);
    return JobItem(
      id: summary.jobId.toString(),
      companyName: summary.company?.name ?? '기업명 미정',
      title: summary.title,
      applicationMethod: applicationMethodFrom(summary.applicationMethod),
      postingType: postingTypeFrom(summary.postingType),
      sourceDescriptor: sourceDescriptorFor(
        summary.postingType,
        summary.sourceName,
      ),
      location: summary.location ?? '지역 미정',
      jobType: summary.employmentType ?? '',
      deadlineLabel: deadlineLabel,
      dDayLabel: dDayLabel,
      isClosed: summary.status == 'CLOSED',
      canApply: summary.application.canApply,
      eligibilityReason: summary.application.canApply
          ? null
          : summary.application.eligibilityMessage,
      bookmarked: summary.bookmarked,
    );
  }
}

const deadlineSoonThresholdDays = 7;

JobApplicationMethod applicationMethodFrom(String raw) => raw == 'INTERNAL'
    ? JobApplicationMethod.internal
    : JobApplicationMethod.external;

JobPostingType postingTypeFrom(String raw) => switch (raw) {
  'MOU' => JobPostingType.mou,
  'SCHOOL' => JobPostingType.school,
  _ => JobPostingType.general,
};

String postingTypeLabel(JobPostingType type) => switch (type) {
  JobPostingType.mou => 'MOU',
  JobPostingType.school => '교내',
  JobPostingType.general => '일반',
};

String postingTypeQueryValue(JobPostingType type) => switch (type) {
  JobPostingType.mou => 'MOU',
  JobPostingType.school => 'SCHOOL',
  JobPostingType.general => 'GENERAL',
};

String sourceDescriptorFor(String postingType, String? sourceName) {
  final label = postingTypeLabel(postingTypeFrom(postingType));
  if (sourceName != null && sourceName.isNotEmpty) {
    return '$label · $sourceName';
  }
  return postingType == 'GENERAL' ? '$label · 외부 공고' : '$label · 교내 모집';
}

/// 서버 endDate(ISO 날짜/시각)로부터 화면 표시용 마감 라벨과 D-day 라벨을
/// 계산합니다. 지원 가능 여부 판단이 아닌 단순 날짜 표시 포맷팅입니다.
(String, String?) deadlineLabelsFor(String? endDateIso) {
  if (endDateIso == null) return ('상시 모집', null);
  final endDate = DateTime.tryParse(endDateIso);
  if (endDate == null) return ('상시 모집', null);

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final deadlineDay = DateTime(endDate.year, endDate.month, endDate.day);
  final remaining = deadlineDay.difference(today).inDays;
  final label =
      '${endDate.month.toString().padLeft(2, '0')}.'
      '${endDate.day.toString().padLeft(2, '0')} 마감';
  if (remaining < 0) return (label, null);
  return (label, 'D-$remaining');
}

class JobViewState {
  const JobViewState({
    this.screenStatus = JobScreenStatus.loading,
    this.jobs = const [],
    this.searchQuery = '',
    this.postingTypeFilter,
    this.applicationMethodFilter,
    this.deadlineSoonOnly = false,
    this.currentPage = 0,
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  final JobScreenStatus screenStatus;
  final List<JobItem> jobs;
  final String searchQuery;
  final JobPostingType? postingTypeFilter;
  final JobApplicationMethod? applicationMethodFilter;
  final bool deadlineSoonOnly;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  /// "마감임박"은 서버 필터 파라미터가 없어 현재 페이지 안에서 클라이언트가
  /// 표시용으로만 좁힙니다(지원 가능 여부 같은 서버 판단 로직이 아닙니다).
  List<JobItem> get visibleJobs => deadlineSoonOnly
      ? jobs
            .where(
              (job) =>
                  job.remainingDays != null &&
                  job.remainingDays! <= deadlineSoonThresholdDays,
            )
            .toList(growable: false)
      : jobs;

  JobViewState copyWith({
    JobScreenStatus? screenStatus,
    List<JobItem>? jobs,
    String? searchQuery,
    bool clearPostingTypeFilter = false,
    JobPostingType? postingTypeFilter,
    bool clearApplicationMethodFilter = false,
    JobApplicationMethod? applicationMethodFilter,
    bool? deadlineSoonOnly,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) => JobViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    jobs: jobs ?? this.jobs,
    searchQuery: searchQuery ?? this.searchQuery,
    postingTypeFilter: clearPostingTypeFilter
        ? null
        : (postingTypeFilter ?? this.postingTypeFilter),
    applicationMethodFilter: clearApplicationMethodFilter
        ? null
        : (applicationMethodFilter ?? this.applicationMethodFilter),
    deadlineSoonOnly: deadlineSoonOnly ?? this.deadlineSoonOnly,
    currentPage: currentPage ?? this.currentPage,
    hasMore: hasMore ?? this.hasMore,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
  );
}

@riverpod
class JobViewModel extends _$JobViewModel {
  Timer? _searchDebounce;

  /// 검색어/필터가 바뀔 때마다 새 요청을 보내므로, 먼저 보낸 느린 요청이
  /// 나중에 도착해 최신 결과를 덮어쓰지 않도록 매 _fetch 호출마다 증가시켜
  /// "이 결과가 아직 최신 요청에 대한 것인지" 확인하는 데 사용합니다.
  int _requestId = 0;

  @override
  JobViewState build() {
    ref.onDispose(() {
      _searchDebounce?.cancel();
    });
    unawaited(Future.microtask(_fetch));
    return const JobViewState();
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      const Duration(milliseconds: 400),
      () => unawaited(_fetch()),
    );
  }

  void updatePostingTypeFilter(JobPostingType? type) {
    state = type == null
        ? state.copyWith(clearPostingTypeFilter: true)
        : state.copyWith(postingTypeFilter: type);
    unawaited(_fetch());
  }

  void updateApplicationMethodFilter(JobApplicationMethod? method) {
    state = method == null
        ? state.copyWith(clearApplicationMethodFilter: true)
        : state.copyWith(applicationMethodFilter: method);
    unawaited(_fetch());
  }

  void updateDeadlineSoonOnly(bool value) =>
      state = state.copyWith(deadlineSoonOnly: value);

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore) return;
    await _fetch(loadMore: true);
  }

  Future<void> retry() => _fetch();

  /// [currentlyBookmarked]는 호출하는 화면이 렌더링 중인 공고 카드의 현재
  /// 상태를 그대로 넘깁니다. 이 목록(state.jobs)에 해당 공고가 없어도(다른
  /// 화면에서 재사용된 카드 등) API 호출 자체는 항상 수행합니다.
  Future<void> toggleBookmark(
    String jobId, {
    required bool currentlyBookmarked,
  }) async {
    final nextBookmarked = !currentlyBookmarked;
    _applyBookmark(jobId, nextBookmarked);
    try {
      final repository = ref.read(jobRepositoryProvider);
      final id = int.parse(jobId);
      if (nextBookmarked) {
        await repository.addBookmark(id);
      } else {
        await repository.removeBookmark(id);
      }
    } catch (_) {
      if (!ref.mounted) return;
      _applyBookmark(jobId, currentlyBookmarked);
    }
  }

  void _applyBookmark(String jobId, bool bookmarked) {
    state = state.copyWith(
      jobs: [
        for (final job in state.jobs)
          if (job.id == jobId) job.copyWith(bookmarked: bookmarked) else job,
      ],
    );
  }

  Future<void> _fetch({bool loadMore = false}) async {
    final requestId = ++_requestId;
    final requestedPage = loadMore ? state.currentPage + 1 : 0;
    state = state.copyWith(
      screenStatus: loadMore ? state.screenStatus : JobScreenStatus.loading,
      isLoadingMore: loadMore,
    );
    try {
      final query = state.searchQuery.trim();
      final result = await ref
          .read(jobRepositoryProvider)
          .searchJobs(
            query: query.isEmpty ? null : query,
            postingType: state.postingTypeFilter == null
                ? null
                : postingTypeQueryValue(state.postingTypeFilter!),
            applicationMethod: state.applicationMethodFilter == null
                ? null
                : state.applicationMethodFilter == JobApplicationMethod.internal
                ? 'INTERNAL'
                : 'EXTERNAL',
            page: requestedPage,
          );
      if (!ref.mounted || requestId != _requestId) return;
      final fetched = result.content.map(JobItem.fromSummary).toList();
      state = state.copyWith(
        screenStatus: JobScreenStatus.loaded,
        jobs: loadMore ? [...state.jobs, ...fetched] : fetched,
        currentPage: result.page,
        hasMore: !result.last,
        isLoadingMore: false,
      );
    } catch (_) {
      if (!ref.mounted || requestId != _requestId) return;
      state = state.copyWith(
        screenStatus: loadMore
            ? state.screenStatus
            : JobScreenStatus.networkError,
        isLoadingMore: false,
      );
    }
  }
}
