import 'dart:async';

import 'package:geti_app/features/job/data/dto/recommendation_job_response.dart';
import 'package:geti_app/features/job/data/job_repository.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_bookmark_view_model.g.dart';

JobItem _jobItemFromRecommendation(RecommendationJobResponse job) {
  final (deadlineLabel, dDayLabel) = deadlineLabelsFor(job.endDate);
  return JobItem(
    id: job.jobId.toString(),
    companyName: job.company?.name ?? '기업명 미정',
    title: job.title,
    applicationMethod: applicationMethodFrom(job.applicationMethod),
    postingType: postingTypeFrom(job.postingType),
    sourceDescriptor: sourceDescriptorFor(job.postingType, null),
    location: job.location ?? '지역 미정',
    jobType: job.employmentType ?? '',
    deadlineLabel: deadlineLabel,
    dDayLabel: dDayLabel,
    isClosed: job.status == 'CLOSED',
    bookmarked: job.bookmarked,
  );
}

class JobBookmarkViewState {
  const JobBookmarkViewState({
    this.screenStatus = JobScreenStatus.loading,
    this.jobs = const [],
  });

  final JobScreenStatus screenStatus;
  final List<JobItem> jobs;

  JobBookmarkViewState copyWith({
    JobScreenStatus? screenStatus,
    List<JobItem>? jobs,
  }) => JobBookmarkViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    jobs: jobs ?? this.jobs,
  );
}

@riverpod
class JobBookmarkViewModel extends _$JobBookmarkViewModel {
  @override
  JobBookmarkViewState build() {
    unawaited(Future.microtask(_fetch));
    return const JobBookmarkViewState();
  }

  Future<void> retry() => _fetch();

  Future<void> toggleBookmark(String jobId) async {
    final index = state.jobs.indexWhere((job) => job.id == jobId);
    if (index == -1) return;
    try {
      await ref.read(jobRepositoryProvider).removeBookmark(int.parse(jobId));
      if (!ref.mounted) return;
      state = state.copyWith(
        jobs: [
          for (final job in state.jobs)
            if (job.id != jobId) job,
        ],
      );
    } catch (_) {
      // 실패하면 목록은 그대로 유지합니다.
    }
  }

  Future<void> _fetch() async {
    state = state.copyWith(screenStatus: JobScreenStatus.loading);
    try {
      final result = await ref.read(jobRepositoryProvider).getJobBookmarks();
      if (!ref.mounted) return;
      state = state.copyWith(
        screenStatus: JobScreenStatus.loaded,
        jobs: result.content.map(_jobItemFromRecommendation).toList(),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(screenStatus: JobScreenStatus.networkError);
    }
  }
}
