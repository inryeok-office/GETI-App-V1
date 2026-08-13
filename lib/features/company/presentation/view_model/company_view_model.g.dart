// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyViewModel)
final companyViewModelProvider = CompanyViewModelProvider._();

final class CompanyViewModelProvider
    extends $NotifierProvider<CompanyViewModel, CompanyViewState> {
  CompanyViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyViewModelHash();

  @$internal
  @override
  CompanyViewModel create() => CompanyViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyViewState>(value),
    );
  }
}

String _$companyViewModelHash() => r'92da4c289f8f7e7134a3448d20692288e43399b6';

abstract class _$CompanyViewModel extends $Notifier<CompanyViewState> {
  CompanyViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CompanyViewState, CompanyViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompanyViewState, CompanyViewState>,
              CompanyViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 기업 상세의 "채용 중인 공고"는 이 목록을 다시 만들지 않고, 채용 공고
/// 기능(jobViewModelProvider)의 jobs를 기업명으로 필터링해 재사용합니다.
/// 목록/상세/기업 상세가 서로 다른 소스로 갈라지지 않도록 합니다.

@ProviderFor(companyActiveJobCount)
final companyActiveJobCountProvider = CompanyActiveJobCountFamily._();

/// 기업 상세의 "채용 중인 공고"는 이 목록을 다시 만들지 않고, 채용 공고
/// 기능(jobViewModelProvider)의 jobs를 기업명으로 필터링해 재사용합니다.
/// 목록/상세/기업 상세가 서로 다른 소스로 갈라지지 않도록 합니다.

final class CompanyActiveJobCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// 기업 상세의 "채용 중인 공고"는 이 목록을 다시 만들지 않고, 채용 공고
  /// 기능(jobViewModelProvider)의 jobs를 기업명으로 필터링해 재사용합니다.
  /// 목록/상세/기업 상세가 서로 다른 소스로 갈라지지 않도록 합니다.
  CompanyActiveJobCountProvider._({
    required CompanyActiveJobCountFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'companyActiveJobCountProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$companyActiveJobCountHash();

  @override
  String toString() {
    return r'companyActiveJobCountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as String;
    return companyActiveJobCount(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyActiveJobCountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$companyActiveJobCountHash() =>
    r'7c1955021de7d87609da412b47beb7c1c8ae2bdc';

/// 기업 상세의 "채용 중인 공고"는 이 목록을 다시 만들지 않고, 채용 공고
/// 기능(jobViewModelProvider)의 jobs를 기업명으로 필터링해 재사용합니다.
/// 목록/상세/기업 상세가 서로 다른 소스로 갈라지지 않도록 합니다.

final class CompanyActiveJobCountFamily extends $Family
    with $FunctionalFamilyOverride<int, String> {
  CompanyActiveJobCountFamily._()
    : super(
        retry: null,
        name: r'companyActiveJobCountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 기업 상세의 "채용 중인 공고"는 이 목록을 다시 만들지 않고, 채용 공고
  /// 기능(jobViewModelProvider)의 jobs를 기업명으로 필터링해 재사용합니다.
  /// 목록/상세/기업 상세가 서로 다른 소스로 갈라지지 않도록 합니다.

  CompanyActiveJobCountProvider call(String companyName) =>
      CompanyActiveJobCountProvider._(argument: companyName, from: this);

  @override
  String toString() => r'companyActiveJobCountProvider';
}
