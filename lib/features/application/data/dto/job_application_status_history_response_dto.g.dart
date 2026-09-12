// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_status_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicationStatusHistoryApiResponseDto
_$JobApplicationStatusHistoryApiResponseDtoFromJson(
  Map<String, dynamic> json,
) => _JobApplicationStatusHistoryApiResponseDto(
  success: json['success'] as bool?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => JobApplicationStatusHistoryResponseDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <JobApplicationStatusHistoryResponseDto>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JobApplicationStatusHistoryApiResponseDtoToJson(
  _JobApplicationStatusHistoryApiResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'meta': instance.meta,
};

_JobApplicationStatusHistoryResponseDto
_$JobApplicationStatusHistoryResponseDtoFromJson(Map<String, dynamic> json) =>
    _JobApplicationStatusHistoryResponseDto(
      historyId: (json['historyId'] as num?)?.toInt(),
      fromStatus: $enumDecodeNullable(
        _$JobApplicationStatusDtoEnumMap,
        json['fromStatus'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      toStatus: $enumDecodeNullable(
        _$JobApplicationStatusDtoEnumMap,
        json['toStatus'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      action: json['action'] as String?,
      actorMemberId: (json['actorMemberId'] as num?)?.toInt(),
      reason: json['reason'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$JobApplicationStatusHistoryResponseDtoToJson(
  _JobApplicationStatusHistoryResponseDto instance,
) => <String, dynamic>{
  'historyId': instance.historyId,
  'fromStatus': _$JobApplicationStatusDtoEnumMap[instance.fromStatus],
  'toStatus': _$JobApplicationStatusDtoEnumMap[instance.toStatus],
  'action': instance.action,
  'actorMemberId': instance.actorMemberId,
  'reason': instance.reason,
  'createdAt': instance.createdAt?.toIso8601String(),
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
