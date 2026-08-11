import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
}

@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) {
  final config = ref.watch(appConfigProvider);
  return RestClient(
    ref.watch(dioProvider),
    baseUrl: config.requireApiBaseUrl(),
  );
}
