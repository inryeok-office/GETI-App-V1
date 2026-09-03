import 'package:dio/dio.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/recommendation/data/dto/recommendation_list_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recommendation_repository.g.dart';

class RecommendationRepositoryException implements Exception {
  const RecommendationRepositoryException(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => 'RecommendationRepositoryException: $message';
}

class RecommendationRepository {
  const RecommendationRepository(this._client);

  final RestClient _client;

  Future<RecommendationListResponse> getMyRecommendations({
    String? suitabilityLevel,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _client.getMyRecommendations(
        suitabilityLevel: suitabilityLevel,
        page: page,
        size: size,
      );
      final data = response.data;
      if (!response.success || data == null) {
        throw const RecommendationRepositoryException(
          'Recommendation response does not contain data.',
        );
      }
      return data;
    } on RecommendationRepositoryException {
      rethrow;
    } on DioException catch (error) {
      throw RecommendationRepositoryException(
        'Failed to fetch recommendations.',
        cause: error,
      );
    } on Object catch (error) {
      throw RecommendationRepositoryException(
        'Failed to parse recommendations.',
        cause: error,
      );
    }
  }
}

@riverpod
RecommendationRepository recommendationRepository(Ref ref) {
  return RecommendationRepository(ref.watch(restClientProvider));
}
