import 'dart:async';

import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:geti_app/features/recommendation/data/recommendation_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'suitability_level.dart';

part 'recommendation_view_model.g.dart';

enum RecommendationStatus {
  loaded,
  empty,
  beforeGeneration,
  generating,
  failure,
  disabled,
}

enum RecommendationJobAvailability { active, closed, unavailable }

enum UninterestedScope { currentJob, similarJobs }

enum UninterestedSheetStatus {
  hidden,
  selecting,
  unsetting,
  processing,
  settingFailed,
  alreadyUninterested,
  unsettingFailed,
  notUninterested,
}

class RecommendationJob {
  const RecommendationJob({
    required this.companyName,
    required this.positionName,
    required this.tags,
    required this.availability,
    this.summary,
    this.suitabilityLevel,
    this.matchReason,
  });

  final String companyName;
  final String positionName;
  final String? summary;
  final List<String> tags;
  final RecommendationJobAvailability availability;
  final SuitabilityLevel? suitabilityLevel;
  final String? matchReason;
}

class RecommendationViewState {
  const RecommendationViewState({
    required this.status,
    this.jobs = const [],
    this.uninterestedSheetStatus = UninterestedSheetStatus.hidden,
    this.uninterestedScope = UninterestedScope.currentJob,
    this.selectedJob,
    this.uninterestedJobs = const {},
    this.showUninterestedSuccess = false,
    this.isUnsetting = false,
    this.bookmarkedJobs = const {},
    this.enabled,
    this.serverStatus,
    this.generatedAt,
    this.nextGenerationAt,
    this.page = 0,
    this.size = 20,
    this.totalElements = 0,
    this.totalPages = 0,
    this.first = true,
    this.last = true,
  });

  final RecommendationStatus status;
  final List<RecommendationJob> jobs;
  final UninterestedSheetStatus uninterestedSheetStatus;
  final UninterestedScope uninterestedScope;
  final RecommendationJob? selectedJob;
  final Set<RecommendationJob> uninterestedJobs;
  final bool showUninterestedSuccess;
  final bool isUnsetting;
  final Set<RecommendationJob> bookmarkedJobs;
  final bool? enabled;
  final String? serverStatus;
  final DateTime? generatedAt;
  final DateTime? nextGenerationAt;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;

  RecommendationViewState copyWith({
    RecommendationStatus? status,
    List<RecommendationJob>? jobs,
    UninterestedSheetStatus? uninterestedSheetStatus,
    UninterestedScope? uninterestedScope,
    RecommendationJob? selectedJob,
    Set<RecommendationJob>? uninterestedJobs,
    bool? showUninterestedSuccess,
    bool? isUnsetting,
    Set<RecommendationJob>? bookmarkedJobs,
    bool? enabled,
    String? serverStatus,
    DateTime? generatedAt,
    DateTime? nextGenerationAt,
    int? page,
    int? size,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
  }) {
    return RecommendationViewState(
      status: status ?? this.status,
      jobs: jobs ?? this.jobs,
      uninterestedSheetStatus:
          uninterestedSheetStatus ?? this.uninterestedSheetStatus,
      uninterestedScope: uninterestedScope ?? this.uninterestedScope,
      selectedJob: selectedJob ?? this.selectedJob,
      uninterestedJobs: uninterestedJobs ?? this.uninterestedJobs,
      showUninterestedSuccess:
          showUninterestedSuccess ?? this.showUninterestedSuccess,
      isUnsetting: isUnsetting ?? this.isUnsetting,
      bookmarkedJobs: bookmarkedJobs ?? this.bookmarkedJobs,
      enabled: enabled ?? this.enabled,
      serverStatus: serverStatus ?? this.serverStatus,
      generatedAt: generatedAt ?? this.generatedAt,
      nextGenerationAt: nextGenerationAt ?? this.nextGenerationAt,
      page: page ?? this.page,
      size: size ?? this.size,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }
}

const _recommendationPage = 0;
const _recommendationPageSize = 20;

@riverpod
class RecommendationViewModel extends _$RecommendationViewModel {
  int _successNoticeVersion = 0;
  int _requestVersion = 0;

  @override
  RecommendationViewState build() {
    final requestVersion = _nextRequestVersion();
    unawaited(
      Future.microtask(
        () => _fetchRecommendations(requestVersion: requestVersion),
      ),
    );
    return const RecommendationViewState(
      status: RecommendationStatus.generating,
    );
  }

  Future<void> retry() {
    return _fetchRecommendations(requestVersion: _nextRequestVersion());
  }

  int _nextRequestVersion() => ++_requestVersion;

  Future<void> _fetchRecommendations({required int requestVersion}) async {
    if (requestVersion != _requestVersion) return;
    state = state.copyWith(
      status: RecommendationStatus.generating,
      jobs: const [],
      bookmarkedJobs: const <RecommendationJob>{},
    );

    try {
      final response = await ref
          .read(recommendationRepositoryProvider)
          .getMyRecommendations(
            page: _recommendationPage,
            size: _recommendationPageSize,
          );
      if (!ref.mounted || requestVersion != _requestVersion) return;

      final jobs = response.status == 'READY'
          ? response.content
                .map(recommendationJobFromItem)
                .toList(growable: false)
          : const <RecommendationJob>[];
      final bookmarkedJobs = <RecommendationJob>{
        for (var i = 0; i < response.content.length && i < jobs.length; i++)
          if (response.content[i].job.bookmarked) jobs[i],
      };

      state = state.copyWith(
        status: recommendationStatusFromApi(response.status),
        jobs: jobs,
        bookmarkedJobs: bookmarkedJobs,
        enabled: response.enabled,
        serverStatus: response.status,
        generatedAt: response.generatedAt,
        nextGenerationAt: response.nextGenerationAt,
        page: response.page,
        size: response.size,
        totalElements: response.totalElements,
        totalPages: response.totalPages,
        first: response.first,
        last: response.last,
      );
    } catch (_) {
      if (!ref.mounted || requestVersion != _requestVersion) return;
      state = state.copyWith(status: RecommendationStatus.failure);
    }
  }

