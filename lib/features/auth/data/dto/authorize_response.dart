import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'authorize_response.freezed.dart';
part 'authorize_response.g.dart';

@freezed
abstract class AuthorizeResponse with _$AuthorizeResponse {
  const factory AuthorizeResponse({
    required String authorizationUrl,
    required String state,
  }) = _AuthorizeResponse;

  factory AuthorizeResponse.fromJson(Map<String, Object?> json) =>
      _$AuthorizeResponseFromJson(json);
}

@freezed
abstract class ApiResponseAuthorizeResponse
    with _$ApiResponseAuthorizeResponse {
  const factory ApiResponseAuthorizeResponse({
    required bool success,
    AuthorizeResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseAuthorizeResponse;

  factory ApiResponseAuthorizeResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseAuthorizeResponseFromJson(json);
}
