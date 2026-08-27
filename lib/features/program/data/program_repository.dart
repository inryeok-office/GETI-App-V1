import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/program/data/dto/program_list_response.dart';

abstract class ProgramRepository {
  Future<ProgramListResponse> getPrograms({
    String? programType,
    String? status,
    bool? openOnly,
    int page = 0,
    int size = 20,
    List<String>? sort,
  });
}

class ProgramRepositoryException implements Exception {
  const ProgramRepositoryException(this.message);

  final String message;

  @override
  String toString() => 'ProgramRepositoryException($message)';
}

class ProgramRepositoryImpl implements ProgramRepository {
  const ProgramRepositoryImpl(this.restClient);

  final RestClient restClient;

  @override
  Future<ProgramListResponse> getPrograms({
    String? programType,
    String? status,
    bool? openOnly,
    int page = 0,
    int size = 20,
    List<String>? sort,
  }) async {
    final response = await restClient.getPrograms(
      programType: programType,
      status: status,
      openOnly: openOnly,
      page: page,
      size: size,
      sort: sort,
    );
    final data = response.data;
    if (!response.success || data == null) {
      throw const ProgramRepositoryException('Failed to load programs.');
    }
    return data;
  }
}

final programRepositoryProvider = Provider<ProgramRepository>((ref) {
  return ProgramRepositoryImpl(ref.watch(restClientProvider));
});
