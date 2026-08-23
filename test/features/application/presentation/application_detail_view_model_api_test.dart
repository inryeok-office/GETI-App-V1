import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/application/data/repository/application_repository_impl.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';
import 'package:geti_app/features/application/domain/model/job_application_detail.dart';
import 'package:geti_app/features/application/domain/repository/application_repository.dart';
import 'package:geti_app/features/application/presentation/view_model/application_detail_view_model.dart';

void main() {
  test(
    'loads the requested ID and maps API detail fields for the existing UI',
    () async {
      final repository = _FakeApplicationRepository(_detail());
      final container = _container(repository);
      addTearDown(container.dispose);
      final provider = applicationDetailViewModelProvider('62');
      final subscription = container.listen(
        provider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      expect(
        container.read(provider).screenStatus,
        ApplicationDetailScreenStatus.loading,
      );
      await container.read(provider.notifier).retry();

      final state = container.read(provider);
      expect(repository.requestedIds, isNotEmpty);
      expect(repository.requestedIds.every((id) => id == 62), isTrue);
      expect(state.screenStatus, ApplicationDetailScreenStatus.loaded);
      expect(state.detail!.variant, ApplicationDetailVariant.revisionRequested);
      expect(state.detail!.noticeDescription, 'Please add more detail.');
      expect(state.detail!.submittedAt, '-');
      expect(state.detail!.answers.map((answer) => answer.title), [
        'First',
        'Second',
      ]);
      expect(state.detail!.answers.map((answer) => answer.value), [
        'Flutter, Dart',
        'true',
      ]);
      expect(state.detail!.files.map((file) => file.name), ['portfolio.pdf']);
      expect(
        state.detail!.files.single.downloadUrl,
        'https://example.com/portfolio.pdf',
      );
      expect(state.detail!.availableActions, ['RESUBMIT', 'WITHDRAW']);
      expect(state.detail!.history, isEmpty);
    },
  );

  test(
    'maps every server status supported by the existing detail UI',
    () async {
      final cases = <ApplicationStatus, ApplicationDetailVariant>{
        ApplicationStatus.submitted: ApplicationDetailVariant.submitted,
        ApplicationStatus.editRequested:
            ApplicationDetailVariant.revisionRequested,
        ApplicationStatus.editAllowed:
            ApplicationDetailVariant.revisionRequested,
        ApplicationStatus.revisionRequested:
            ApplicationDetailVariant.revisionRequested,
        ApplicationStatus.approved: ApplicationDetailVariant.accepted,
        ApplicationStatus.rejected: ApplicationDetailVariant.rejected,
        ApplicationStatus.forwarded: ApplicationDetailVariant.reviewing,
        ApplicationStatus.withdrawn: ApplicationDetailVariant.cancelled,
      };

      for (final entry in cases.entries) {
        final repository = _FakeApplicationRepository(
          _detail(status: entry.key),
        );
        final container = _container(repository);
        final provider = applicationDetailViewModelProvider('62');
        final subscription = container.listen(
          provider,
          (_, _) {},
          fireImmediately: true,
        );

        await container.read(provider.notifier).retry();

        expect(
          container.read(provider).detail!.variant,
          entry.value,
          reason: entry.key.name,
        );
        subscription.close();
        container.dispose();
      }
    },
  );

  test(
    'keeps null reason and empty answers/files safe in loaded state',
    () async {
      final repository = _FakeApplicationRepository(
        _detail(status: ApplicationStatus.submitted, emptyContent: true),
      );
      final container = _container(repository);
      addTearDown(container.dispose);
      final provider = applicationDetailViewModelProvider('62');
      final subscription = container.listen(
        provider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      await container.read(provider.notifier).retry();

      final detail = container.read(provider).detail;
      expect(
        container.read(provider).screenStatus,
        ApplicationDetailScreenStatus.loaded,
      );
      expect(detail, isNotNull);
      expect(detail!.noticeTitle, isNull);
      expect(detail.noticeDescription, isNull);
      expect(detail.answers, isEmpty);
      expect(detail.files, isEmpty);
    },
  );

  test('maps DRAFT and a missing detail to the existing empty state', () async {
    for (final detail in <JobApplicationDetail?>[
      _detail(status: ApplicationStatus.draft),
      null,
    ]) {
      final container = _container(_FakeApplicationRepository(detail));
      final provider = applicationDetailViewModelProvider('62');
      final subscription = container.listen(
        provider,
        (_, _) {},
        fireImmediately: true,
      );

      await container.read(provider.notifier).retry();

      expect(
        container.read(provider).screenStatus,
        ApplicationDetailScreenStatus.empty,
      );
      expect(container.read(provider).detail, isNull);
      subscription.close();
      container.dispose();
    }
  });

  test(
    'an invalid route ID uses the empty state without calling the API',
    () async {
      final repository = _FakeApplicationRepository(_detail());
      final container = _container(repository);
      addTearDown(container.dispose);
      final provider = applicationDetailViewModelProvider('invalid');
      final subscription = container.listen(
        provider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      await container.read(provider.notifier).retry();

      expect(
        container.read(provider).screenStatus,
        ApplicationDetailScreenStatus.empty,
      );
      expect(repository.requestedIds, isEmpty);
    },
  );

  test('retry recovers from the existing network error state', () async {
    final repository = _FakeApplicationRepository(
      _detail(),
      error: Exception('network'),
    );
    final container = _container(repository);
    addTearDown(container.dispose);
    final provider = applicationDetailViewModelProvider('62');
    final subscription = container.listen(
      provider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);

    await container.read(provider.notifier).retry();
    expect(
      container.read(provider).screenStatus,
      ApplicationDetailScreenStatus.networkError,
    );

    repository.error = null;
    await container.read(provider.notifier).retry();
    expect(
      container.read(provider).screenStatus,
      ApplicationDetailScreenStatus.loaded,
    );
  });
}

ProviderContainer _container(ApplicationRepository repository) {
  return ProviderContainer(
    overrides: [applicationRepositoryProvider.overrideWithValue(repository)],
  );
}

class _FakeApplicationRepository implements ApplicationRepository {
  _FakeApplicationRepository(this.detail, {this.error});

  final JobApplicationDetail? detail;
  Object? error;
  final List<int> requestedIds = [];

  @override
  Future<JobApplicationDetail?> getApplicationDetail(int applicationId) async {
    requestedIds.add(applicationId);
    final currentError = error;
    if (currentError != null) throw currentError;
    return detail;
  }

  @override
  Future<List<ApplicationSummary>> getMyApplications() async => const [];
}

JobApplicationDetail _detail({
  ApplicationStatus status = ApplicationStatus.revisionRequested,
  bool emptyContent = false,
}) {
  return JobApplicationDetail(
    applicationId: 62,
    jobId: 101,
    jobTitle: 'Flutter Developer',
    companyName: 'GETI',
    managerMemberId: null,
    managerName: null,
    formId: 20,
    formVersion: 1,
    status: status,
    statusReason: status == ApplicationStatus.revisionRequested
        ? 'Please add more detail.'
        : null,
    contactEmail: 'student@example.com',
    contactPhone: null,
    privacyConsent: true,
    applicantName: 'Student',
    applicantCohort: 1,
    applicantDepartment: 'Computer Science',
    applicantMajors: const ['Computer Science'],
    applicantDesiredJob: 'Frontend Developer',
    applicantTechStacks: const ['Flutter', 'Dart'],
    answers: emptyContent
        ? const []
        : const [
            JobApplicationAnswer(
              fieldId: 'first',
              value: ['Flutter', 'Dart'],
              fileIds: null,
            ),
            JobApplicationAnswer(fieldId: 'second', value: true, fileIds: null),
            JobApplicationAnswer(
              fieldId: 'unsupported',
              value: {'nested': 'value'},
              fileIds: null,
            ),
            JobApplicationAnswer(
              fieldId: 'upload',
              value: 'ignored',
              fileIds: [30],
            ),
          ],
    files: emptyContent
        ? const []
        : const [
            JobApplicationFile(
              fileId: 30,
              originalName: 'portfolio.pdf',
              contentType: 'application/pdf',
              size: 1887437,
              downloadUrl: 'https://example.com/portfolio.pdf',
            ),
            JobApplicationFile(
              fileId: 31,
              originalName: ' ',
              contentType: null,
              size: null,
              downloadUrl: null,
            ),
          ],
    submittedAt: null,
    withdrawnAt: null,
    createdAt: DateTime(2026, 8, 1),
    updatedAt: DateTime(2026, 8, 2),
    availableActions: const ['RESUBMIT', 'WITHDRAW'],
    questions: emptyContent
        ? const []
        : const [
            JobApplicationQuestion(
              fieldId: 'second',
              type: ApplicationQuestionType.singleSelect,
              title: 'Second',
              description: null,
              isRequired: true,
              order: 2,
              options: ['true', 'false'],
              filePolicy: null,
            ),
            JobApplicationQuestion(
              fieldId: 'first',
              type: ApplicationQuestionType.multiSelect,
              title: 'First',
              description: null,
              isRequired: true,
              order: 1,
              options: ['Flutter', 'Dart'],
              filePolicy: null,
            ),
            JobApplicationQuestion(
              fieldId: 'unsupported',
              type: ApplicationQuestionType.text,
              title: 'Unsupported',
              description: null,
              isRequired: false,
              order: 3,
              options: null,
              filePolicy: null,
            ),
            JobApplicationQuestion(
              fieldId: 'upload',
              type: ApplicationQuestionType.file,
              title: 'Upload',
              description: null,
              isRequired: false,
              order: 4,
              options: null,
              filePolicy: null,
            ),
          ],
  );
}
