import 'package:dio/dio.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/application/data/dto/job_application_detail_response_dto.dart';
import 'package:geti_app/features/application/data/dto/my_job_application_list_response_dto.dart';
import 'package:geti_app/features/application/domain/model/job_application_detail.dart';
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

  @override
  Future<JobApplicationDetail?> getApplicationDetail(int applicationId) async {
    late final JobApplicationDetailApiResponseDto response;
    try {
      response = await _client.getJobApplicationDetail(applicationId);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) return null;
      rethrow;
    }

    final data = response.data;
    if (response.success != true || data == null) {
      throw StateError('지원 상세 조회에 실패했습니다.');
    }

    final responseApplicationId = data.applicationId;
    final status = data.status;
    if (responseApplicationId == null || status == null) {
      throw const FormatException('지원 상세 응답의 필수 식별자 또는 상태가 없습니다.');
    }

    return JobApplicationDetail(
      applicationId: responseApplicationId,
      jobId: data.jobId,
      jobTitle: data.jobTitle,
      companyName: data.companyName,
      managerMemberId: data.managerMemberId,
      managerName: data.managerName,
      formId: data.formId,
      formVersion: data.formVersion,
      status: _toDomainStatus(status),
      statusReason: data.statusReason,
      contactEmail: data.contactEmail,
      contactPhone: data.contactPhone,
      privacyConsent: data.privacyConsent,
      applicantName: data.applicantName,
      applicantCohort: data.applicantCohort,
      applicantDepartment: data.applicantDepartment,
      applicantMajors: List.unmodifiable(data.applicantMajors),
      applicantDesiredJob: data.applicantDesiredJob,
      applicantTechStacks: List.unmodifiable(data.applicantTechStacks),
      answers: List.unmodifiable(
        data.answers.map(
          (answer) => JobApplicationAnswer(
            fieldId: answer.fieldId,
            value: answer.value,
            fileIds: answer.fileIds == null
                ? null
                : List.unmodifiable(answer.fileIds!),
          ),
        ),
      ),
      files: List.unmodifiable(
        data.files.map(
          (file) => JobApplicationFile(
            fileId: file.fileId,
            originalName: file.originalName,
            contentType: file.contentType,
            size: file.size,
            downloadUrl: file.downloadUrl,
          ),
        ),
      ),
      submittedAt: data.submittedAt,
      withdrawnAt: data.withdrawnAt,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      availableActions: List.unmodifiable(data.availableActions),
      questions: List.unmodifiable(
        data.questions.map(
          (question) => JobApplicationQuestion(
            fieldId: question.fieldId,
            type: _toDomainQuestionType(question.type),
            title: question.title,
            description: question.description,
            isRequired: question.isRequired,
            order: question.order,
            options: question.options == null
                ? null
                : List.unmodifiable(question.options!),
            filePolicy: question.filePolicy,
          ),
        ),
      ),
    );
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

  ApplicationQuestionType? _toDomainQuestionType(FormFieldTypeDto? type) {
    if (type == null) return null;
    return switch (type) {
      FormFieldTypeDto.text => ApplicationQuestionType.text,
      FormFieldTypeDto.textarea => ApplicationQuestionType.textarea,
      FormFieldTypeDto.singleSelect => ApplicationQuestionType.singleSelect,
      FormFieldTypeDto.multiSelect => ApplicationQuestionType.multiSelect,
      FormFieldTypeDto.file => ApplicationQuestionType.file,
    };
  }
}

@riverpod
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepositoryImpl(ref.watch(restClientProvider));
}
