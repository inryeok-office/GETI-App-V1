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
  const RecommendationViewState({required this.status, this.jobs = const []});

  final RecommendationStatus status;
  final List<RecommendationJob> jobs;
}

@riverpod
class RecommendationViewModel extends _$RecommendationViewModel {
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
