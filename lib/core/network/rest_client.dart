import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:geti_app/features/auth/data/dto/authorize_response.dart';
import 'package:geti_app/features/auth/data/dto/oauth_login_response.dart';
import 'package:geti_app/features/auth/data/dto/session_response.dart';
import 'package:geti_app/features/auth/data/dto/token_refresh_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  /// provider(google/dg)의 OAuth 인가 URL을 발급받습니다.
  @GET('/api/v1/auth/{provider}/authorize')
  Future<ApiResponseAuthorizeResponse> authorize(
    @Path('provider') String provider,
  );

  /// OAuth 콜백(code/state)을 서버에 전달해 로그인을 완료합니다.
  @GET('/api/v1/auth/{provider}/callback')
  Future<ApiResponseOAuthLoginResponse> oauthCallback(
    @Path('provider') String provider,
    @Query('code') String code,
    @Query('state') String state,
  );

  /// Refresh Token으로 Access/Refresh Token을 재발급합니다.
  @POST('/api/v1/auth/token/refresh')
  Future<ApiResponseTokenRefreshResponse> refreshToken(
    @Header('X-Refresh-Token') String refreshToken,
  );

  /// 현재 로그인한 사용자 정보를 확인합니다.
  @GET('/api/v1/auth/session')
  Future<ApiResponseSessionResponse> getSession();

  /// 현재 기기를 로그아웃합니다(성공 시 204, Body 없음).
  @DELETE('/api/v1/auth/logout')
  Future<HttpResponse<dynamic>> logout(
    @Header('X-Refresh-Token') String refreshToken,
  );
}

@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) {
  final config = ref.watch(appConfigProvider);
  return RestClient(
    ref.watch(dioProvider),
    baseUrl: config.requireApiBaseUrl(),
  );
}
