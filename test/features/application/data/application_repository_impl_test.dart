import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
import 'package:geti_app/features/application/data/dto/job_application_detail_response_dto.dart';
import 'package:geti_app/features/application/data/dto/my_job_application_list_response_dto.dart';
import 'package:geti_app/features/application/data/repository/application_repository_impl.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';

void main() {
  test('Swagger 목록 응답의 nullable 필드를 역직렬화한다', () {
    final response = MyJobApplicationListApiResponseDto.fromJson({
      'success': true,
      'data': {
        'content': [
          {
            'applicationId': 101,
            'job': null,
            'status': 'WITHDRAWN',
            'submittedAt': null,
            'updatedAt': '2026-08-23T10:20:30Z',
          },
        ],
        'page': 0,
        'size': 20,
        'totalElements': 1,
        'totalPages': 1,
        'first': true,
        'last': true,
      },
      'meta': {'requestId': null},
    });

    final item = response.data.content.single;
    expect(item.applicationId, 101);
    expect(item.job, isNull);
    expect(item.status, JobApplicationStatusDto.withdrawn);
    expect(item.submittedAt, isNull);
    expect(response.meta.requestId, isNull);
  });

  test('모든 페이지를 수집한 뒤 DRAFT를 제외하고 실제 ID를 유지한다', () async {
    final client = _FakeRestClient({
      0: _response(
        page: 0,
        totalPages: 2,
        last: false,
        content: [
          _item(id: 1, status: JobApplicationStatusDto.draft),
          _item(id: 2, status: JobApplicationStatusDto.submitted),
        ],
      ),
      1: _response(
        page: 1,
        totalPages: 2,
        last: true,
        content: [
          _item(id: 3, status: JobApplicationStatusDto.rejected, job: null),
        ],
      ),
    });
    final repository = ApplicationRepositoryImpl(client);

    final applications = await repository.getMyApplications();

    expect(client.requestedPages, [0, 1]);
    expect(applications.map((application) => application.applicationId), [
      2,
      3,
    ]);
    expect(applications.first.status, ApplicationStatus.submitted);
    expect(applications.last.status, ApplicationStatus.rejected);
    expect(applications.last.job, isNull);
  });

  test('job과 company nullable 및 삭제 상태를 domain에 보존한다', () async {
    final client = _FakeRestClient({
      0: _response(
        page: 0,
        totalPages: 1,
        last: true,
        content: [
          _item(
            id: 10,
            status: JobApplicationStatusDto.forwarded,
            job: _job(status: JobPostingStatusDto.deleted, company: null),
          ),
        ],
      ),
    });

    final application = (await ApplicationRepositoryImpl(
      client,
    ).getMyApplications()).single;

    expect(application.job, isNotNull);
    expect(application.job!.companyName, isNull);
    expect(application.job!.isDeleted, isTrue);
  });

  test('Swagger 상세 응답의 answers, files, nullable 날짜를 역직렬화한다', () {
    final response = JobApplicationDetailApiResponseDto.fromJson({
      'success': true,
      'data': {
        'applicationId': 62,
        'jobId': 101,
        'jobTitle': 'Flutter Developer',
        'companyName': 'GETI',
        'status': 'REVISION_REQUESTED',
        'statusReason': null,
        'answers': [
          {
            'fieldId': 'skills',
            'value': ['Flutter', 'Dart'],
            'fileIds': null,
          },
        ],
        'files': [
          {
            'fileId': 10,
            'originalName': 'portfolio.pdf',
            'contentType': 'application/pdf',
            'size': 1887437,
            'downloadUrl': 'https://example.com/portfolio.pdf',
          },
        ],
        'submittedAt': null,
        'withdrawnAt': null,
        'createdAt': '2026-08-01T00:00:00Z',
        'updatedAt': '2026-08-02T00:00:00Z',
        'availableActions': ['RESUBMIT', 'WITHDRAW'],
        'questions': [
          {
            'fieldId': 'skills',
            'type': 'MULTI_SELECT',
            'title': '기술 스택',
            'required': true,
            'order': 2,
          },
        ],
      },
      'meta': {'requestId': null},
    });

    final detail = response.data!;
    expect(detail.status, JobApplicationStatusDto.revisionRequested);
    expect(detail.statusReason, isNull);
    expect(detail.answers.single.value, ['Flutter', 'Dart']);
    expect(detail.files.single.originalName, 'portfolio.pdf');
    expect(detail.submittedAt, isNull);
    expect(detail.withdrawnAt, isNull);
    expect(detail.questions.single.type, FormFieldTypeDto.multiSelect);
  });

  test('상세 응답의 알 수 없는 enum은 null로 파싱된다', () {
    final response = JobApplicationDetailApiResponseDto.fromJson({
      'success': true,
      'data': {'applicationId': 62, 'status': 'FUTURE_STATUS'},
    });

    expect(response.data!.status, isNull);
  });

  test('실제 applicationId로 상세를 조회하고 DTO 전체를 domain에 보존한다', () async {
    final client = _FakeRestClient(const {}, detailResponse: _detailResponse());
    final detail = await ApplicationRepositoryImpl(
      client,
    ).getApplicationDetail(62);

    expect(client.requestedDetailIds, [62]);
    expect(detail, isNotNull);
    expect(detail!.applicationId, 62);
    expect(detail.status, ApplicationStatus.revisionRequested);
    expect(
      detail.statusReason,
      'Please describe your project experience in detail.',
    );
    expect(detail.answers.single.fieldId, 'motivation');
    expect(detail.files.single.downloadUrl, contains('portfolio.pdf'));
    expect(detail.availableActions, ['RESUBMIT', 'WITHDRAW']);
    expect(detail.questions.single.title, 'Motivation');
  });

  test('상세 조회 404는 지원 내역 없음 처리를 위해 null을 반환한다', () async {
    final requestOptions = RequestOptions(path: '/api/v1/job-applications/999');
    final client = _FakeRestClient(
      const {},
      detailError: DioException(
        requestOptions: requestOptions,
        response: Response<void>(
          requestOptions: requestOptions,
          statusCode: 404,
        ),
      ),
    );

    expect(
      await ApplicationRepositoryImpl(client).getApplicationDetail(999),
      isNull,
    );
  });
}

