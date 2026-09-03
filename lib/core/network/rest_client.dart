import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/api/v1/me/job-recommendations')
  Future<ApiResponseRecommendationListResponse> getMyRecommendations({
    @Query('suitabilityLevel') String? suitabilityLevel,
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });
}

@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) {
  final config = ref.watch(appConfigProvider);
  return RestClient(
    ref.watch(dioProvider),
    baseUrl: config.requireApiBaseUrl(),
  );
}
