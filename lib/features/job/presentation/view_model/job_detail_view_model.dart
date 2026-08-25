import 'dart:async';

import 'package:dio/dio.dart';
import 'package:geti_app/features/job/data/dto/job_detail_response.dart';
import 'package:geti_app/features/job/data/job_repository.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_detail_view_model.g.dart';

enum JobDetailScreenStatus { loading, loaded, notFound, networkError }

enum JobAiAnalysisStatus {
  completed,
  pending,
  failed,
  insufficientInfo,
  reanalyzing,
}

class JobAiAnalysis {
  const JobAiAnalysis({
    required this.status,
    this.summary,
    this.requiredSkills = const [],
    this.preferredSkills = const [],
    this.fitTags = const [],
    this.difficulty,
    this.canReanalyze = false,
    this.remainingReanalysisCount = 0,
  });

  final JobAiAnalysisStatus status;

  /// 아래 필드는 [status]가 [JobAiAnalysisStatus.completed]일 때만 채워집니다.
  final String? summary;
  final List<String> requiredSkills;
  final List<String> preferredSkills;
  final List<String> fitTags;
  final String? difficulty;
  final bool canReanalyze;
  final int remainingReanalysisCount;

  factory JobAiAnalysis.fromSnapshot(JobAiAnalysisSnapshotDto? dto) {
    if (dto == null) {
      return const JobAiAnalysis(status: JobAiAnalysisStatus.pending);
    }
    final hasContent =
        (dto.summary != null && dto.summary!.isNotEmpty) ||
        dto.requiredSkills.isNotEmpty ||
        dto.preferredSkills.isNotEmpty;
    final status = switch (dto.status) {
      'FAILED' => JobAiAnalysisStatus.failed,
      'COMPLETED' =>
        hasContent
            ? JobAiAnalysisStatus.completed
            : JobAiAnalysisStatus.insufficientInfo,
      'PROCESSING' when dto.reanalysis => JobAiAnalysisStatus.reanalyzing,
      _ => JobAiAnalysisStatus.pending,
    };
    return JobAiAnalysis(
      status: status,
      summary: dto.summary,
      requiredSkills: dto.requiredSkills.map((skill) => skill.name).toList(),
      preferredSkills: dto.preferredSkills.map((skill) => skill.name).toList(),
      fitTags: [
        ..._fitTags('고졸', dto.highSchoolGraduateFit),
        ..._fitTags('신입', dto.entryLevelFit),
      ],
      difficulty: _difficultyLabel(dto.difficulty),
      canReanalyze: dto.canReanalyze,
      remainingReanalysisCount: dto.remainingReanalysisCount,
    );
  }

  static List<String> _fitTags(String axis, String? level) => switch (level) {
    'SUITABLE' => ['$axis 지원 가능'],
    'CONDITIONAL' => ['$axis 조건부 지원 가능'],
    'UNSUITABLE' => ['$axis 지원 비권장'],
    _ => const [],
  };

  static String? _difficultyLabel(String? raw) => switch (raw) {
    'EASY' => '쉬움',
    'NORMAL' => '보통',
    'HARD' => '어려움',
    _ => null,
  };
}

class JobAttachment {
  const JobAttachment({required this.name, required this.sizeLabel});
  final String name;
  final String sizeLabel;

  factory JobAttachment.fromDto(JobFileDto dto) =>
      JobAttachment(name: dto.originalName, sizeLabel: _formatBytes(dto.size));

  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    final kb = bytes / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(1)}KB';
    final mb = kb / 1024;
    return '${mb.toStringAsFixed(1)}MB';
  }
}

class JobDetail {
  const JobDetail({
    required this.recruitmentPeriod,
    required this.applicationTypeLabel,
    required this.description,
    this.sourceName,
    this.externalUrl,
    this.targetAudience,
    this.attachments = const [],
  });

  final String recruitmentPeriod;
  final String applicationTypeLabel;
  final String description;

  /// 외부 공고에서만 사용됩니다.
  final String? sourceName;
  final String? externalUrl;

  /// 학교 공고에서만 사용됩니다.
  final String? targetAudience;

  /// 첨부파일이 없으면 빈 목록이며, 상세 화면에서 섹션 자체가 숨겨집니다.
  final List<JobAttachment> attachments;

  factory JobDetail.fromResponse(JobDetailResponse response) => JobDetail(
    recruitmentPeriod: _recruitmentPeriod(response.startDate, response.endDate),
    applicationTypeLabel: response.applicationMethod == 'INTERNAL'
        ? '교내 지원서 작성'
        : '외부 지원',
    description: response.content ?? '등록된 공고 설명이 없습니다.',
    sourceName: response.applicationMethod == 'EXTERNAL'
        ? response.sourceName
        : null,
    externalUrl: response.externalUrl,
    targetAudience: response.targetGrade == null
        ? null
        : '광주소프트웨어마이스터고 ${response.targetGrade}학년 재학생',
    attachments: response.files.map(JobAttachment.fromDto).toList(),
  );

