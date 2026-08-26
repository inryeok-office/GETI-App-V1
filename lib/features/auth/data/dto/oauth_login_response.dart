import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'oauth_login_response.freezed.dart';
part 'oauth_login_response.g.dart';

@freezed
abstract class OAuthLoginResponse with _$OAuthLoginResponse {
  const factory OAuthLoginResponse({
    required String accessToken,
    required String refreshToken,
    required int accessTokenExpiresInSeconds,
    required int memberId,
    @Default([]) List<String> roles,
    String? status,
    @Default(false) bool newMember,
  }) = _OAuthLoginResponse;

  factory OAuthLoginResponse.fromJson(Map<String, Object?> json) =>
      _$OAuthLoginResponseFromJson(json);
}

@freezed
abstract class ApiResponseOAuthLoginResponse
    with _$ApiResponseOAuthLoginResponse {
  const factory ApiResponseOAuthLoginResponse({
    required bool success,
    OAuthLoginResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseOAuthLoginResponse;

  factory ApiResponseOAuthLoginResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseOAuthLoginResponseFromJson(json);
}
