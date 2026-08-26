import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'job_search_response.freezed.dart';
part 'job_search_response.g.dart';

@freezed
abstract class CompanySummaryDto with _$CompanySummaryDto {
  const factory CompanySummaryDto({
    required int companyId,
    required String name,
    String? logoUrl,
  }) = _CompanySummaryDto;

  factory CompanySummaryDto.fromJson(Map<String, Object?> json) =>
      _$CompanySummaryDtoFromJson(json);
}

@freezed
abstract class JobEligibilitySnapshotDto with _$JobEligibilitySnapshotDto {
  const factory JobEligibilitySnapshotDto({
    required bool canApply,
    required String eligibilityReason,
    required String eligibilityMessage,
    int? applicationId,
    String? applicationStatus,
    @Default([]) List<String> availableActions,
  }) = _JobEligibilitySnapshotDto;

  factory JobEligibilitySnapshotDto.fromJson(Map<String, Object?> json) =>
      _$JobEligibilitySnapshotDtoFromJson(json);
}

@freezed
abstract class JobSummaryResponse with _$JobSummaryResponse {
  const factory JobSummaryResponse({
    required int jobId,
    required String title,
    required String postingType,
    required String applicationMethod,
    required String status,
    CompanySummaryDto? company,
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
    required JobEligibilitySnapshotDto application,
    @Default(false) bool bookmarked,
  }) = _JobSummaryResponse;

  factory JobSummaryResponse.fromJson(Map<String, Object?> json) =>
      _$JobSummaryResponseFromJson(json);
}

@freezed
abstract class JobSearchResponse with _$JobSearchResponse {
  const factory JobSearchResponse({
    @Default([]) List<JobSummaryResponse> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(true) bool first,
    @Default(true) bool last,
  }) = _JobSearchResponse;

  factory JobSearchResponse.fromJson(Map<String, Object?> json) =>
      _$JobSearchResponseFromJson(json);
}

@freezed
abstract class ApiResponseJobSearchResponse
    with _$ApiResponseJobSearchResponse {
  const factory ApiResponseJobSearchResponse({
    required bool success,
    JobSearchResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseJobSearchResponse;

  factory ApiResponseJobSearchResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseJobSearchResponseFromJson(json);
}
