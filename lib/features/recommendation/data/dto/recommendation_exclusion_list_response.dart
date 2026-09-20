import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommendation_exclusion_list_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponseRecommendationExclusionListResponse {
  const ApiResponseRecommendationExclusionListResponse({
    required this.success,
    this.data,
    this.meta,
  });

  factory ApiResponseRecommendationExclusionListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$ApiResponseRecommendationExclusionListResponseFromJson(json);

  final bool success;
  final RecommendationExclusionListResponse? data;
  final Map<String, dynamic>? meta;
}

@JsonSerializable(createToJson: false)
class RecommendationExclusionListResponse {
  const RecommendationExclusionListResponse({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.first,
    required this.last,
  });

  factory RecommendationExclusionListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$RecommendationExclusionListResponseFromJson(json);

  final List<RecommendationExclusionResponse> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
}

@JsonSerializable(createToJson: false)
class RecommendationExclusionResponse {
  const RecommendationExclusionResponse({
    required this.exclusionId,
    required this.job,
    required this.exclusionType,
    required this.createdAt,
  });

  factory RecommendationExclusionResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationExclusionResponseFromJson(json);

  final int exclusionId;
  final RecommendationJobResponse job;
  final String exclusionType;
  final DateTime createdAt;
}
