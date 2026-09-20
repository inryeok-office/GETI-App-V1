// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recommendationRepository)
final recommendationRepositoryProvider = RecommendationRepositoryProvider._();

final class RecommendationRepositoryProvider
    extends
        $FunctionalProvider<
          RecommendationRepository,
          RecommendationRepository,
          RecommendationRepository
        >
    with $Provider<RecommendationRepository> {
  RecommendationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recommendationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recommendationRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecommendationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecommendationRepository create(Ref ref) {
    return recommendationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecommendationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecommendationRepository>(value),
    );
  }
}

String _$recommendationRepositoryHash() =>
    r'da77887799515aa1900539f43ec5b37c499c8fff';
