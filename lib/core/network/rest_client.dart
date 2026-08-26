import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:geti_app/features/auth/data/dto/authorize_response.dart';
import 'package:geti_app/features/auth/data/dto/oauth_login_response.dart';
import 'package:geti_app/features/auth/data/dto/session_response.dart';
import 'package:geti_app/features/auth/data/dto/token_refresh_response.dart';
import 'package:geti_app/features/job/data/dto/ai_reanalysis_response.dart';
import 'package:geti_app/features/job/data/dto/job_detail_response.dart';
import 'package:geti_app/features/job/data/dto/job_search_response.dart';
import 'package:geti_app/features/job/data/dto/job_source_response.dart';
import 'package:geti_app/features/job/data/dto/recommendation_job_response.dart';
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

  /// 공고 목록을 검색·필터링합니다.
  @GET('/api/v1/jobs')
  Future<ApiResponseJobSearchResponse> getJobs({
    @Query('query') String? query,
    @Query('postingType') String? postingType,
    @Query('applicationMethod') String? applicationMethod,
    @Query('sourceName') String? sourceName,
    @Query('sort') String? sort,
    @Query('direction') String? direction,
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });

  /// 공고 상세를 조회합니다(조회할 때마다 서버가 조회수를 증가시킵니다).
  @GET('/api/v1/jobs/{jobId}')
  Future<ApiResponseJobDetailResponse> getJobDetail(@Path('jobId') int jobId);

  /// 공고 출처(수집 채널) 목록을 조회합니다.
  @GET('/api/v1/job-sources')
  Future<ApiResponsePublicJobSourceListResponse> getJobSources({
    @Query('activeOnly') bool activeOnly = false,
  });

  /// 공고를 북마크에 등록합니다.
  @POST('/api/v1/me/bookmarks')
  Future<ApiResponseRecommendationJobResponse> addBookmark(
    @Body() Map<String, Object?> body,
  );

  /// 공고 북마크를 해제합니다(성공 시 204, Body 없음).
  @DELETE('/api/v1/me/bookmarks/{jobId}')
  Future<HttpResponse<dynamic>> removeBookmark(@Path('jobId') int jobId);

  /// 내가 북마크한 공고 목록을 조회합니다.
  @GET('/api/v1/me/job-bookmarks')
  Future<ApiResponseRecommendationJobListResponse> getJobBookmarks({
    @Query('query') String? query,
    @Query('postingType') String? postingType,
    @Query('sort') String? sort,
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });

  /// 공고 AI 분석을 다시 요청합니다(최대 횟수는 서버가 판단합니다).
  @POST('/api/v1/jobs/{jobId}/ai-reanalysis')
  Future<ApiResponseAiReanalysisResponse> requestAiReanalysis(
    @Path('jobId') int jobId,
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
