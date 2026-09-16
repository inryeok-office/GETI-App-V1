import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/dio_provider.dart';
import 'package:geti_app/core/network/session_provider.dart';

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

  test('401이 아닌 오류는 SessionExpired 상태를 바꾸지 않는다', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);
    dio.httpClientAdapter = _ForbiddenAdapter();

    await expectLater(dio.get<void>('/anything'), throwsA(isA<DioException>()));

    expect(container.read(sessionExpiredProvider), isFalse);
  });

  test('dio 로그는 URI query의 민감 값을 원문으로 출력하지 않는다', () async {
    final logs = <String>[];
    final previousDebugPrint = debugPrint;
    debugPrint = (message, {wrapWidth}) {
      if (message != null) {
        logs.add(message);
      }
    };
    addTearDown(() => debugPrint = previousDebugPrint);

    final container = ProviderContainer();
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);
    dio.httpClientAdapter = _UnauthorizedAdapter();

    await expectLater(
      dio.get<void>(
        '/anything',
        queryParameters: {'token': 'raw-token', 'page': 1},
      ),
      throwsA(isA<DioException>()),
    );

    final output = logs.join('\n');
    expect(output, contains('URL: /anything'));
    expect(output, contains('Query: {token: [REDACTED], page: 1}'));
    expect(output, isNot(contains('raw-token')));
    expect(output, isNot(contains('token=raw-token')));
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
