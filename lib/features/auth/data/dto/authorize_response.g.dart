// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthorizeResponse _$AuthorizeResponseFromJson(Map<String, dynamic> json) =>
    _AuthorizeResponse(
      authorizationUrl: json['authorizationUrl'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$AuthorizeResponseToJson(_AuthorizeResponse instance) =>
    <String, dynamic>{
      'authorizationUrl': instance.authorizationUrl,
      'state': instance.state,
    };

_ApiResponseAuthorizeResponse _$ApiResponseAuthorizeResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseAuthorizeResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : AuthorizeResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseAuthorizeResponseToJson(
  _ApiResponseAuthorizeResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
