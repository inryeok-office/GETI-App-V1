import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geti_app/core/config/app_config.dart';
import 'package:geti_app/core/network/session_provider.dart';
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
  if (kDebugMode) {
    client.interceptors.add(_SafeDioLogInterceptor());
  }
  client.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          ref.read(sessionExpiredProvider.notifier).notifyExpired();
        }
        handler.next(error);
      },
    ),
  );
  ref.onDispose(() => client.close(force: true));
  return client;
}

class _SafeDioLogInterceptor extends Interceptor {
  static const _sensitiveHeaderNames = {
    'authorization',
    'cookie',
    'set-cookie',
    'x-access-token',
    'x-refresh-token',
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log(
      '[DIO REQUEST]\n'
      'Method: ${options.method}\n'
      'URL: ${_sanitizeUri(options.uri)}\n'
      'Query: ${_sanitize(options.queryParameters)}\n'
      'Headers: ${_sanitizeHeaders(options.headers)}\n'
      'Body: ${_sanitize(options.data)}',
    );
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _log(
      '[DIO RESPONSE]\n'
      'Status: ${response.statusCode}\n'
      'URL: ${_sanitizeUri(response.requestOptions.uri)}\n'
      'Headers: ${_sanitizeHeaders(response.headers.map)}\n'
      'Response: ${_sanitize(response.data)}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    _log(
      '[DIO ERROR]\n'
      'Method: ${err.requestOptions.method}\n'
      'URL: ${_sanitizeUri(err.requestOptions.uri)}\n'
      'Status: ${response?.statusCode}\n'
      'Query: ${_sanitize(err.requestOptions.queryParameters)}\n'
      'Headers: ${_sanitizeHeaders(err.requestOptions.headers)}\n'
      'Body: ${_sanitize(err.requestOptions.data)}\n'
      'Response: ${_sanitize(response?.data)}\n'
      'Error: ${err.type} ${err.message ?? ''}',
    );
    handler.next(err);
  }

  Map<String, Object?> _sanitizeHeaders(Map<String, dynamic> headers) {
    return headers.map((key, value) {
      final lowerKey = key.toLowerCase();
      final isSensitive =
          _sensitiveHeaderNames.contains(lowerKey) ||
          lowerKey.contains('token') ||
          lowerKey.contains('authorization') ||
          lowerKey.contains('cookie');
      return MapEntry(key, isSensitive ? '[REDACTED]' : _sanitize(value));
    });
  }

  String _sanitizeUri(Uri uri) {
    final value = uri.toString();
    var end = value.length;
    final queryStart = value.indexOf('?');
    if (queryStart != -1 && queryStart < end) {
      end = queryStart;
    }
    final fragmentStart = value.indexOf('#');
    if (fragmentStart != -1 && fragmentStart < end) {
      end = fragmentStart;
    }
    return value.substring(0, end);
  }

  Object? _sanitize(Object? value) {
    return switch (value) {
      Map<dynamic, dynamic>() => value.map((key, nestedValue) {
        final keyText = key.toString();
        final lowerKey = keyText.toLowerCase();
        final isSensitive =
            lowerKey.contains('token') ||
            lowerKey.contains('authorization') ||
            lowerKey.contains('cookie') ||
            lowerKey.contains('password') ||
            lowerKey.contains('secret');
        return MapEntry(
          keyText,
          isSensitive ? '[REDACTED]' : _sanitize(nestedValue),
        );
      }),
      Iterable<dynamic>() => value.map(_sanitize).toList(growable: false),
      _ => value,
    };
  }

  void _log(String message) {
    debugPrint(message);
  }
}
