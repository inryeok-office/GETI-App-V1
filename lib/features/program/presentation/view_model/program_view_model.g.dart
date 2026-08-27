// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProgramViewModel)
final programViewModelProvider = ProgramViewModelProvider._();

final class ProgramViewModelProvider
    extends $NotifierProvider<ProgramViewModel, ProgramViewState> {
  ProgramViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'programViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$programViewModelHash();

  @$internal
  @override
  ProgramViewModel create() => ProgramViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgramViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgramViewState>(value),
    );
  }
}

String _$programViewModelHash() => r'fdbde87a0dbf498cd0090037d08942122d9b5ccc';

abstract class _$ProgramViewModel extends $Notifier<ProgramViewState> {
  ProgramViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProgramViewState, ProgramViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProgramViewState, ProgramViewState>,
              ProgramViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
