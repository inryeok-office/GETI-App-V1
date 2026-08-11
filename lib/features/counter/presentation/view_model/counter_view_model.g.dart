// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterViewModel)
final counterViewModelProvider = CounterViewModelProvider._();

final class CounterViewModelProvider
    extends $NotifierProvider<CounterViewModel, int> {
  CounterViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterViewModelHash();

  @$internal
  @override
  CounterViewModel create() => CounterViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$counterViewModelHash() => r'615c0a37c4c85c1758d1ed1ef9787dba4012a209';

abstract class _$CounterViewModel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
