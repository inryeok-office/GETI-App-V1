// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanySummaryDto _$CompanySummaryDtoFromJson(Map<String, dynamic> json) =>
    _CompanySummaryDto(
      companyId: (json['companyId'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$CompanySummaryDtoToJson(_CompanySummaryDto instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
    };

_JobEligibilitySnapshotDto _$JobEligibilitySnapshotDtoFromJson(
  Map<String, dynamic> json,
) => _JobEligibilitySnapshotDto(
  canApply: json['canApply'] as bool,
  eligibilityReason: json['eligibilityReason'] as String,
  eligibilityMessage: json['eligibilityMessage'] as String,
  applicationId: (json['applicationId'] as num?)?.toInt(),
  applicationStatus: json['applicationStatus'] as String?,
  availableActions:
      (json['availableActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$JobEligibilitySnapshotDtoToJson(
  _JobEligibilitySnapshotDto instance,
) => <String, dynamic>{
  'canApply': instance.canApply,
  'eligibilityReason': instance.eligibilityReason,
  'eligibilityMessage': instance.eligibilityMessage,
  'applicationId': instance.applicationId,
  'applicationStatus': instance.applicationStatus,
  'availableActions': instance.availableActions,
};

_JobSummaryResponse _$JobSummaryResponseFromJson(Map<String, dynamic> json) =>
    _JobSummaryResponse(
      jobId: (json['jobId'] as num).toInt(),
      title: json['title'] as String,
      postingType: json['postingType'] as String,
      applicationMethod: json['applicationMethod'] as String,
      status: json['status'] as String,
      company: json['company'] == null
          ? null
          : CompanySummaryDto.fromJson(json['company'] as Map<String, dynamic>),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      targetGrade: (json['targetGrade'] as num?)?.toInt(),
      capacity: (json['capacity'] as num?)?.toInt(),
      location: json['location'] as String?,
      employmentType: json['employmentType'] as String?,
      sourceName: json['sourceName'] as String?,
      firstComeServed: json['firstComeServed'] as bool? ?? false,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      publishedAt: json['publishedAt'] as String?,
      application: JobEligibilitySnapshotDto.fromJson(
        json['application'] as Map<String, dynamic>,
      ),
      bookmarked: json['bookmarked'] as bool? ?? false,
    );

Map<String, dynamic> _$JobSummaryResponseToJson(_JobSummaryResponse instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'title': instance.title,
      'postingType': instance.postingType,
      'applicationMethod': instance.applicationMethod,
      'status': instance.status,
      'company': instance.company,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'targetGrade': instance.targetGrade,
      'capacity': instance.capacity,
      'location': instance.location,
      'employmentType': instance.employmentType,
      'sourceName': instance.sourceName,
      'firstComeServed': instance.firstComeServed,
      'viewCount': instance.viewCount,
      'publishedAt': instance.publishedAt,
      'application': instance.application,
      'bookmarked': instance.bookmarked,
    };

_JobSearchResponse _$JobSearchResponseFromJson(Map<String, dynamic> json) =>
    _JobSearchResponse(
      content:
          (json['content'] as List<dynamic>?)
              ?.map(
                (e) => JobSummaryResponse.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$JobSearchResponseToJson(_JobSearchResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'first': instance.first,
      'last': instance.last,
    };

_ApiResponseJobSearchResponse _$ApiResponseJobSearchResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseJobSearchResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : JobSearchResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseJobSearchResponseToJson(
  _ApiResponseJobSearchResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
