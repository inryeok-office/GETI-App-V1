// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApplicationDetailViewModel)
final applicationDetailViewModelProvider = ApplicationDetailViewModelFamily._();

final class ApplicationDetailViewModelProvider
    extends
        $NotifierProvider<
          ApplicationDetailViewModel,
          ApplicationDetailViewState
        > {
  ApplicationDetailViewModelProvider._({
    required ApplicationDetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'applicationDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$applicationDetailViewModelHash();

  @override
  String toString() {
    return r'applicationDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ApplicationDetailViewModel create() => ApplicationDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApplicationDetailViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApplicationDetailViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationDetailViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$applicationDetailViewModelHash() =>
    r'f17ab2ad48d463985179cb848de345c4fec36263';

final class ApplicationDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ApplicationDetailViewModel,
          ApplicationDetailViewState,
          ApplicationDetailViewState,
          ApplicationDetailViewState,
          String
        > {
  ApplicationDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'applicationDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ApplicationDetailViewModelProvider call(String applicationId) =>
      ApplicationDetailViewModelProvider._(argument: applicationId, from: this);

  @override
  String toString() => r'applicationDetailViewModelProvider';
}

abstract class _$ApplicationDetailViewModel
    extends $Notifier<ApplicationDetailViewState> {
  late final _$args = ref.$arg as String;
  String get applicationId => _$args;

  ApplicationDetailViewState build(String applicationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<ApplicationDetailViewState, ApplicationDetailViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ApplicationDetailViewState,
                ApplicationDetailViewState
              >,
              ApplicationDetailViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
