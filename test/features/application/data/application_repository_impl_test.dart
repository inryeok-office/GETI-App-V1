import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/core/network/rest_client.dart';
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
}

class _FakeRestClient implements RestClient {
  _FakeRestClient(this.pages);

  final Map<int, MyJobApplicationListApiResponseDto> pages;
  final List<int> requestedPages = [];

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
