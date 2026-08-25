// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    _SessionResponse(
      memberId: (json['memberId'] as num).toInt(),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$SessionResponseToJson(_SessionResponse instance) =>
    <String, dynamic>{'memberId': instance.memberId, 'roles': instance.roles};

_ApiResponseSessionResponse _$ApiResponseSessionResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseSessionResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : SessionResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseSessionResponseToJson(
  _ApiResponseSessionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
