import 'package:dio/dio.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/session_provider.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';
import 'package:geti_app/features/auth/data/dto/token_refresh_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

/// OAuth 인가/콜백처럼 로그인 자체를 시도하는 공개 요청입니다. 이런 요청의
/// 401은 "기존 로그인 세션 만료"가 아니라 로그인 실패이므로, Refresh
/// 시도나 전역 세션 만료 처리 대상에서 제외합니다.
bool _isPublicAuthRequest(String path) =>
    path.startsWith('/api/v1/auth/') &&
    (path.endsWith('/authorize') || path.contains('/callback'));

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
  final tokenStorage = ref.watch(authTokenStorageProvider);

  // 동시에 여러 요청이 401을 받아도 Refresh는 한 번만 수행하도록
  // 진행 중인 Future를 공유합니다.
  Future<String?>? refreshInFlight;

  Future<String?> refreshAccessToken() {
    return refreshInFlight ??= Future(() async {
      try {
        final refreshToken = await tokenStorage.readRefreshToken();
        if (refreshToken == null) return null;

        // extra['isTokenRefresh']로 표시해 onRequest/onError가 Authorization
        // 헤더 추가와 401 재시도 로직을 이 요청에는 적용하지 않도록 합니다.
        final response = await client.post<Map<String, Object?>>(
          '/api/v1/auth/token/refresh',
          options: Options(
            headers: {'X-Refresh-Token': refreshToken},
            extra: {'isTokenRefresh': true},
          ),
        );
        final body = ApiResponseTokenRefreshResponse.fromJson(
          response.data ?? const {},
        );
        final data = body.data;
        if (!body.success || data == null) return null;

        await tokenStorage.saveTokens(
          AuthTokens(
            accessToken: data.accessToken,
            refreshToken: data.refreshToken,
          ),
        );
        return data.accessToken;
      } catch (_) {
        return null;
      } finally {
        refreshInFlight = null;
      }
    });
  }

  client.interceptors.add(
    InterceptorsWrapper(
      onRequest: (requestOptions, handler) async {
        if (requestOptions.extra['isTokenRefresh'] != true) {
          try {
            final accessToken = await tokenStorage.readAccessToken();
            if (accessToken != null) {
              requestOptions.headers['Authorization'] = 'Bearer $accessToken';
            }
          } catch (_) {
            // 토큰을 읽지 못해도 요청 자체는 계속 진행합니다(인증 없이 호출됨).
          }
        }
        handler.next(requestOptions);
      },
      onError: (error, handler) async {
        final isUnauthorized = error.response?.statusCode == 401;
        final alreadyRetried = error.requestOptions.extra['retried'] == true;
        final isTokenRefresh =
            error.requestOptions.extra['isTokenRefresh'] == true;
        final isPublicAuthRequest = _isPublicAuthRequest(
          error.requestOptions.path,
        );

        if (isUnauthorized &&
            !alreadyRetried &&
            !isTokenRefresh &&
            !isPublicAuthRequest) {
          final newAccessToken = await refreshAccessToken();
          if (newAccessToken != null) {
            final retryOptions = error.requestOptions
              ..headers['Authorization'] = 'Bearer $newAccessToken'
              ..extra['retried'] = true;
            try {
              final response = await client.fetch<dynamic>(retryOptions);
              handler.resolve(response);
              return;
            } catch (_) {
              // 재시도도 실패하면 아래에서 세션 만료로 처리합니다.
            }
          }
          try {
            await tokenStorage.clear();
          } catch (_) {
            // 지우기에 실패해도 세션 만료 처리는 계속 진행합니다.
          }
          ref.read(sessionExpiredProvider.notifier).notifyExpired();
        }

        handler.next(error);
      },
    ),
  );
  ref.onDispose(() => client.close(force: true));
  return client;
}
