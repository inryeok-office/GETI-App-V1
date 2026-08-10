import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recommendation_view_model.g.dart';

enum RecommendationStatus {
  loaded,
  empty,
  beforeGeneration,
  generating,
  failure,
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
    required this.summary,
    required this.tags,
    required this.availability,
    this.fitLabel,
    this.matchReason,
  });

  final String companyName;
  final String positionName;
  final String summary;
  final List<String> tags;
  final RecommendationJobAvailability availability;
  final String? fitLabel;
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
    );
  }
}

@riverpod
class RecommendationViewModel extends _$RecommendationViewModel {
  int _successNoticeVersion = 0;

  @override
  RecommendationViewState build() => const RecommendationViewState(
    status: RecommendationStatus.loaded,
    jobs: _mockJobs,
  );

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

const _mockJobs = [
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    fitLabel: '매우 적합',
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    fitLabel: '적합',
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    fitLabel: '부적합',
    matchReason: 'React, TypeScript 기술 스택과 일치합니다.',
  ),
  RecommendationJob(
    companyName: '네이버클라우드',
    positionName: 'Cloud Platform Engineer',
    summary: '분당 · 정규직 · D-18',
    tags: ['React', 'TypeScript'],
    availability: RecommendationJobAvailability.active,
    fitLabel: '적합',
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
