// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseRecommendationListResponse
_$ApiResponseRecommendationListResponseFromJson(Map<String, dynamic> json) =>
    ApiResponseRecommendationListResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : RecommendationListResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      meta: json['meta'] as Map<String, dynamic>?,
    );

RecommendationListResponse _$RecommendationListResponseFromJson(
  Map<String, dynamic> json,
) => RecommendationListResponse(
  enabled: json['enabled'] as bool,
  status: json['status'] as String,
  generatedAt: json['generatedAt'] == null
      ? null
      : DateTime.parse(json['generatedAt'] as String),
  nextGenerationAt: json['nextGenerationAt'] == null
      ? null
      : DateTime.parse(json['nextGenerationAt'] as String),
  content: (json['content'] as List<dynamic>)
      .map(
        (e) => RecommendationItemResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  page: (json['page'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  first: json['first'] as bool,
  last: json['last'] as bool,
);

RecommendationItemResponse _$RecommendationItemResponseFromJson(
  Map<String, dynamic> json,
) => RecommendationItemResponse(
  recommendationId: (json['recommendationId'] as num).toInt(),
  job: RecommendationJobResponse.fromJson(json['job'] as Map<String, dynamic>),
  score: (json['score'] as num).toInt(),
  suitabilityLevel: json['suitabilityLevel'] as String,
  rank: (json['rank'] as num).toInt(),
  reasons: (json['reasons'] as List<dynamic>)
      .map(
        (e) => RecommendationReasonResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  generatedAt: DateTime.parse(json['generatedAt'] as String),
);

RecommendationJobResponse _$RecommendationJobResponseFromJson(
  Map<String, dynamic> json,
) => RecommendationJobResponse(
  jobId: (json['jobId'] as num).toInt(),
  title: json['title'] as String,
  postingType: json['postingType'] as String,
  applicationMethod: json['applicationMethod'] as String,
  status: json['status'] as String,
  company: json['company'] == null
      ? null
      : RecommendationCompanySummaryResponse.fromJson(
          json['company'] as Map<String, dynamic>,
        ),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  viewCount: (json['viewCount'] as num).toInt(),
  bookmarked: json['bookmarked'] as bool,
  techStacks: (json['techStacks'] as List<dynamic>)
      .map(
        (e) =>
            RecommendationTechStackResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  bookmarkCount: (json['bookmarkCount'] as num).toInt(),
);

RecommendationCompanySummaryResponse
_$RecommendationCompanySummaryResponseFromJson(Map<String, dynamic> json) =>
    RecommendationCompanySummaryResponse(
      companyId: (json['companyId'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
    );

RecommendationTechStackResponse _$RecommendationTechStackResponseFromJson(
  Map<String, dynamic> json,
) => RecommendationTechStackResponse(
  techStackId: (json['techStackId'] as num?)?.toInt(),
  name: json['name'] as String,
);

RecommendationReasonResponse _$RecommendationReasonResponseFromJson(
  Map<String, dynamic> json,
) => RecommendationReasonResponse(
  type: json['type'] as String,
  matchedCount: (json['matchedCount'] as num?)?.toInt(),
  totalCount: (json['totalCount'] as num?)?.toInt(),
);
