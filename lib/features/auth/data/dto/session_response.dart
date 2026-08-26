import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'session_response.freezed.dart';
part 'session_response.g.dart';

@freezed
abstract class SessionResponse with _$SessionResponse {
  const factory SessionResponse({
    required int memberId,
    @Default([]) List<String> roles,
  }) = _SessionResponse;

  factory SessionResponse.fromJson(Map<String, Object?> json) =>
      _$SessionResponseFromJson(json);
}

@freezed
abstract class ApiResponseSessionResponse with _$ApiResponseSessionResponse {
  const factory ApiResponseSessionResponse({
    required bool success,
    SessionResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseSessionResponse;

  factory ApiResponseSessionResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseSessionResponseFromJson(json);
}
