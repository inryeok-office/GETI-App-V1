// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobAiSkillDto _$JobAiSkillDtoFromJson(Map<String, dynamic> json) =>
    _JobAiSkillDto(
      techStackId: (json['techStackId'] as num?)?.toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$JobAiSkillDtoToJson(_JobAiSkillDto instance) =>
    <String, dynamic>{
      'techStackId': instance.techStackId,
      'name': instance.name,
    };

_JobAiAnalysisSnapshotDto _$JobAiAnalysisSnapshotDtoFromJson(
  Map<String, dynamic> json,
) => _JobAiAnalysisSnapshotDto(
  status: json['status'] as String,
  summary: json['summary'] as String?,
  requiredSkills:
      (json['requiredSkills'] as List<dynamic>?)
          ?.map((e) => JobAiSkillDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  preferredSkills:
      (json['preferredSkills'] as List<dynamic>?)
          ?.map((e) => JobAiSkillDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  highSchoolGraduateFit: json['highSchoolGraduateFit'] as String?,
  entryLevelFit: json['entryLevelFit'] as String?,
  difficulty: json['difficulty'] as String?,
  canReanalyze: json['canReanalyze'] as bool? ?? false,
  remainingReanalysisCount:
      (json['remainingReanalysisCount'] as num?)?.toInt() ?? 0,
  analyzedAt: json['analyzedAt'] as String?,
  reanalysis: json['reanalysis'] as bool? ?? false,
);

Map<String, dynamic> _$JobAiAnalysisSnapshotDtoToJson(
  _JobAiAnalysisSnapshotDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'summary': instance.summary,
  'requiredSkills': instance.requiredSkills,
  'preferredSkills': instance.preferredSkills,
  'highSchoolGraduateFit': instance.highSchoolGraduateFit,
  'entryLevelFit': instance.entryLevelFit,
  'difficulty': instance.difficulty,
  'canReanalyze': instance.canReanalyze,
  'remainingReanalysisCount': instance.remainingReanalysisCount,
  'analyzedAt': instance.analyzedAt,
  'reanalysis': instance.reanalysis,
};

_JobFileDto _$JobFileDtoFromJson(Map<String, dynamic> json) => _JobFileDto(
  fileId: (json['fileId'] as num).toInt(),
  originalName: json['originalName'] as String,
  contentType: json['contentType'] as String,
  size: (json['size'] as num).toInt(),
  downloadUrl: json['downloadUrl'] as String,
);

Map<String, dynamic> _$JobFileDtoToJson(_JobFileDto instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'originalName': instance.originalName,
      'contentType': instance.contentType,
      'size': instance.size,
      'downloadUrl': instance.downloadUrl,
    };

_JobDetailResponse _$JobDetailResponseFromJson(Map<String, dynamic> json) =>
    _JobDetailResponse(
      jobId: (json['jobId'] as num).toInt(),
      title: json['title'] as String,
      postingType: json['postingType'] as String,
      applicationMethod: json['applicationMethod'] as String,
      status: json['status'] as String,
      company: json['company'] == null
          ? null
          : CompanySummaryDto.fromJson(json['company'] as Map<String, dynamic>),
      content: json['content'] as String?,
      externalUrl: json['externalUrl'] as String?,
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
      closedAt: json['closedAt'] as String?,
      aiAnalysis: json['aiAnalysis'] == null
          ? null
          : JobAiAnalysisSnapshotDto.fromJson(
              json['aiAnalysis'] as Map<String, dynamic>,
            ),
      application: JobEligibilitySnapshotDto.fromJson(
        json['application'] as Map<String, dynamic>,
      ),
      bookmarked: json['bookmarked'] as bool? ?? false,
      files:
          (json['files'] as List<dynamic>?)
              ?.map((e) => JobFileDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$JobDetailResponseToJson(_JobDetailResponse instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'title': instance.title,
      'postingType': instance.postingType,
      'applicationMethod': instance.applicationMethod,
      'status': instance.status,
      'company': instance.company,
      'content': instance.content,
      'externalUrl': instance.externalUrl,
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
      'closedAt': instance.closedAt,
      'aiAnalysis': instance.aiAnalysis,
      'application': instance.application,
      'bookmarked': instance.bookmarked,
      'files': instance.files,
    };

_ApiResponseJobDetailResponse _$ApiResponseJobDetailResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseJobDetailResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : JobDetailResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseJobDetailResponseToJson(
  _ApiResponseJobDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
