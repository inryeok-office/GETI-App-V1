// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendationJobResponse _$RecommendationJobResponseFromJson(
  Map<String, dynamic> json,
) => _RecommendationJobResponse(
  jobId: (json['jobId'] as num).toInt(),
  title: json['title'] as String,
  postingType: json['postingType'] as String,
  applicationMethod: json['applicationMethod'] as String,
  status: json['status'] as String,
  company: json['company'] == null
      ? null
      : CompanySummaryDto.fromJson(json['company'] as Map<String, dynamic>),
  endDate: json['endDate'] as String?,
  viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
  bookmarked: json['bookmarked'] as bool? ?? false,
  techStacks:
      (json['techStacks'] as List<dynamic>?)
          ?.map((e) => JobAiSkillDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  bookmarkCount: (json['bookmarkCount'] as num?)?.toInt() ?? 0,
  location: json['location'] as String?,
  employmentType: json['employmentType'] as String?,
);

Map<String, dynamic> _$RecommendationJobResponseToJson(
  _RecommendationJobResponse instance,
) => <String, dynamic>{
  'jobId': instance.jobId,
  'title': instance.title,
  'postingType': instance.postingType,
  'applicationMethod': instance.applicationMethod,
  'status': instance.status,
  'company': instance.company,
  'endDate': instance.endDate,
  'viewCount': instance.viewCount,
  'bookmarked': instance.bookmarked,
  'techStacks': instance.techStacks,
  'bookmarkCount': instance.bookmarkCount,
  'location': instance.location,
  'employmentType': instance.employmentType,
};

_RecommendationJobListResponse _$RecommendationJobListResponseFromJson(
  Map<String, dynamic> json,
) => _RecommendationJobListResponse(
  content:
      (json['content'] as List<dynamic>?)
          ?.map(
            (e) =>
                RecommendationJobResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  first: json['first'] as bool? ?? true,
  last: json['last'] as bool? ?? true,
);

Map<String, dynamic> _$RecommendationJobListResponseToJson(
  _RecommendationJobListResponse instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
};

_ApiResponseRecommendationJobListResponse
_$ApiResponseRecommendationJobListResponseFromJson(Map<String, dynamic> json) =>
    _ApiResponseRecommendationJobListResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : RecommendationJobListResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      error: json['error'] == null
          ? null
          : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseRecommendationJobListResponseToJson(
  _ApiResponseRecommendationJobListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};

_ApiResponseRecommendationJobResponse
_$ApiResponseRecommendationJobResponseFromJson(Map<String, dynamic> json) =>
    _ApiResponseRecommendationJobResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : RecommendationJobResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      error: json['error'] == null
          ? null
          : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseRecommendationJobResponseToJson(
  _ApiResponseRecommendationJobResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
