import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/features/application/data/dto/my_job_application_list_response_dto.dart';

part 'job_application_detail_response_dto.freezed.dart';
part 'job_application_detail_response_dto.g.dart';

@Freezed(copyWith: false)
abstract class JobApplicationDetailApiResponseDto
    with _$JobApplicationDetailApiResponseDto {
  const factory JobApplicationDetailApiResponseDto({
    bool? success,
    JobApplicationDetailResponseDto? data,
    ApiResponseMetaDto? meta,
  }) = _JobApplicationDetailApiResponseDto;

  factory JobApplicationDetailApiResponseDto.fromJson(
    Map<String, Object?> json,
  ) => _$JobApplicationDetailApiResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class JobApplicationDetailResponseDto
    with _$JobApplicationDetailResponseDto {
  const factory JobApplicationDetailResponseDto({
    int? applicationId,
    int? jobId,
    String? jobTitle,
    String? companyName,
    int? managerMemberId,
    String? managerName,
    int? formId,
    int? formVersion,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    JobApplicationStatusDto? status,
    String? statusReason,
    String? contactEmail,
    String? contactPhone,
    bool? privacyConsent,
    String? applicantName,
    int? applicantCohort,
    String? applicantDepartment,
    @Default(<String>[]) List<String> applicantMajors,
    String? applicantDesiredJob,
    @Default(<String>[]) List<String> applicantTechStacks,
    @Default(<ApplicationAnswerDto>[]) List<ApplicationAnswerDto> answers,
    @Default(<JobApplicationFileResponseDto>[])
    List<JobApplicationFileResponseDto> files,
    DateTime? submittedAt,
    DateTime? withdrawnAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(<String>[]) List<String> availableActions,
    @Default(<FormFieldResponseDto>[]) List<FormFieldResponseDto> questions,
  }) = _JobApplicationDetailResponseDto;

  factory JobApplicationDetailResponseDto.fromJson(Map<String, Object?> json) =>
      _$JobApplicationDetailResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class ApplicationAnswerDto with _$ApplicationAnswerDto {
  const factory ApplicationAnswerDto({
    String? fieldId,
    Object? value,
    List<int>? fileIds,
  }) = _ApplicationAnswerDto;

  factory ApplicationAnswerDto.fromJson(Map<String, Object?> json) =>
      _$ApplicationAnswerDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class JobApplicationFileResponseDto
    with _$JobApplicationFileResponseDto {
  const factory JobApplicationFileResponseDto({
    int? fileId,
    String? originalName,
    String? contentType,
    int? size,
    String? downloadUrl,
  }) = _JobApplicationFileResponseDto;

  factory JobApplicationFileResponseDto.fromJson(Map<String, Object?> json) =>
      _$JobApplicationFileResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class FormFieldResponseDto with _$FormFieldResponseDto {
  const factory FormFieldResponseDto({
    String? fieldId,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    FormFieldTypeDto? type,
    String? title,
    String? description,
    @JsonKey(name: 'required') bool? isRequired,
    int? order,
    List<String>? options,
    Object? filePolicy,
  }) = _FormFieldResponseDto;

  factory FormFieldResponseDto.fromJson(Map<String, Object?> json) =>
      _$FormFieldResponseDtoFromJson(json);
}

enum FormFieldTypeDto {
  @JsonValue('TEXT')
  text,
  @JsonValue('TEXTAREA')
  textarea,
  @JsonValue('SINGLE_SELECT')
  singleSelect,
  @JsonValue('MULTI_SELECT')
  multiSelect,
  @JsonValue('FILE')
  file,
}
