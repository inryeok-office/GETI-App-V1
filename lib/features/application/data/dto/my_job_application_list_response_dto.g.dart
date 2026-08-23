// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_job_application_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyJobApplicationListApiResponseDto
_$MyJobApplicationListApiResponseDtoFromJson(Map<String, dynamic> json) =>
    _MyJobApplicationListApiResponseDto(
      success: json['success'] as bool,
      data: MyJobApplicationListResponseDto.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
      meta: ApiResponseMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyJobApplicationListApiResponseDtoToJson(
  _MyJobApplicationListApiResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'meta': instance.meta,
};

_MyJobApplicationListResponseDto _$MyJobApplicationListResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MyJobApplicationListResponseDto(
  content: (json['content'] as List<dynamic>)
      .map(
        (e) => MyJobApplicationListItemDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  page: (json['page'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  first: json['first'] as bool,
  last: json['last'] as bool,
);

Map<String, dynamic> _$MyJobApplicationListResponseDtoToJson(
  _MyJobApplicationListResponseDto instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
};

_MyJobApplicationListItemDto _$MyJobApplicationListItemDtoFromJson(
  Map<String, dynamic> json,
) => _MyJobApplicationListItemDto(
  applicationId: (json['applicationId'] as num).toInt(),
  job: json['job'] == null
      ? null
      : MyJobApplicationJobSummaryDto.fromJson(
          json['job'] as Map<String, dynamic>,
        ),
  status: $enumDecode(_$JobApplicationStatusDtoEnumMap, json['status']),
  submittedAt: json['submittedAt'] == null
      ? null
      : DateTime.parse(json['submittedAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MyJobApplicationListItemDtoToJson(
  _MyJobApplicationListItemDto instance,
) => <String, dynamic>{
  'applicationId': instance.applicationId,
  'job': instance.job,
  'status': _$JobApplicationStatusDtoEnumMap[instance.status]!,
  'submittedAt': instance.submittedAt?.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$JobApplicationStatusDtoEnumMap = {
  JobApplicationStatusDto.draft: 'DRAFT',
  JobApplicationStatusDto.submitted: 'SUBMITTED',
  JobApplicationStatusDto.editRequested: 'EDIT_REQUESTED',
  JobApplicationStatusDto.editAllowed: 'EDIT_ALLOWED',
  JobApplicationStatusDto.revisionRequested: 'REVISION_REQUESTED',
  JobApplicationStatusDto.approved: 'APPROVED',
  JobApplicationStatusDto.rejected: 'REJECTED',
  JobApplicationStatusDto.forwarded: 'FORWARDED',
  JobApplicationStatusDto.withdrawn: 'WITHDRAWN',
};

_MyJobApplicationJobSummaryDto _$MyJobApplicationJobSummaryDtoFromJson(
  Map<String, dynamic> json,
) => _MyJobApplicationJobSummaryDto(
  jobId: (json['jobId'] as num).toInt(),
  title: json['title'] as String,
  postingType: $enumDecode(_$JobPostingTypeDtoEnumMap, json['postingType']),
  applicationMethod: $enumDecode(
    _$JobApplicationMethodDtoEnumMap,
    json['applicationMethod'],
  ),
  status: $enumDecode(_$JobPostingStatusDtoEnumMap, json['status']),
  company: json['company'] == null
      ? null
      : CompanySummaryDto.fromJson(json['company'] as Map<String, dynamic>),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  viewCount: (json['viewCount'] as num).toInt(),
  bookmarked: json['bookmarked'] as bool,
  techStacks: (json['techStacks'] as List<dynamic>)
      .map((e) => JobAiSkillAccessDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  bookmarkCount: (json['bookmarkCount'] as num).toInt(),
);

Map<String, dynamic> _$MyJobApplicationJobSummaryDtoToJson(
  _MyJobApplicationJobSummaryDto instance,
) => <String, dynamic>{
  'jobId': instance.jobId,
  'title': instance.title,
  'postingType': _$JobPostingTypeDtoEnumMap[instance.postingType]!,
  'applicationMethod':
      _$JobApplicationMethodDtoEnumMap[instance.applicationMethod]!,
  'status': _$JobPostingStatusDtoEnumMap[instance.status]!,
  'company': instance.company,
  'endDate': instance.endDate?.toIso8601String(),
  'viewCount': instance.viewCount,
  'bookmarked': instance.bookmarked,
  'techStacks': instance.techStacks,
  'bookmarkCount': instance.bookmarkCount,
};

const _$JobPostingTypeDtoEnumMap = {
  JobPostingTypeDto.general: 'GENERAL',
  JobPostingTypeDto.mou: 'MOU',
  JobPostingTypeDto.school: 'SCHOOL',
};

const _$JobApplicationMethodDtoEnumMap = {
  JobApplicationMethodDto.internal: 'INTERNAL',
  JobApplicationMethodDto.external: 'EXTERNAL',
};

const _$JobPostingStatusDtoEnumMap = {
  JobPostingStatusDto.draft: 'DRAFT',
  JobPostingStatusDto.published: 'PUBLISHED',
  JobPostingStatusDto.closed: 'CLOSED',
  JobPostingStatusDto.deleted: 'DELETED',
};

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

_JobAiSkillAccessDto _$JobAiSkillAccessDtoFromJson(Map<String, dynamic> json) =>
    _JobAiSkillAccessDto(
      techStackId: (json['techStackId'] as num?)?.toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$JobAiSkillAccessDtoToJson(
  _JobAiSkillAccessDto instance,
) => <String, dynamic>{
  'techStackId': instance.techStackId,
  'name': instance.name,
};

_ApiResponseMetaDto _$ApiResponseMetaDtoFromJson(Map<String, dynamic> json) =>
    _ApiResponseMetaDto(requestId: json['requestId'] as String?);

Map<String, dynamic> _$ApiResponseMetaDtoToJson(_ApiResponseMetaDto instance) =>
    <String, dynamic>{'requestId': instance.requestId};
