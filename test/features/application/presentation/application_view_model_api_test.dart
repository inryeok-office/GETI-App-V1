import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/features/application/data/repository/application_repository_impl.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';
import 'package:geti_app/features/application/domain/repository/application_repository.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';

void main() {
  test('API domain 상태를 기존 지원 목록 UI 상태로 매핑한다', () async {
    final repository = _FakeApplicationRepository(_statusApplications);
    final container = ProviderContainer(
      overrides: [applicationRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(
      applicationViewModelProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);

    await container.read(applicationViewModelProvider.notifier).retry();
    final state = container.read(applicationViewModelProvider);

    expect(state.screenStatus, ApplicationScreenStatus.loaded);
    expect(state.applications.map((application) => application.status), [
      ApplicationProgressStatus.submitted,
      ApplicationProgressStatus.revisionRequested,
      ApplicationProgressStatus.revisionRequested,
      ApplicationProgressStatus.revisionRequested,
      ApplicationProgressStatus.accepted,
      ApplicationProgressStatus.rejected,
      ApplicationProgressStatus.reviewing,
      ApplicationProgressStatus.cancelled,
    ]);
    expect(state.applications.first.id, '1');
    expect(state.applications.first.submittedDate, '2026.08.01');
  });

  test('job null과 submittedAt null을 기존 삭제 공고 카드 값으로 매핑한다', () async {
    final repository = _FakeApplicationRepository([
      ApplicationSummary(
        applicationId: 99,
        job: null,
        status: ApplicationStatus.rejected,
        submittedAt: null,
        updatedAt: DateTime(2026, 8, 2),
      ),
    ]);
    final container = ProviderContainer(
      overrides: [applicationRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);

    await container.read(applicationViewModelProvider.notifier).retry();
    final application = container
        .read(applicationViewModelProvider)
        .applications
        .single;

    expect(application.id, '99');
    expect(application.companyName, isEmpty);
    expect(application.positionName, '삭제된 공고');
    expect(application.submittedDate, '-');
    expect(application.isDeleted, isTrue);
  });

  test('표시 가능한 지원이 없으면 기존 empty 상태를 사용한다', () async {
    final container = ProviderContainer(
      overrides: [
        applicationRepositoryProvider.overrideWithValue(
          _FakeApplicationRepository(const []),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container.read(applicationViewModelProvider.notifier).retry();

    expect(
      container.read(applicationViewModelProvider).screenStatus,
      ApplicationScreenStatus.empty,
    );
  });

  test('조회 실패 후 retry 성공 시 기존 목록 상태로 복구한다', () async {
    final repository = _FakeApplicationRepository(
      _statusApplications.take(1).toList(),
      error: Exception('network'),
    );
    final container = ProviderContainer(
      overrides: [applicationRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
    final notifier = container.read(applicationViewModelProvider.notifier);

    await notifier.retry();
    expect(
      container.read(applicationViewModelProvider).screenStatus,
      ApplicationScreenStatus.networkError,
    );

    repository.error = null;
    await notifier.retry();
    expect(
      container.read(applicationViewModelProvider).screenStatus,
      ApplicationScreenStatus.loaded,
    );
  });
}

class _FakeApplicationRepository implements ApplicationRepository {
  _FakeApplicationRepository(this.applications, {this.error});

  final List<ApplicationSummary> applications;
  Object? error;

  @override
  Future<List<ApplicationSummary>> getMyApplications() async {
    final currentError = error;
    if (currentError != null) throw currentError;
    return applications;
  }
}

final _statusApplications = <ApplicationSummary>[
  _application(1, ApplicationStatus.submitted),
  _application(2, ApplicationStatus.editRequested),
  _application(3, ApplicationStatus.editAllowed),
  _application(4, ApplicationStatus.revisionRequested),
  _application(5, ApplicationStatus.approved),
  _application(6, ApplicationStatus.rejected),
  _application(7, ApplicationStatus.forwarded),
  _application(8, ApplicationStatus.withdrawn),
];

ApplicationSummary _application(int id, ApplicationStatus status) {
  return ApplicationSummary(
    applicationId: id,
    job: ApplicationJobSummary(
      jobId: id + 100,
      title: 'Flutter Developer',
      companyName: 'GETI',
      isDeleted: false,
    ),
    status: status,
    submittedAt: DateTime(2026, 8, 1),
    updatedAt: DateTime(2026, 8, 2),
  );
}
