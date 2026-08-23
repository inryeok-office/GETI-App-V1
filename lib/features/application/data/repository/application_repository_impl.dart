import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/application/data/dto/my_job_application_list_response_dto.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';
import 'package:geti_app/features/application/domain/repository/application_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_repository_impl.g.dart';

const _applicationPageSize = 20;

class ApplicationRepositoryImpl implements ApplicationRepository {
  const ApplicationRepositoryImpl(this._client);

  final RestClient _client;

  @override
  Future<List<ApplicationSummary>> getMyApplications() async {
    final applications = <ApplicationSummary>[];
    var page = 0;

    while (true) {
      final response = await _client.getMyJobApplications(
        page: page,
        size: _applicationPageSize,
      );
      if (!response.success) {
        throw StateError('내 지원 목록 조회에 실패했습니다.');
      }

      final pageData = response.data;
      applications.addAll(
        pageData.content
            .where((item) => item.status != JobApplicationStatusDto.draft)
            .map(_toDomain),
      );

      final nextPage = page + 1;
      if (pageData.last || nextPage >= pageData.totalPages) {
        break;
      }
      page = nextPage;
    }

    return List.unmodifiable(applications);
  }

  ApplicationSummary _toDomain(MyJobApplicationListItemDto dto) {
    final job = dto.job;
    return ApplicationSummary(
      applicationId: dto.applicationId,
      job: job == null
          ? null
          : ApplicationJobSummary(
              jobId: job.jobId,
              title: job.title,
              companyName: job.company?.name,
              isDeleted: job.status == JobPostingStatusDto.deleted,
            ),
      status: _toDomainStatus(dto.status),
      submittedAt: dto.submittedAt,
      updatedAt: dto.updatedAt,
    );
  }

  ApplicationStatus _toDomainStatus(JobApplicationStatusDto status) {
    return switch (status) {
      JobApplicationStatusDto.draft => ApplicationStatus.draft,
      JobApplicationStatusDto.submitted => ApplicationStatus.submitted,
      JobApplicationStatusDto.editRequested => ApplicationStatus.editRequested,
      JobApplicationStatusDto.editAllowed => ApplicationStatus.editAllowed,
      JobApplicationStatusDto.revisionRequested =>
        ApplicationStatus.revisionRequested,
      JobApplicationStatusDto.approved => ApplicationStatus.approved,
      JobApplicationStatusDto.rejected => ApplicationStatus.rejected,
      JobApplicationStatusDto.forwarded => ApplicationStatus.forwarded,
      JobApplicationStatusDto.withdrawn => ApplicationStatus.withdrawn,
    };
  }
}

@riverpod
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepositoryImpl(ref.watch(restClientProvider));
}
