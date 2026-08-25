// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiFieldError _$ApiFieldErrorFromJson(Map<String, dynamic> json) =>
    _ApiFieldError(
      field: json['field'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ApiFieldErrorToJson(_ApiFieldError instance) =>
    <String, dynamic>{'field': instance.field, 'message': instance.message};

_ApiErrorBody _$ApiErrorBodyFromJson(Map<String, dynamic> json) =>
    _ApiErrorBody(
      code: json['code'] as String,
      message: json['message'] as String,
      fieldErrors:
          (json['fieldErrors'] as List<dynamic>?)
              ?.map((e) => ApiFieldError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ApiErrorBodyToJson(_ApiErrorBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'fieldErrors': instance.fieldErrors,
    };

_ResponseMeta _$ResponseMetaFromJson(Map<String, dynamic> json) =>
    _ResponseMeta(requestId: json['requestId'] as String?);

Map<String, dynamic> _$ResponseMetaToJson(_ResponseMeta instance) =>
    <String, dynamic>{'requestId': instance.requestId};
