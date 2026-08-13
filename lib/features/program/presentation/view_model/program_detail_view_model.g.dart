// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(programApplicationOutcome)
final programApplicationOutcomeProvider = ProgramApplicationOutcomeProvider._();

final class ProgramApplicationOutcomeProvider
    extends
        $FunctionalProvider<
          ProgramApplicationOutcome,
          ProgramApplicationOutcome,
          ProgramApplicationOutcome
        >
    with $Provider<ProgramApplicationOutcome> {
  ProgramApplicationOutcomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'programApplicationOutcomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$programApplicationOutcomeHash();

  @$internal
  @override
  $ProviderElement<ProgramApplicationOutcome> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProgramApplicationOutcome create(Ref ref) {
    return programApplicationOutcome(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgramApplicationOutcome value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgramApplicationOutcome>(value),
    );
  }
}

String _$programApplicationOutcomeHash() =>
    r'02c8a35e5f81e8223b8a61c126296c6d5fc28802';

@ProviderFor(ProgramDetailViewModel)
final programDetailViewModelProvider = ProgramDetailViewModelFamily._();

final class ProgramDetailViewModelProvider
    extends $NotifierProvider<ProgramDetailViewModel, ProgramDetailViewState> {
  ProgramDetailViewModelProvider._({
    required ProgramDetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'programDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$programDetailViewModelHash();

  @override
  String toString() {
    return r'programDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProgramDetailViewModel create() => ProgramDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgramDetailViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgramDetailViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProgramDetailViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$programDetailViewModelHash() =>
    r'15a855aabd17e160b5f770021ae56ce514384ec8';

final class ProgramDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProgramDetailViewModel,
          ProgramDetailViewState,
          ProgramDetailViewState,
          ProgramDetailViewState,
          String
        > {
  ProgramDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'programDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProgramDetailViewModelProvider call(String programId) =>
      ProgramDetailViewModelProvider._(argument: programId, from: this);

  @override
  String toString() => r'programDetailViewModelProvider';
}

abstract class _$ProgramDetailViewModel
    extends $Notifier<ProgramDetailViewState> {
  late final _$args = ref.$arg as String;
  String get programId => _$args;

  ProgramDetailViewState build(String programId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ProgramDetailViewState, ProgramDetailViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProgramDetailViewState, ProgramDetailViewState>,
              ProgramDetailViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
