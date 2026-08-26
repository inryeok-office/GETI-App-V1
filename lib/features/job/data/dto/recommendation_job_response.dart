import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';
import 'package:geti_app/features/job/data/dto/job_detail_response.dart';
import 'package:geti_app/features/job/data/dto/job_search_response.dart';

part 'recommendation_job_response.freezed.dart';
part 'recommendation_job_response.g.dart';

@freezed
abstract class RecommendationJobResponse with _$RecommendationJobResponse {
  const factory RecommendationJobResponse({
    required int jobId,
    required String title,
    required String postingType,
    required String applicationMethod,
    required String status,
    CompanySummaryDto? company,
    String? endDate,
    @Default(0) int viewCount,
    @Default(false) bool bookmarked,
    @Default([]) List<JobAiSkillDto> techStacks,
    @Default(0) int bookmarkCount,
    String? location,
    String? employmentType,
  }) = _RecommendationJobResponse;

  factory RecommendationJobResponse.fromJson(Map<String, Object?> json) =>
      _$RecommendationJobResponseFromJson(json);
}

@freezed
abstract class RecommendationJobListResponse
    with _$RecommendationJobListResponse {
  const factory RecommendationJobListResponse({
    @Default([]) List<RecommendationJobResponse> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(true) bool first,
    @Default(true) bool last,
  }) = _RecommendationJobListResponse;

  factory RecommendationJobListResponse.fromJson(Map<String, Object?> json) =>
      _$RecommendationJobListResponseFromJson(json);
}

@freezed
abstract class ApiResponseRecommendationJobListResponse
    with _$ApiResponseRecommendationJobListResponse {
  const factory ApiResponseRecommendationJobListResponse({
    required bool success,
    RecommendationJobListResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseRecommendationJobListResponse;

  factory ApiResponseRecommendationJobListResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseRecommendationJobListResponseFromJson(json);
}

@freezed
abstract class ApiResponseRecommendationJobResponse
    with _$ApiResponseRecommendationJobResponse {
  const factory ApiResponseRecommendationJobResponse({
    required bool success,
    RecommendationJobResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseRecommendationJobResponse;

  factory ApiResponseRecommendationJobResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseRecommendationJobResponseFromJson(json);
}
