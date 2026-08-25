// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OAuthLoginResponse _$OAuthLoginResponseFromJson(Map<String, dynamic> json) =>
    _OAuthLoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiresInSeconds: (json['accessTokenExpiresInSeconds'] as num)
          .toInt(),
      memberId: (json['memberId'] as num).toInt(),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      status: json['status'] as String?,
      newMember: json['newMember'] as bool? ?? false,
    );

Map<String, dynamic> _$OAuthLoginResponseToJson(_OAuthLoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiresInSeconds': instance.accessTokenExpiresInSeconds,
      'memberId': instance.memberId,
      'roles': instance.roles,
      'status': instance.status,
      'newMember': instance.newMember,
    };

_ApiResponseOAuthLoginResponse _$ApiResponseOAuthLoginResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseOAuthLoginResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : OAuthLoginResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseOAuthLoginResponseToJson(
  _ApiResponseOAuthLoginResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
