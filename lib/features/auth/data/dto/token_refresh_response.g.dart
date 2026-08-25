// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenRefreshResponse _$TokenRefreshResponseFromJson(
  Map<String, dynamic> json,
) => _TokenRefreshResponse(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  accessTokenExpiresInSeconds: (json['accessTokenExpiresInSeconds'] as num)
      .toInt(),
);

Map<String, dynamic> _$TokenRefreshResponseToJson(
  _TokenRefreshResponse instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'accessTokenExpiresInSeconds': instance.accessTokenExpiresInSeconds,
};

_ApiResponseTokenRefreshResponse _$ApiResponseTokenRefreshResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseTokenRefreshResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : TokenRefreshResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseTokenRefreshResponseToJson(
  _ApiResponseTokenRefreshResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
