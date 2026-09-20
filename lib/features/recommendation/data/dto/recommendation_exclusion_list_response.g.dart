// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_exclusion_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseRecommendationExclusionListResponse
_$ApiResponseRecommendationExclusionListResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseRecommendationExclusionListResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : RecommendationExclusionListResponse.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  meta: json['meta'] as Map<String, dynamic>?,
);

RecommendationExclusionListResponse
_$RecommendationExclusionListResponseFromJson(Map<String, dynamic> json) =>
    RecommendationExclusionListResponse(
      content: (json['content'] as List<dynamic>)
          .map(
            (e) => RecommendationExclusionResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      first: json['first'] as bool,
      last: json['last'] as bool,
    );

RecommendationExclusionResponse _$RecommendationExclusionResponseFromJson(
  Map<String, dynamic> json,
) => RecommendationExclusionResponse(
  exclusionId: (json['exclusionId'] as num).toInt(),
  job: RecommendationJobResponse.fromJson(json['job'] as Map<String, dynamic>),
  exclusionType: json['exclusionType'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);
