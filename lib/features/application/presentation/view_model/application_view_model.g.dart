// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApplicationViewModel)
final applicationViewModelProvider = ApplicationViewModelProvider._();

final class ApplicationViewModelProvider
    extends $NotifierProvider<ApplicationViewModel, ApplicationViewState> {
  ApplicationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationViewModelHash();

  @$internal
  @override
  ApplicationViewModel create() => ApplicationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApplicationViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApplicationViewState>(value),
    );
  }
}

String _$applicationViewModelHash() =>
    r'b673bc20dbde7241924060fb8a7ac95a15e644a5';

abstract class _$ApplicationViewModel extends $Notifier<ApplicationViewState> {
  ApplicationViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ApplicationViewState, ApplicationViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ApplicationViewState, ApplicationViewState>,
              ApplicationViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
