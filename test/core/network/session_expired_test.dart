import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:geti_app/core/network/session_provider.dart';
import 'package:geti_app/core/storage/auth_token_storage.dart';

class _FakeAuthTokenStorage implements AuthTokenStorage {
  String? accessToken = 'old-access';
  String? refreshToken = 'valid-refresh';

  @override
  Future<String?> readAccessToken() async => accessToken;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    accessToken = tokens.accessToken;
    refreshToken = tokens.refreshToken;
  }

  @override
  Future<void> clear() async {
    accessToken = null;
    refreshToken = null;
  }
}

class _RefreshThenSucceedAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.contains('/auth/token/refresh')) {
      return ResponseBody.fromString(
        '{"success":true,"data":{"accessToken":"new-access",'
        '"refreshToken":"new-refresh","accessTokenExpiresInSeconds":3600}}',
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    if (options.headers['Authorization'] == 'Bearer new-access') {
      return ResponseBody.fromString(
        '{"ok":true}',
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    return ResponseBody.fromString('{}', 401);
  }

  @override
  void close({bool force = false}) {}
}

class _UnauthorizedAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString('{}', 401);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('SessionExpired notifier는 notifyExpired/acknowledge로 상태를 전환한다', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(sessionExpiredProvider), isFalse);

    container.read(sessionExpiredProvider.notifier).notifyExpired();
    expect(container.read(sessionExpiredProvider), isTrue);

    container.read(sessionExpiredProvider.notifier).acknowledge();
    expect(container.read(sessionExpiredProvider), isFalse);
  });

  test('dio가 401 응답을 받으면 SessionExpired 상태가 true로 바뀐다', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);
    dio.httpClientAdapter = _UnauthorizedAdapter();

    expect(container.read(sessionExpiredProvider), isFalse);

    await expectLater(dio.get<void>('/anything'), throwsA(isA<DioException>()));

    expect(container.read(sessionExpiredProvider), isTrue);
  });

  test('401 응답 후 Refresh에 성공하면 새 토큰으로 원래 요청을 재시도한다', () async {
    final tokenStorage = _FakeAuthTokenStorage();
    final container = ProviderContainer(
      overrides: [authTokenStorageProvider.overrideWithValue(tokenStorage)],
    );
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);
    dio.httpClientAdapter = _RefreshThenSucceedAdapter();

    final response = await dio.get<Map<String, Object?>>('/anything');

    expect(response.statusCode, 200);
    expect(response.data, {'ok': true});
    expect(container.read(sessionExpiredProvider), isFalse);
    expect(tokenStorage.accessToken, 'new-access');
    expect(tokenStorage.refreshToken, 'new-refresh');
  });

  test('401이 아닌 오류는 SessionExpired 상태를 바꾸지 않는다', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);
    dio.httpClientAdapter = _ForbiddenAdapter();

    await expectLater(dio.get<void>('/anything'), throwsA(isA<DioException>()));

    expect(container.read(sessionExpiredProvider), isFalse);
  });
}

class _ForbiddenAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString('{}', 403);
  }

  @override
  void close({bool force = false}) {}
}
