// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 세션 만료(401) 감지 상태입니다. dio 인터셉터가 감지 시 [notifyExpired]를
/// 호출하고, 앱 최상단에서 이 상태를 구독해 재로그인 화면으로 이동합니다.

@ProviderFor(SessionExpired)
final sessionExpiredProvider = SessionExpiredProvider._();

/// 세션 만료(401) 감지 상태입니다. dio 인터셉터가 감지 시 [notifyExpired]를
/// 호출하고, 앱 최상단에서 이 상태를 구독해 재로그인 화면으로 이동합니다.
final class SessionExpiredProvider
    extends $NotifierProvider<SessionExpired, bool> {
  /// 세션 만료(401) 감지 상태입니다. dio 인터셉터가 감지 시 [notifyExpired]를
  /// 호출하고, 앱 최상단에서 이 상태를 구독해 재로그인 화면으로 이동합니다.
  SessionExpiredProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionExpiredProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionExpiredHash();

  @$internal
  @override
  SessionExpired create() => SessionExpired();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$sessionExpiredHash() => r'1c700a259348091b865e28c7dc780e8cefa8dfc6';

/// 세션 만료(401) 감지 상태입니다. dio 인터셉터가 감지 시 [notifyExpired]를
/// 호출하고, 앱 최상단에서 이 상태를 구독해 재로그인 화면으로 이동합니다.

abstract class _$SessionExpired extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
