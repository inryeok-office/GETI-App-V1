// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_reanalysis_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiReanalysisResponse _$AiReanalysisResponseFromJson(
  Map<String, dynamic> json,
) => _AiReanalysisResponse(
  jobId: (json['jobId'] as num).toInt(),
  status: json['status'] as String,
  reanalysisCount: (json['reanalysisCount'] as num?)?.toInt() ?? 0,
  remainingReanalysisCount:
      (json['remainingReanalysisCount'] as num?)?.toInt() ?? 0,
  canReanalyze: json['canReanalyze'] as bool? ?? false,
  requestedAt: json['requestedAt'] as String,
  reanalysis: json['reanalysis'] as bool? ?? false,
);

Map<String, dynamic> _$AiReanalysisResponseToJson(
  _AiReanalysisResponse instance,
) => <String, dynamic>{
  'jobId': instance.jobId,
  'status': instance.status,
  'reanalysisCount': instance.reanalysisCount,
  'remainingReanalysisCount': instance.remainingReanalysisCount,
  'canReanalyze': instance.canReanalyze,
  'requestedAt': instance.requestedAt,
  'reanalysis': instance.reanalysis,
};

_ApiResponseAiReanalysisResponse _$ApiResponseAiReanalysisResponseFromJson(
  Map<String, dynamic> json,
) => _ApiResponseAiReanalysisResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : AiReanalysisResponse.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : ApiErrorBody.fromJson(json['error'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseAiReanalysisResponseToJson(
  _ApiResponseAiReanalysisResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
  'meta': instance.meta,
};
