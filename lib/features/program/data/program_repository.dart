import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/program/data/dto/program_detail_response.dart';
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

  Future<ProgramDetailResponse> getProgramDetail(int programId);
}

class ProgramRepositoryException implements Exception {
  const ProgramRepositoryException(this.message, {this.statusCode, this.code});

  final String message;
  final int? statusCode;
  final String? code;

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

  @override
  Future<ProgramDetailResponse> getProgramDetail(int programId) async {
    try {
      final response = await restClient.getProgram(programId);
      final data = response.data;
      if (!response.success || data == null) {
        throw const ProgramRepositoryException(
          'Failed to load program detail.',
        );
      }
      return data;
    } on DioException catch (error) {
      throw ProgramRepositoryException(
        'Failed to load program detail.',
        statusCode: error.response?.statusCode,
        code: _errorCodeFrom(error.response?.data),
      );
    }
  }
}

final programRepositoryProvider = Provider<ProgramRepository>((ref) {
  return ProgramRepositoryImpl(ref.watch(restClientProvider));
});

String? _errorCodeFrom(Object? data) {
  if (data is! Map) return null;

  final code = data['code'];
  if (code is String) return code;

  final error = data['error'];
  if (error is Map) {
    final nestedCode = error['code'];
    if (nestedCode is String) return nestedCode;
  }

  return null;
}
