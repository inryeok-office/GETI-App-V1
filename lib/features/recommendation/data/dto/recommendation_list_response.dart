import 'package:json_annotation/json_annotation.dart';

part 'recommendation_list_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponseRecommendationListResponse {
  const ApiResponseRecommendationListResponse({
    required this.success,
    this.data,
    this.meta,
  });

  factory ApiResponseRecommendationListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$ApiResponseRecommendationListResponseFromJson(json);

  final bool success;
  final RecommendationListResponse? data;
  final Map<String, dynamic>? meta;
}

@JsonSerializable(createToJson: false)
class RecommendationListResponse {
  const RecommendationListResponse({
    required this.enabled,
    required this.status,
    required this.generatedAt,
    required this.nextGenerationAt,
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.first,
    required this.last,
  });

  factory RecommendationListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationListResponseFromJson(json);

  final bool enabled;
  final String status;
  final DateTime? generatedAt;
  final DateTime? nextGenerationAt;
  final List<RecommendationItemResponse> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
}

@JsonSerializable(createToJson: false)
class RecommendationItemResponse {
  const RecommendationItemResponse({
    required this.recommendationId,
    required this.job,
    required this.score,
    required this.suitabilityLevel,
    required this.rank,
    required this.reasons,
    required this.generatedAt,
  });

  factory RecommendationItemResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationItemResponseFromJson(json);

  final int recommendationId;
  final RecommendationJobResponse job;
  final int score;
  final String suitabilityLevel;
  final int rank;
  final List<RecommendationReasonResponse> reasons;
  final DateTime generatedAt;
}

@JsonSerializable(createToJson: false)
class RecommendationJobResponse {
  const RecommendationJobResponse({
    required this.jobId,
    required this.title,
    required this.postingType,
    required this.applicationMethod,
    required this.status,
    required this.company,
    required this.endDate,
    required this.viewCount,
    required this.bookmarked,
    required this.techStacks,
    required this.bookmarkCount,
  });

  factory RecommendationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationJobResponseFromJson(json);

  final int jobId;
  final String title;
  final String postingType;
  final String applicationMethod;
  final String status;
  final RecommendationCompanySummaryResponse? company;
  final DateTime? endDate;
  final int viewCount;
  final bool bookmarked;
  final List<RecommendationTechStackResponse> techStacks;
  final int bookmarkCount;
}

@JsonSerializable(createToJson: false)
class RecommendationCompanySummaryResponse {
  const RecommendationCompanySummaryResponse({
    required this.companyId,
    required this.name,
    required this.logoUrl,
  });

  factory RecommendationCompanySummaryResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$RecommendationCompanySummaryResponseFromJson(json);

  final int companyId;
  final String name;
  final String? logoUrl;
}

@JsonSerializable(createToJson: false)
class RecommendationTechStackResponse {
  const RecommendationTechStackResponse({
    required this.techStackId,
    required this.name,
  });

  factory RecommendationTechStackResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationTechStackResponseFromJson(json);

  final int? techStackId;
  final String name;
}

@JsonSerializable(createToJson: false)
class RecommendationReasonResponse {
  const RecommendationReasonResponse({
    required this.type,
    required this.matchedCount,
    required this.totalCount,
  });

  factory RecommendationReasonResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationReasonResponseFromJson(json);

  final String type;
  final int? matchedCount;
  final int? totalCount;
}
