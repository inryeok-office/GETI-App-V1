import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
abstract class ApiFieldError with _$ApiFieldError {
  const factory ApiFieldError({String? field, String? message}) =
      _ApiFieldError;

  factory ApiFieldError.fromJson(Map<String, Object?> json) =>
      _$ApiFieldErrorFromJson(json);
}

/// 공통 에러 응답 Body. `{ success: false, error: {...}, meta: {...} }` 형태의
/// `error` 부분입니다.
@freezed
abstract class ApiErrorBody with _$ApiErrorBody {
  const factory ApiErrorBody({
    required String code,
    required String message,
    @Default([]) List<ApiFieldError> fieldErrors,
  }) = _ApiErrorBody;

  factory ApiErrorBody.fromJson(Map<String, Object?> json) =>
      _$ApiErrorBodyFromJson(json);
}

@freezed
abstract class ResponseMeta with _$ResponseMeta {
  const factory ResponseMeta({String? requestId}) = _ResponseMeta;

  factory ResponseMeta.fromJson(Map<String, Object?> json) =>
      _$ResponseMetaFromJson(json);
}

/// 서버가 `success: false`로 응답했을 때 던지는 예외입니다.
class ApiException implements Exception {
  const ApiException(this.error);

  final ApiErrorBody error;

  @override
  String toString() => 'ApiException(${error.code}: ${error.message})';
}
