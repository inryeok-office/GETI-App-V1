import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';
import 'package:geti_app/features/job/data/dto/job_search_response.dart';

part 'job_detail_response.freezed.dart';
part 'job_detail_response.g.dart';

@freezed
abstract class JobAiSkillDto with _$JobAiSkillDto {
  const factory JobAiSkillDto({int? techStackId, required String name}) =
      _JobAiSkillDto;

  factory JobAiSkillDto.fromJson(Map<String, Object?> json) =>
      _$JobAiSkillDtoFromJson(json);
}

@freezed
abstract class JobAiAnalysisSnapshotDto with _$JobAiAnalysisSnapshotDto {
  const factory JobAiAnalysisSnapshotDto({
    required String status,
    String? summary,
    @Default([]) List<JobAiSkillDto> requiredSkills,
    @Default([]) List<JobAiSkillDto> preferredSkills,
    String? highSchoolGraduateFit,
    String? entryLevelFit,
    String? difficulty,
    @Default(false) bool canReanalyze,
    @Default(0) int remainingReanalysisCount,
    String? analyzedAt,
    @Default(false) bool reanalysis,
  }) = _JobAiAnalysisSnapshotDto;

  factory JobAiAnalysisSnapshotDto.fromJson(Map<String, Object?> json) =>
      _$JobAiAnalysisSnapshotDtoFromJson(json);
}

@freezed
abstract class JobFileDto with _$JobFileDto {
  const factory JobFileDto({
    required int fileId,
    required String originalName,
    required String contentType,
    required int size,
    required String downloadUrl,
  }) = _JobFileDto;

  factory JobFileDto.fromJson(Map<String, Object?> json) =>
      _$JobFileDtoFromJson(json);
}

@freezed
abstract class JobDetailResponse with _$JobDetailResponse {
  const factory JobDetailResponse({
    required int jobId,
    required String title,
    required String postingType,
    required String applicationMethod,
    required String status,
    CompanySummaryDto? company,
    String? content,
    String? externalUrl,
    String? startDate,
    String? endDate,
    int? targetGrade,
    int? capacity,
    String? location,
    String? employmentType,
    String? sourceName,
    @Default(false) bool firstComeServed,
    @Default(0) int viewCount,
    String? publishedAt,
    String? closedAt,
    JobAiAnalysisSnapshotDto? aiAnalysis,
    required JobEligibilitySnapshotDto application,
    @Default(false) bool bookmarked,
    @Default([]) List<JobFileDto> files,
  }) = _JobDetailResponse;

  factory JobDetailResponse.fromJson(Map<String, Object?> json) =>
      _$JobDetailResponseFromJson(json);
}

@freezed
abstract class ApiResponseJobDetailResponse
    with _$ApiResponseJobDetailResponse {
  const factory ApiResponseJobDetailResponse({
    required bool success,
    JobDetailResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseJobDetailResponse;

  factory ApiResponseJobDetailResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseJobDetailResponseFromJson(json);
}
