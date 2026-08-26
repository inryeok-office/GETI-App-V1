import 'package:geti_app/core/network/api_error.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/job/data/dto/ai_reanalysis_response.dart';
import 'package:geti_app/features/job/data/dto/job_detail_response.dart';
import 'package:geti_app/features/job/data/dto/job_search_response.dart';
import 'package:geti_app/features/job/data/dto/job_source_response.dart';
import 'package:geti_app/features/job/data/dto/recommendation_job_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_repository.g.dart';

abstract class JobRepository {
  Future<JobSearchResponse> searchJobs({
    String? query,
    String? postingType,
    String? applicationMethod,
    String? sourceName,
    String? sort,
    String? direction,
    int page = 0,
    int size = 20,
  });

  Future<JobDetailResponse> getJobDetail(int jobId);

  Future<List<PublicJobSourceResponse>> getJobSources({
    bool activeOnly = false,
  });

  Future<void> addBookmark(int jobId);

  Future<void> removeBookmark(int jobId);

  Future<RecommendationJobListResponse> getJobBookmarks({
    String? query,
    String? postingType,
    String? sort,
    int page = 0,
    int size = 20,
  });

  Future<AiReanalysisResponse> requestAiReanalysis(int jobId);
}

class JobRepositoryImpl implements JobRepository {
  JobRepositoryImpl(this.restClient);

  final RestClient restClient;

  @override
  Future<JobSearchResponse> searchJobs({
    String? query,
    String? postingType,
    String? applicationMethod,
    String? sourceName,
    String? sort,
    String? direction,
    int page = 0,
    int size = 20,
  }) async {
    final response = await restClient.getJobs(
      query: query,
      postingType: postingType,
      applicationMethod: applicationMethod,
      sourceName: sourceName,
      sort: sort,
      direction: direction,
      page: page,
      size: size,
    );
    return _unwrap(response.success, response.data, response.error);
  }

  @override
  Future<JobDetailResponse> getJobDetail(int jobId) async {
    final response = await restClient.getJobDetail(jobId);
    return _unwrap(response.success, response.data, response.error);
  }

  @override
  Future<List<PublicJobSourceResponse>> getJobSources({
    bool activeOnly = false,
  }) async {
    final response = await restClient.getJobSources(activeOnly: activeOnly);
    final data = _unwrap(response.success, response.data, response.error);
    return data.sources;
  }

  @override
  Future<void> addBookmark(int jobId) async {
    final response = await restClient.addBookmark({'jobId': jobId});
    if (!response.success) {
      throw ApiException(response.error ?? _unknownError());
    }
  }

  @override
  Future<void> removeBookmark(int jobId) async {
    await restClient.removeBookmark(jobId);
  }

  @override
  Future<RecommendationJobListResponse> getJobBookmarks({
    String? query,
    String? postingType,
    String? sort,
    int page = 0,
    int size = 20,
  }) async {
    final response = await restClient.getJobBookmarks(
      query: query,
      postingType: postingType,
      sort: sort,
      page: page,
      size: size,
    );
    return _unwrap(response.success, response.data, response.error);
  }

  @override
  Future<AiReanalysisResponse> requestAiReanalysis(int jobId) async {
    final response = await restClient.requestAiReanalysis(jobId);
    return _unwrap(response.success, response.data, response.error);
  }

  T _unwrap<T>(bool success, T? data, ApiErrorBody? error) {
    if (!success || data == null) {
      throw ApiException(error ?? _unknownError());
    }
    return data;
  }

  ApiErrorBody _unknownError() =>
      const ApiErrorBody(code: 'UNKNOWN', message: '알 수 없는 오류가 발생했습니다.');
}

@Riverpod(keepAlive: true)
JobRepository jobRepository(Ref ref) =>
    JobRepositoryImpl(ref.watch(restClientProvider));
