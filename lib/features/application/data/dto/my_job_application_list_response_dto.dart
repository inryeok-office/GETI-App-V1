import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_job_application_list_response_dto.freezed.dart';
part 'my_job_application_list_response_dto.g.dart';

@Freezed(copyWith: false)
abstract class MyJobApplicationListApiResponseDto
    with _$MyJobApplicationListApiResponseDto {
  const factory MyJobApplicationListApiResponseDto({
    required bool success,
    required MyJobApplicationListResponseDto data,
    required ApiResponseMetaDto meta,
  }) = _MyJobApplicationListApiResponseDto;

  factory MyJobApplicationListApiResponseDto.fromJson(
    Map<String, Object?> json,
  ) => _$MyJobApplicationListApiResponseDtoFromJson(json);
}

@freezed
abstract class MyJobApplicationListResponseDto
    with _$MyJobApplicationListResponseDto {
  const factory MyJobApplicationListResponseDto({
    required List<MyJobApplicationListItemDto> content,
    required int page,
    required int size,
    required int totalElements,
    required int totalPages,
    required bool first,
    required bool last,
  }) = _MyJobApplicationListResponseDto;

  factory MyJobApplicationListResponseDto.fromJson(Map<String, Object?> json) =>
      _$MyJobApplicationListResponseDtoFromJson(json);
}

@freezed
abstract class MyJobApplicationListItemDto with _$MyJobApplicationListItemDto {
  const factory MyJobApplicationListItemDto({
    required int applicationId,
    required MyJobApplicationJobSummaryDto? job,
    required JobApplicationStatusDto status,
    required DateTime? submittedAt,
    required DateTime updatedAt,
  }) = _MyJobApplicationListItemDto;

  factory MyJobApplicationListItemDto.fromJson(Map<String, Object?> json) =>
      _$MyJobApplicationListItemDtoFromJson(json);
}

@freezed
abstract class MyJobApplicationJobSummaryDto
    with _$MyJobApplicationJobSummaryDto {
  const factory MyJobApplicationJobSummaryDto({
    required int jobId,
    required String title,
    required JobPostingTypeDto postingType,
    required JobApplicationMethodDto applicationMethod,
    required JobPostingStatusDto status,
    required CompanySummaryDto? company,
    required DateTime? endDate,
    required int viewCount,
    required bool bookmarked,
    required List<JobAiSkillAccessDto> techStacks,
    required int bookmarkCount,
  }) = _MyJobApplicationJobSummaryDto;

  factory MyJobApplicationJobSummaryDto.fromJson(Map<String, Object?> json) =>
      _$MyJobApplicationJobSummaryDtoFromJson(json);
}

@freezed
abstract class CompanySummaryDto with _$CompanySummaryDto {
  const factory CompanySummaryDto({
    required int companyId,
    required String name,
    required String? logoUrl,
  }) = _CompanySummaryDto;

  factory CompanySummaryDto.fromJson(Map<String, Object?> json) =>
      _$CompanySummaryDtoFromJson(json);
}

@freezed
abstract class JobAiSkillAccessDto with _$JobAiSkillAccessDto {
  const factory JobAiSkillAccessDto({
    required int? techStackId,
    required String name,
  }) = _JobAiSkillAccessDto;

  factory JobAiSkillAccessDto.fromJson(Map<String, Object?> json) =>
      _$JobAiSkillAccessDtoFromJson(json);
}

@freezed
abstract class ApiResponseMetaDto with _$ApiResponseMetaDto {
  const factory ApiResponseMetaDto({required String? requestId}) =
      _ApiResponseMetaDto;

  factory ApiResponseMetaDto.fromJson(Map<String, Object?> json) =>
      _$ApiResponseMetaDtoFromJson(json);
}

enum JobApplicationStatusDto {
  @JsonValue('DRAFT')
  draft,
  @JsonValue('SUBMITTED')
  submitted,
  @JsonValue('EDIT_REQUESTED')
  editRequested,
  @JsonValue('EDIT_ALLOWED')
  editAllowed,
  @JsonValue('REVISION_REQUESTED')
  revisionRequested,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('FORWARDED')
  forwarded,
  @JsonValue('WITHDRAWN')
  withdrawn,
}

enum JobPostingTypeDto {
  @JsonValue('GENERAL')
  general,
  @JsonValue('MOU')
  mou,
  @JsonValue('SCHOOL')
  school,
}

enum JobApplicationMethodDto {
  @JsonValue('INTERNAL')
  internal,
  @JsonValue('EXTERNAL')
  external,
}

enum JobPostingStatusDto {
  @JsonValue('DRAFT')
  draft,
  @JsonValue('PUBLISHED')
  published,
  @JsonValue('CLOSED')
  closed,
  @JsonValue('DELETED')
  deleted,
}