  void startGeneration() {
    state = const RecommendationViewState(
      status: RecommendationStatus.generating,
    );
  }

  void toggleBookmark(RecommendationJob job) {
    final updatedJobs = {...state.bookmarkedJobs};
    if (!updatedJobs.add(job)) {
      updatedJobs.remove(job);
    }
    state = state.copyWith(bookmarkedJobs: updatedJobs);
  }

  void openUninterested(RecommendationJob job) {
    final isUnsetting = state.uninterestedJobs.contains(job);
    state = state.copyWith(
      selectedJob: job,
      uninterestedScope: UninterestedScope.currentJob,
      uninterestedSheetStatus: isUnsetting
          ? UninterestedSheetStatus.unsetting
          : UninterestedSheetStatus.selecting,
      showUninterestedSuccess: false,
      isUnsetting: isUnsetting,
    );
  }

  void selectUninterestedScope(UninterestedScope scope) {
    state = state.copyWith(uninterestedScope: scope);
  }

  Future<void> confirmUninterested() {
    return _setUninterested(allowMockFailure: true);
  }

  Future<void> _setUninterested({required bool allowMockFailure}) async {
    final job = state.selectedJob;
    if (job == null) return;

    final scope = state.uninterestedScope;
    state = state.copyWith(
      uninterestedSheetStatus: UninterestedSheetStatus.processing,
      isUnsetting: false,
    );
    await Future<void>.delayed(const Duration(milliseconds: 900));

    if (!ref.mounted) return;
    if (state.selectedJob != job ||
        state.uninterestedSheetStatus != UninterestedSheetStatus.processing) {
      return;
    }

    if (allowMockFailure && scope == UninterestedScope.similarJobs) {
      state = state.copyWith(
        uninterestedSheetStatus: UninterestedSheetStatus.settingFailed,
      );
      return;
    }

    state = state.copyWith(
      uninterestedSheetStatus: UninterestedSheetStatus.hidden,
      uninterestedJobs: {...state.uninterestedJobs, job},
      showUninterestedSuccess: true,
    );
    _scheduleSuccessNoticeDismissal();
  }

  Future<void> unsetUninterested() async {
    final job = state.selectedJob;
    if (job == null) return;

    state = state.copyWith(
      uninterestedSheetStatus: UninterestedSheetStatus.processing,
      isUnsetting: true,
    );
    await Future<void>.delayed(const Duration(milliseconds: 900));

    if (!ref.mounted) return;
    if (state.selectedJob != job ||
        state.uninterestedSheetStatus != UninterestedSheetStatus.processing) {
      return;
    }

    final updatedJobs = {...state.uninterestedJobs}..remove(job);
    state = state.copyWith(
      uninterestedSheetStatus: UninterestedSheetStatus.hidden,
      uninterestedJobs: updatedJobs,
    );
  }

  void retryUninterested() {
    if (state.uninterestedSheetStatus ==
        UninterestedSheetStatus.unsettingFailed) {
      unsetUninterested();
    } else {
      _setUninterested(allowMockFailure: false);
    }
  }

  void closeUninterestedSheet() {
    state = state.copyWith(
      uninterestedSheetStatus: UninterestedSheetStatus.hidden,
    );
  }

  void dismissUninterestedSuccess() {
    state = state.copyWith(showUninterestedSuccess: false);
  }

  void _scheduleSuccessNoticeDismissal() {
    final version = ++_successNoticeVersion;
    unawaited(
      Future<void>.delayed(const Duration(seconds: 1), () {
        if (!ref.mounted || version != _successNoticeVersion) return;
        dismissUninterestedSuccess();
      }),
    );
  }
}

RecommendationStatus recommendationStatusFromApi(String raw) => switch (raw) {
  'DISABLED' => RecommendationStatus.disabled,
  'GENERATING' => RecommendationStatus.generating,
  'FAILED' => RecommendationStatus.failure,
  'EMPTY' => RecommendationStatus.empty,
  'READY' => RecommendationStatus.loaded,
  _ => RecommendationStatus.failure,
};

RecommendationJob recommendationJobFromItem(RecommendationItemResponse item) {
  final job = item.job;
  return RecommendationJob(
    companyName: _textOrFallback(job.company?.name, '기업명 미정'),
    positionName: job.title,
    summary: null,
    tags: job.techStacks
        .map((techStack) => techStack.name.trim())
        .where((name) => name.isNotEmpty)
        .toList(growable: false),
    availability: recommendationJobAvailabilityFromApi(job.status),
    suitabilityLevel: suitabilityLevelFromApi(item.suitabilityLevel),
    matchReason: null,
  );
}

RecommendationJobAvailability recommendationJobAvailabilityFromApi(
  String raw,
) => switch (raw) {
  'CLOSED' => RecommendationJobAvailability.closed,
  'DELETED' => RecommendationJobAvailability.unavailable,
  _ => RecommendationJobAvailability.active,
};

String _textOrFallback(String? value, String fallback) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? fallback : trimmed;
}

const mockRecommendationJobs = [
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    suitabilityLevel: SuitabilityLevel.highlyRecommended,
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    suitabilityLevel: SuitabilityLevel.recommended,
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    suitabilityLevel: SuitabilityLevel.unsuitable,
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    suitabilityLevel: SuitabilityLevel.recommended,
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
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
