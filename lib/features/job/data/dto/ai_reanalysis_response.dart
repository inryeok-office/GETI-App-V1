import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'ai_reanalysis_response.freezed.dart';
part 'ai_reanalysis_response.g.dart';

@freezed
abstract class AiReanalysisResponse with _$AiReanalysisResponse {
  const factory AiReanalysisResponse({
    required int jobId,
    required String status,
    @Default(0) int reanalysisCount,
    @Default(0) int remainingReanalysisCount,
    @Default(false) bool canReanalyze,
    required String requestedAt,
    @Default(false) bool reanalysis,
  }) = _AiReanalysisResponse;

  factory AiReanalysisResponse.fromJson(Map<String, Object?> json) =>
      _$AiReanalysisResponseFromJson(json);
}

@freezed
abstract class ApiResponseAiReanalysisResponse
    with _$ApiResponseAiReanalysisResponse {
  const factory ApiResponseAiReanalysisResponse({
    required bool success,
    AiReanalysisResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponseAiReanalysisResponse;

  factory ApiResponseAiReanalysisResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseAiReanalysisResponseFromJson(json);
}