  static String _recruitmentPeriod(String? startIso, String? endIso) {
    final start = startIso == null ? null : DateTime.tryParse(startIso);
    final end = endIso == null ? null : DateTime.tryParse(endIso);
    if (start == null || end == null) return '상시 모집';
    return '${_formatDate(start)} ~ ${_formatDate(end)}';
  }

  static String _formatDate(DateTime date) =>
      '${date.year}.${date.month.toString().padLeft(2, '0')}.'
      '${date.day.toString().padLeft(2, '0')}';
}

class JobDetailViewState {
  const JobDetailViewState({
    this.screenStatus = JobDetailScreenStatus.loading,
    this.job,
    this.detail,
    this.aiAnalysis,
    this.viewCount = 0,
    this.reanalyzing = false,
  });

  final JobDetailScreenStatus screenStatus;
  final JobItem? job;
  final JobDetail? detail;
  final JobAiAnalysis? aiAnalysis;
  final int viewCount;
  final bool reanalyzing;

  JobDetailViewState copyWith({
    JobDetailScreenStatus? screenStatus,
    JobItem? job,
    JobDetail? detail,
    JobAiAnalysis? aiAnalysis,
    int? viewCount,
    bool? reanalyzing,
  }) => JobDetailViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    job: job ?? this.job,
    detail: detail ?? this.detail,
    aiAnalysis: aiAnalysis ?? this.aiAnalysis,
    viewCount: viewCount ?? this.viewCount,
    reanalyzing: reanalyzing ?? this.reanalyzing,
  );
}

@riverpod
class JobDetailViewModel extends _$JobDetailViewModel {
  @override
  JobDetailViewState build(String jobId) {
    unawaited(Future.microtask(_fetch));
    return const JobDetailViewState();
  }

  Future<void> retry() => _fetch();

  Future<void> toggleBookmark() async {
    final job = state.job;
    if (job == null) return;
    final nextBookmarked = !job.bookmarked;
    state = state.copyWith(job: job.copyWith(bookmarked: nextBookmarked));
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
      state = state.copyWith(job: job);
    }
  }

  Future<void> retryAiAnalysis() async {
    if (state.reanalyzing) return;
    final previousAiAnalysis = state.aiAnalysis;
    state = state.copyWith(
      reanalyzing: true,
      aiAnalysis: const JobAiAnalysis(status: JobAiAnalysisStatus.reanalyzing),
    );
    try {
      await ref
          .read(jobRepositoryProvider)
          .requestAiReanalysis(int.parse(jobId));
      if (!ref.mounted) return;
      await _fetch(preserveScreenStatus: true);
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        reanalyzing: false,
        aiAnalysis: previousAiAnalysis,
      );
    }
  }

  Future<void> _fetch({bool preserveScreenStatus = false}) async {
    if (!preserveScreenStatus) {
      state = state.copyWith(screenStatus: JobDetailScreenStatus.loading);
    }
    try {
      final response = await ref
          .read(jobRepositoryProvider)
          .getJobDetail(int.parse(jobId));
      if (!ref.mounted) return;
      state = JobDetailViewState(
        screenStatus: JobDetailScreenStatus.loaded,
        job: JobItem(
          id: response.jobId.toString(),
          companyName: response.company?.name ?? '기업명 미정',
          title: response.title,
          applicationMethod: applicationMethodFrom(response.applicationMethod),
          postingType: postingTypeFrom(response.postingType),
          sourceDescriptor: sourceDescriptorFor(
            response.postingType,
            response.sourceName,
          ),
          location: response.location ?? '지역 미정',
          jobType: response.employmentType ?? '',
          deadlineLabel: deadlineLabelsFor(response.endDate).$1,
          dDayLabel: deadlineLabelsFor(response.endDate).$2,
          isClosed: response.status == 'CLOSED',
          canApply: response.application.canApply,
          eligibilityReason: response.application.canApply
              ? null
              : response.application.eligibilityMessage,
          bookmarked: response.bookmarked,
        ),
        detail: JobDetail.fromResponse(response),
        aiAnalysis: JobAiAnalysis.fromSnapshot(response.aiAnalysis),
        viewCount: response.viewCount,
      );
    } catch (error) {
      if (!ref.mounted) return;
      final isNotFound =
          error is DioException && error.response?.statusCode == 404;
      state = state.copyWith(
        screenStatus: isNotFound
            ? JobDetailScreenStatus.notFound
            : JobDetailScreenStatus.networkError,
        reanalyzing: false,
      );
    }
  }
}
