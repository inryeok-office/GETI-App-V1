import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/features/application/data/dto/my_job_application_list_response_dto.dart';

part 'job_application_status_history_response_dto.freezed.dart';
part 'job_application_status_history_response_dto.g.dart';

@Freezed(copyWith: false)
abstract class JobApplicationStatusHistoryApiResponseDto
    with _$JobApplicationStatusHistoryApiResponseDto {
  const factory JobApplicationStatusHistoryApiResponseDto({
    bool? success,
    @Default(<JobApplicationStatusHistoryResponseDto>[])
    List<JobApplicationStatusHistoryResponseDto> data,
    ApiResponseMetaDto? meta,
  }) = _JobApplicationStatusHistoryApiResponseDto;

  factory JobApplicationStatusHistoryApiResponseDto.fromJson(
    Map<String, Object?> json,
  ) => _$JobApplicationStatusHistoryApiResponseDtoFromJson(json);
}

@Freezed(copyWith: false)
abstract class JobApplicationStatusHistoryResponseDto
    with _$JobApplicationStatusHistoryResponseDto {
  const factory JobApplicationStatusHistoryResponseDto({
    int? historyId,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    JobApplicationStatusDto? fromStatus,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    JobApplicationStatusDto? toStatus,
    String? action,
    int? actorMemberId,
    String? reason,
    DateTime? createdAt,
  }) = _JobApplicationStatusHistoryResponseDto;

  factory JobApplicationStatusHistoryResponseDto.fromJson(
    Map<String, Object?> json,
  ) => _$JobApplicationStatusHistoryResponseDtoFromJson(json);
}
