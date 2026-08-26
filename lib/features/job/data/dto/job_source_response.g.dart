// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_source_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicJobSourceResponse _$PublicJobSourceResponseFromJson(
  Map<String, dynamic> json,
) => _PublicJobSourceResponse(
  sourceId: (json['sourceId'] as num).toInt(),
  sourceCode: json['sourceCode'] as String,
  name: json['name'] as String,
  sourceType: json['sourceType'] as String,
  active: json['active'] as bool,
);

Map<String, dynamic> _$PublicJobSourceResponseToJson(
  _PublicJobSourceResponse instance,
) => <String, dynamic>{
  'sourceId': instance.sourceId,
  'sourceCode': instance.sourceCode,
  'name': instance.name,
  'sourceType': instance.sourceType,
  'active': instance.active,
};

_PublicJobSourceListResponse _$PublicJobSourceListResponseFromJson(
  Map<String, dynamic> json,
) => _PublicJobSourceListResponse(
  sources:
      (json['sources'] as List<dynamic>?)
          ?.map(
            (e) => PublicJobSourceResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$PublicJobSourceListResponseToJson(
  _PublicJobSourceListResponse instance,
) => <String, dynamic>{'sources': instance.sources};

_ApiResponsePublicJobSourceListResponse
_$ApiResponsePublicJobSourceListResponseFromJson(Map<String, dynamic> json) =>
    _ApiResponsePublicJobSourceListResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : PublicJobSourceListResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      error: json['error'] == null
          ? null
          : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponsePublicJobSourceListResponseToJson(
  _ApiResponsePublicJobSourceListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
