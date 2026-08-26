import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'token_refresh_response.freezed.dart';
part 'token_refresh_response.g.dart';

@freezed
abstract class TokenRefreshResponse with _$TokenRefreshResponse {
  const factory TokenRefreshResponse({
    required String accessToken,
    required String refreshToken,
    required int accessTokenExpiresInSeconds,
  }) = _TokenRefreshResponse;

  factory TokenRefreshResponse.fromJson(Map<String, Object?> json) =>
      _$TokenRefreshResponseFromJson(json);
}

@freezed
abstract class ApiResponseTokenRefreshResponse
    with _$ApiResponseTokenRefreshResponse {
  const factory ApiResponseTokenRefreshResponse({
    required bool success,
    TokenRefreshResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseTokenRefreshResponse;

  factory ApiResponseTokenRefreshResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseTokenRefreshResponseFromJson(json);
}
