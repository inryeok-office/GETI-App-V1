import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

const _apiBaseUrl = String.fromEnvironment('API_BASE_URL');

@freezed
abstract class AppConfig with _$AppConfig {
  const AppConfig._();

  const factory AppConfig({required String apiBaseUrl}) = _AppConfig;

  factory AppConfig.fromJson(Map<String, Object?> json) =>
      _$AppConfigFromJson(json);

  bool get hasApiBaseUrl => apiBaseUrl.trim().isNotEmpty;

  String requireApiBaseUrl() {
    if (!hasApiBaseUrl) {
      throw StateError(
        'API_BASE_URL이 설정되지 않았습니다. '
        '--dart-define=API_BASE_URL=https://example.com 형식으로 전달해 주세요.',
      );
    }

    return apiBaseUrl;
  }
}

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  return const AppConfig(apiBaseUrl: _apiBaseUrl);
}
