import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geti_app/core/network/api_error.dart';

part 'job_source_response.freezed.dart';
part 'job_source_response.g.dart';

@freezed
abstract class PublicJobSourceResponse with _$PublicJobSourceResponse {
  const factory PublicJobSourceResponse({
    required int sourceId,
    required String sourceCode,
    required String name,
    required String sourceType,
    required bool active,
  }) = _PublicJobSourceResponse;

  factory PublicJobSourceResponse.fromJson(Map<String, Object?> json) =>
      _$PublicJobSourceResponseFromJson(json);
}

@freezed
abstract class PublicJobSourceListResponse with _$PublicJobSourceListResponse {
  const factory PublicJobSourceListResponse({
    @Default([]) List<PublicJobSourceResponse> sources,
  }) = _PublicJobSourceListResponse;

  factory PublicJobSourceListResponse.fromJson(Map<String, Object?> json) =>
      _$PublicJobSourceListResponseFromJson(json);
}

@freezed
abstract class ApiResponsePublicJobSourceListResponse
    with _$ApiResponsePublicJobSourceListResponse {
  const factory ApiResponsePublicJobSourceListResponse({
    required bool success,
    PublicJobSourceListResponse? data,
    ApiErrorBody? error,
    ResponseMeta? meta,
  }) = _ApiResponsePublicJobSourceListResponse;

  factory ApiResponsePublicJobSourceListResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponsePublicJobSourceListResponseFromJson(json);
}
