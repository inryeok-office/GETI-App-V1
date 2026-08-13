// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyDetailViewModel)
final companyDetailViewModelProvider = CompanyDetailViewModelFamily._();

final class CompanyDetailViewModelProvider
    extends $NotifierProvider<CompanyDetailViewModel, CompanyDetailViewState> {
  CompanyDetailViewModelProvider._({
    required CompanyDetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'companyDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$companyDetailViewModelHash();

  @override
  String toString() {
    return r'companyDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CompanyDetailViewModel create() => CompanyDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyDetailViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyDetailViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyDetailViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$companyDetailViewModelHash() =>
    r'd098b2fe57565bc60ec268acc573cf9012ce1716';

final class CompanyDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          CompanyDetailViewModel,
          CompanyDetailViewState,
          CompanyDetailViewState,
          CompanyDetailViewState,
          String
        > {
  CompanyDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'companyDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompanyDetailViewModelProvider call(String companyId) =>
      CompanyDetailViewModelProvider._(argument: companyId, from: this);

  @override
  String toString() => r'companyDetailViewModelProvider';
}

abstract class _$CompanyDetailViewModel
    extends $Notifier<CompanyDetailViewState> {
  late final _$args = ref.$arg as String;
  String get companyId => _$args;

  CompanyDetailViewState build(String companyId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<CompanyDetailViewState, CompanyDetailViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompanyDetailViewState, CompanyDetailViewState>,
              CompanyDetailViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
