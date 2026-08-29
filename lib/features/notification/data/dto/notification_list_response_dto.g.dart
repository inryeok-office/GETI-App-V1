// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationListApiResponseDto _$NotificationListApiResponseDtoFromJson(
  Map<String, dynamic> json,
) => _NotificationListApiResponseDto(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : NotificationListResponseDto.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  meta: json['meta'] == null
      ? null
      : NotificationResponseMetaDto.fromJson(
          json['meta'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$NotificationListApiResponseDtoToJson(
  _NotificationListApiResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'meta': instance.meta,
};

_NotificationListResponseDto _$NotificationListResponseDtoFromJson(
  Map<String, dynamic> json,
) => _NotificationListResponseDto(
  content:
      (json['content'] as List<dynamic>?)
          ?.map(
            (e) => NotificationSummaryResponseDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <NotificationSummaryResponseDto>[],
  page: (json['page'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  totalElements: (json['totalElements'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  first: json['first'] as bool?,
  last: json['last'] as bool?,
  unreadCount: (json['unreadCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$NotificationListResponseDtoToJson(
  _NotificationListResponseDto instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'unreadCount': instance.unreadCount,
};

_NotificationSummaryResponseDto _$NotificationSummaryResponseDtoFromJson(
  Map<String, dynamic> json,
) => _NotificationSummaryResponseDto(
  notificationId: (json['notificationId'] as num?)?.toInt(),
  notificationType: $enumDecodeNullable(
    _$NotificationTypeDtoEnumMap,
    json['notificationType'],
    unknownValue: NotificationTypeDto.unknown,
  ),
  title: json['title'] as String?,
  content: json['content'] as String?,
  targetType: $enumDecodeNullable(
    _$NotificationTargetTypeDtoEnumMap,
    json['targetType'],
    unknownValue: NotificationTargetTypeDto.unknown,
  ),
  targetId: (json['targetId'] as num?)?.toInt(),
  targetAvailable: json['targetAvailable'] as bool?,
  targetUnavailableReason: $enumDecodeNullable(
    _$NotificationUnavailableReasonDtoEnumMap,
    json['targetUnavailableReason'],
    unknownValue: NotificationUnavailableReasonDto.unknown,
  ),
  deepLink: json['deepLink'] as String?,
  isRead: json['read'] as bool?,
  readAt: json['readAt'] == null
      ? null
      : DateTime.parse(json['readAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$NotificationSummaryResponseDtoToJson(
  _NotificationSummaryResponseDto instance,
) => <String, dynamic>{
  'notificationId': instance.notificationId,
  'notificationType': _$NotificationTypeDtoEnumMap[instance.notificationType],
  'title': instance.title,
  'content': instance.content,
  'targetType': _$NotificationTargetTypeDtoEnumMap[instance.targetType],
  'targetId': instance.targetId,
  'targetAvailable': instance.targetAvailable,
  'targetUnavailableReason':
      _$NotificationUnavailableReasonDtoEnumMap[instance
          .targetUnavailableReason],
  'deepLink': instance.deepLink,
  'read': instance.isRead,
  'readAt': instance.readAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$NotificationTypeDtoEnumMap = {
  NotificationTypeDto.jobPublished: 'JOB_PUBLISHED',
  NotificationTypeDto.jobUpdated: 'JOB_UPDATED',
  NotificationTypeDto.jobClosed: 'JOB_CLOSED',
  NotificationTypeDto.jobDeleted: 'JOB_DELETED',
  NotificationTypeDto.jobApplicationStatusChanged:
      'JOB_APPLICATION_STATUS_CHANGED',
  NotificationTypeDto.programPublished: 'PROGRAM_PUBLISHED',
  NotificationTypeDto.programUpdated: 'PROGRAM_UPDATED',
  NotificationTypeDto.programClosed: 'PROGRAM_CLOSED',
  NotificationTypeDto.programDeleted: 'PROGRAM_DELETED',
  NotificationTypeDto.programApplicationApplied: 'PROGRAM_APPLICATION_APPLIED',
  NotificationTypeDto.programApplicationCanceled:
      'PROGRAM_APPLICATION_CANCELED',
  NotificationTypeDto.programVacancyAvailable: 'PROGRAM_VACANCY_AVAILABLE',
  NotificationTypeDto.inquiryAnswered: 'INQUIRY_ANSWERED',
  NotificationTypeDto.memberApprovalResult: 'MEMBER_APPROVAL_RESULT',
  NotificationTypeDto.system: 'SYSTEM',
  NotificationTypeDto.unknown: '__UNKNOWN__',
};

const _$NotificationTargetTypeDtoEnumMap = {
  NotificationTargetTypeDto.job: 'JOB',
  NotificationTargetTypeDto.jobApplication: 'JOB_APPLICATION',
  NotificationTargetTypeDto.program: 'PROGRAM',
  NotificationTargetTypeDto.portfolioRequest: 'PORTFOLIO_REQUEST',
  NotificationTargetTypeDto.inquiry: 'INQUIRY',
  NotificationTargetTypeDto.memberApproval: 'MEMBER_APPROVAL',
  NotificationTargetTypeDto.unknown: '__UNKNOWN__',
};

const _$NotificationUnavailableReasonDtoEnumMap = {
  NotificationUnavailableReasonDto.deleted: 'DELETED',
  NotificationUnavailableReasonDto.notVisible: 'NOT_VISIBLE',
  NotificationUnavailableReasonDto.forbidden: 'FORBIDDEN',
  NotificationUnavailableReasonDto.unknown: '__UNKNOWN__',
};

_NotificationResponseMetaDto _$NotificationResponseMetaDtoFromJson(
  Map<String, dynamic> json,
) => _NotificationResponseMetaDto(requestId: json['requestId'] as String?);

Map<String, dynamic> _$NotificationResponseMetaDtoToJson(
  _NotificationResponseMetaDto instance,
) => <String, dynamic>{'requestId': instance.requestId};
