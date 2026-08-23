// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicationDetailApiResponseDto
_$JobApplicationDetailApiResponseDtoFromJson(Map<String, dynamic> json) =>
    _JobApplicationDetailApiResponseDto(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : JobApplicationDetailResponseDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      meta: json['meta'] == null
          ? null
          : ApiResponseMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobApplicationDetailApiResponseDtoToJson(
  _JobApplicationDetailApiResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'meta': instance.meta,
};

_JobApplicationDetailResponseDto _$JobApplicationDetailResponseDtoFromJson(
  Map<String, dynamic> json,
) => _JobApplicationDetailResponseDto(
  applicationId: (json['applicationId'] as num?)?.toInt(),
  jobId: (json['jobId'] as num?)?.toInt(),
  jobTitle: json['jobTitle'] as String?,
  companyName: json['companyName'] as String?,
  managerMemberId: (json['managerMemberId'] as num?)?.toInt(),
  managerName: json['managerName'] as String?,
  formId: (json['formId'] as num?)?.toInt(),
  formVersion: (json['formVersion'] as num?)?.toInt(),
  status: $enumDecodeNullable(
    _$JobApplicationStatusDtoEnumMap,
    json['status'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  statusReason: json['statusReason'] as String?,
  contactEmail: json['contactEmail'] as String?,
  contactPhone: json['contactPhone'] as String?,
  privacyConsent: json['privacyConsent'] as bool?,
  applicantName: json['applicantName'] as String?,
  applicantCohort: (json['applicantCohort'] as num?)?.toInt(),
  applicantDepartment: json['applicantDepartment'] as String?,
  applicantMajors:
      (json['applicantMajors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  applicantDesiredJob: json['applicantDesiredJob'] as String?,
  applicantTechStacks:
      (json['applicantTechStacks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => ApplicationAnswerDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ApplicationAnswerDto>[],
  files:
      (json['files'] as List<dynamic>?)
          ?.map(
            (e) => JobApplicationFileResponseDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <JobApplicationFileResponseDto>[],
  submittedAt: json['submittedAt'] == null
      ? null
      : DateTime.parse(json['submittedAt'] as String),
  withdrawnAt: json['withdrawnAt'] == null
      ? null
      : DateTime.parse(json['withdrawnAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  availableActions:
      (json['availableActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  questions:
      (json['questions'] as List<dynamic>?)
          ?.map((e) => FormFieldResponseDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FormFieldResponseDto>[],
);

Map<String, dynamic> _$JobApplicationDetailResponseDtoToJson(
  _JobApplicationDetailResponseDto instance,
) => <String, dynamic>{
  'applicationId': instance.applicationId,
  'jobId': instance.jobId,
  'jobTitle': instance.jobTitle,
  'companyName': instance.companyName,
  'managerMemberId': instance.managerMemberId,
  'managerName': instance.managerName,
  'formId': instance.formId,
  'formVersion': instance.formVersion,
  'status': _$JobApplicationStatusDtoEnumMap[instance.status],
  'statusReason': instance.statusReason,
  'contactEmail': instance.contactEmail,
  'contactPhone': instance.contactPhone,
  'privacyConsent': instance.privacyConsent,
  'applicantName': instance.applicantName,
  'applicantCohort': instance.applicantCohort,
  'applicantDepartment': instance.applicantDepartment,
  'applicantMajors': instance.applicantMajors,
  'applicantDesiredJob': instance.applicantDesiredJob,
  'applicantTechStacks': instance.applicantTechStacks,
  'answers': instance.answers,
  'files': instance.files,
  'submittedAt': instance.submittedAt?.toIso8601String(),
  'withdrawnAt': instance.withdrawnAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'availableActions': instance.availableActions,
  'questions': instance.questions,
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

_ApplicationAnswerDto _$ApplicationAnswerDtoFromJson(
  Map<String, dynamic> json,
) => _ApplicationAnswerDto(
  fieldId: json['fieldId'] as String?,
  value: json['value'],
  fileIds: (json['fileIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$ApplicationAnswerDtoToJson(
  _ApplicationAnswerDto instance,
) => <String, dynamic>{
  'fieldId': instance.fieldId,
  'value': instance.value,
  'fileIds': instance.fileIds,
};

_JobApplicationFileResponseDto _$JobApplicationFileResponseDtoFromJson(
  Map<String, dynamic> json,
) => _JobApplicationFileResponseDto(
  fileId: (json['fileId'] as num?)?.toInt(),
  originalName: json['originalName'] as String?,
  contentType: json['contentType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  downloadUrl: json['downloadUrl'] as String?,
);

Map<String, dynamic> _$JobApplicationFileResponseDtoToJson(
  _JobApplicationFileResponseDto instance,
) => <String, dynamic>{
  'fileId': instance.fileId,
  'originalName': instance.originalName,
  'contentType': instance.contentType,
  'size': instance.size,
  'downloadUrl': instance.downloadUrl,
};

_FormFieldResponseDto _$FormFieldResponseDtoFromJson(
  Map<String, dynamic> json,
) => _FormFieldResponseDto(
  fieldId: json['fieldId'] as String?,
  type: $enumDecodeNullable(
    _$FormFieldTypeDtoEnumMap,
    json['type'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  title: json['title'] as String?,
  description: json['description'] as String?,
  isRequired: json['required'] as bool?,
  order: (json['order'] as num?)?.toInt(),
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  filePolicy: json['filePolicy'],
);

Map<String, dynamic> _$FormFieldResponseDtoToJson(
  _FormFieldResponseDto instance,
) => <String, dynamic>{
  'fieldId': instance.fieldId,
  'type': _$FormFieldTypeDtoEnumMap[instance.type],
  'title': instance.title,
  'description': instance.description,
  'required': instance.isRequired,
  'order': instance.order,
  'options': instance.options,
  'filePolicy': instance.filePolicy,
};

const _$FormFieldTypeDtoEnumMap = {
  FormFieldTypeDto.text: 'TEXT',
  FormFieldTypeDto.textarea: 'TEXTAREA',
  FormFieldTypeDto.singleSelect: 'SINGLE_SELECT',
  FormFieldTypeDto.multiSelect: 'MULTI_SELECT',
  FormFieldTypeDto.file: 'FILE',
};
