import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final config = ref.watch(appConfigProvider);
  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
  );

  if (config.hasApiBaseUrl) {
    options.baseUrl = config.apiBaseUrl;
  }

  final client = Dio(options);
  ref.onDispose(() => client.close(force: true));
  return client;
}
