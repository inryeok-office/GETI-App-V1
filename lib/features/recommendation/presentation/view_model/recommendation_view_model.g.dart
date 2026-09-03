// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecommendationViewModel)
final recommendationViewModelProvider = RecommendationViewModelProvider._();

final class RecommendationViewModelProvider
    extends
        $NotifierProvider<RecommendationViewModel, RecommendationViewState> {
  RecommendationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recommendationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recommendationViewModelHash();

  @$internal
  @override
  RecommendationViewModel create() => RecommendationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecommendationViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecommendationViewState>(value),
    );
  }
}

String _$recommendationViewModelHash() =>
    r'96130a74aec682b057a46df2816c162dcbc40605';

abstract class _$RecommendationViewModel
    extends $Notifier<RecommendationViewState> {
  RecommendationViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<RecommendationViewState, RecommendationViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecommendationViewState, RecommendationViewState>,
              RecommendationViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
