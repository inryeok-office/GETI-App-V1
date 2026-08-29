import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_list_response_dto.freezed.dart';
part 'notification_list_response_dto.g.dart';

@Freezed(copyWith: false)
abstract class NotificationListApiResponseDto
    with _$NotificationListApiResponseDto {
  const factory NotificationListApiResponseDto({
    bool? success,
    NotificationListResponseDto? data,
    NotificationResponseMetaDto? meta,
  }) = _NotificationListApiResponseDto;

  factory NotificationListApiResponseDto.fromJson(Map<String, Object?> json) =>
      _$NotificationListApiResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class NotificationListResponseDto with _$NotificationListResponseDto {
  const factory NotificationListResponseDto({
    @Default(<NotificationSummaryResponseDto>[])
    List<NotificationSummaryResponseDto> content,
    int? page,
    int? size,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
    int? unreadCount,
  }) = _NotificationListResponseDto;

  factory NotificationListResponseDto.fromJson(Map<String, Object?> json) =>
      _$NotificationListResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class NotificationSummaryResponseDto
    with _$NotificationSummaryResponseDto {
  const factory NotificationSummaryResponseDto({
    int? notificationId,
    @JsonKey(unknownEnumValue: NotificationTypeDto.unknown)
    NotificationTypeDto? notificationType,
    String? title,
    String? content,
    @JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown)
    NotificationTargetTypeDto? targetType,
    int? targetId,
    bool? targetAvailable,
    @JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown)
    NotificationUnavailableReasonDto? targetUnavailableReason,
    String? deepLink,
    @JsonKey(name: 'read') bool? isRead,
    DateTime? readAt,
    DateTime? createdAt,
  }) = _NotificationSummaryResponseDto;

  factory NotificationSummaryResponseDto.fromJson(Map<String, Object?> json) =>
      _$NotificationSummaryResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class NotificationResponseMetaDto with _$NotificationResponseMetaDto {
  const factory NotificationResponseMetaDto({String? requestId}) =
      _NotificationResponseMetaDto;

  factory NotificationResponseMetaDto.fromJson(Map<String, Object?> json) =>
      _$NotificationResponseMetaDtoFromJson(json);
}

enum NotificationTypeDto {
  @JsonValue('JOB_PUBLISHED')
  jobPublished,
  @JsonValue('JOB_UPDATED')
  jobUpdated,
  @JsonValue('JOB_CLOSED')
  jobClosed,
  @JsonValue('JOB_DELETED')
  jobDeleted,
  @JsonValue('JOB_APPLICATION_STATUS_CHANGED')
  jobApplicationStatusChanged,
  @JsonValue('PROGRAM_PUBLISHED')
  programPublished,
  @JsonValue('PROGRAM_UPDATED')
  programUpdated,
  @JsonValue('PROGRAM_CLOSED')
  programClosed,
  @JsonValue('PROGRAM_DELETED')
  programDeleted,
  @JsonValue('PROGRAM_APPLICATION_APPLIED')
  programApplicationApplied,
  @JsonValue('PROGRAM_APPLICATION_CANCELED')
  programApplicationCanceled,
  @JsonValue('PROGRAM_VACANCY_AVAILABLE')
  programVacancyAvailable,
  @JsonValue('INQUIRY_ANSWERED')
  inquiryAnswered,
  @JsonValue('MEMBER_APPROVAL_RESULT')
  memberApprovalResult,
  @JsonValue('SYSTEM')
  system,
  @JsonValue('__UNKNOWN__')
  unknown,
}

enum NotificationTargetTypeDto {
  @JsonValue('JOB')
  job,
  @JsonValue('JOB_APPLICATION')
  jobApplication,
  @JsonValue('PROGRAM')
  program,
  @JsonValue('PORTFOLIO_REQUEST')
  portfolioRequest,
  @JsonValue('INQUIRY')
  inquiry,
  @JsonValue('MEMBER_APPROVAL')
  memberApproval,
  @JsonValue('__UNKNOWN__')
  unknown,
}

enum NotificationUnavailableReasonDto {
  @JsonValue('DELETED')
  deleted,
  @JsonValue('NOT_VISIBLE')
  notVisible,
  @JsonValue('FORBIDDEN')
  forbidden,
  @JsonValue('__UNKNOWN__')
  unknown,
}
