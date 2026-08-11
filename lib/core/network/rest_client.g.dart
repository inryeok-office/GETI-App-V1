// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(restClient)
final restClientProvider = RestClientProvider._();

final class RestClientProvider
    extends $FunctionalProvider<RestClient, RestClient, RestClient>
    with $Provider<RestClient> {
  RestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restClientHash();

  @$internal
  @override
  $ProviderElement<RestClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RestClient create(Ref ref) {
    return restClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RestClient>(value),
    );
  }
}

String _$restClientHash() => r'44807d5ac27e90aa756394f356dafb3123be918a';