class _FakeRestClient implements RestClient {
  _FakeRestClient(this.pages, {this.detailResponse, this.detailError});

  final Map<int, MyJobApplicationListApiResponseDto> pages;
  final JobApplicationDetailApiResponseDto? detailResponse;
  final Object? detailError;
  final List<int> requestedPages = [];
  final List<int> requestedDetailIds = [];

  @override
  Future<JobApplicationDetailApiResponseDto> getJobApplicationDetail(
    int applicationId,
  ) async {
    requestedDetailIds.add(applicationId);
    final currentError = detailError;
    if (currentError != null) throw currentError;
    return detailResponse!;
  }

  @override
  Future<MyJobApplicationListApiResponseDto> getMyJobApplications({
    String? status,
    int page = 0,
    int size = 20,
    List<String>? sort,
  }) async {
    requestedPages.add(page);
    return pages[page]!;
  }
}

MyJobApplicationListApiResponseDto _response({
  required int page,
  required int totalPages,
  required bool last,
  required List<MyJobApplicationListItemDto> content,
}) {
  return MyJobApplicationListApiResponseDto(
    success: true,
    data: MyJobApplicationListResponseDto(
      content: content,
      page: page,
      size: 20,
      totalElements: content.length,
      totalPages: totalPages,
      first: page == 0,
      last: last,
    ),
    meta: const ApiResponseMetaDto(requestId: null),
  );
}

MyJobApplicationListItemDto _item({
  required int id,
  required JobApplicationStatusDto status,
  MyJobApplicationJobSummaryDto? job = const MyJobApplicationJobSummaryDto(
    jobId: 200,
    title: 'Flutter Developer',
    postingType: JobPostingTypeDto.general,
    applicationMethod: JobApplicationMethodDto.internal,
    status: JobPostingStatusDto.published,
    company: CompanySummaryDto(companyId: 300, name: 'GETI', logoUrl: null),
    endDate: null,
    viewCount: 0,
    bookmarked: false,
    techStacks: [],
    bookmarkCount: 0,
  ),
}) {
  return MyJobApplicationListItemDto(
    applicationId: id,
    job: job,
    status: status,
    submittedAt: status == JobApplicationStatusDto.draft
        ? null
        : DateTime.utc(2026, 8, 1),
    updatedAt: DateTime.utc(2026, 8, 2),
  );
}

MyJobApplicationJobSummaryDto _job({
  required JobPostingStatusDto status,
  required CompanySummaryDto? company,
}) {
  return MyJobApplicationJobSummaryDto(
    jobId: 200,
    title: 'Flutter Developer',
    postingType: JobPostingTypeDto.general,
    applicationMethod: JobApplicationMethodDto.internal,
    status: status,
    company: company,
    endDate: null,
    viewCount: 0,
    bookmarked: false,
    techStacks: const [],
    bookmarkCount: 0,
  );
}

JobApplicationDetailApiResponseDto _detailResponse() {
  return JobApplicationDetailApiResponseDto(
    success: true,
    data: JobApplicationDetailResponseDto(
      applicationId: 62,
      jobId: 101,
      jobTitle: 'Flutter Developer',
      companyName: 'GETI',
      managerMemberId: 7,
      managerName: 'Manager',
      formId: 20,
      formVersion: 1,
      status: JobApplicationStatusDto.revisionRequested,
      statusReason: 'Please describe your project experience in detail.',
      contactEmail: 'student@example.com',
      contactPhone: null,
      privacyConsent: true,
      applicantName: 'Student',
      applicantCohort: 1,
      applicantDepartment: 'Computer Science',
      applicantMajors: const ['Computer Science'],
      applicantDesiredJob: 'Frontend Developer',
      applicantTechStacks: const ['Flutter', 'Dart'],
      answers: const [
        ApplicationAnswerDto(
          fieldId: 'motivation',
          value: 'I want to solve user problems.',
          fileIds: null,
        ),
      ],
      files: const [
        JobApplicationFileResponseDto(
          fileId: 30,
          originalName: 'portfolio.pdf',
          contentType: 'application/pdf',
          size: 1887437,
          downloadUrl: 'https://example.com/portfolio.pdf',
        ),
      ],
      submittedAt: null,
      withdrawnAt: null,
      createdAt: DateTime(2026, 8, 1),
      updatedAt: DateTime(2026, 8, 2),
      availableActions: const ['RESUBMIT', 'WITHDRAW'],
      questions: const [
        FormFieldResponseDto(
          fieldId: 'motivation',
          type: FormFieldTypeDto.textarea,
          title: 'Motivation',
          description: null,
          isRequired: true,
          order: 1,
          options: null,
          filePolicy: null,
        ),
      ],
    ),
    meta: const ApiResponseMetaDto(requestId: null),
  );
}
