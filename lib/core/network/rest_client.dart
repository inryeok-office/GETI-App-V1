import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:geti_app/features/notification/data/dto/notification_list_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/api/v1/notifications')
  Future<NotificationListApiResponseDto> getNotifications({
    @Query('unreadOnly') bool unreadOnly = false,
    @Query('notificationType') String? notificationType,
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
