import 'dart:async';

import 'package:geti_app/features/application/data/repository/application_repository_impl.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';
import 'package:geti_app/features/application/presentation/view_model/application_date_formatter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_view_model.g.dart';

enum ApplicationScreenStatus { loaded, loading, networkError, empty }

enum ApplicationFilter { all, inProgress, closed }

enum ApplicationProgressStatus {
  submitted,
  reviewing,
  revisionRequested,
  interviewing,
  accepted,
  rejected,
  cancelled,
  ended,
}

class ApplicationItem {
  const ApplicationItem({
    this.id = 'submitted',
    required this.companyName,
    required this.positionName,
    required this.status,
    required this.submittedDate,
    this.isDeleted = false,
  });

  final String id;
  final String companyName;
  final String positionName;
  final ApplicationProgressStatus status;
  final String submittedDate;
  final bool isDeleted;

  String get detailId => id;

  ApplicationItem copyWith({ApplicationProgressStatus? status}) {
    return ApplicationItem(
      id: id,
      companyName: companyName,
      positionName: positionName,
      status: status ?? this.status,
      submittedDate: submittedDate,
      isDeleted: isDeleted,
    );
  }
}

class ApplicationViewState {
  const ApplicationViewState({
    this.screenStatus = ApplicationScreenStatus.loading,
    this.selectedFilter = ApplicationFilter.all,
    this.applications = const [],
  });

  final ApplicationScreenStatus screenStatus;
  final ApplicationFilter selectedFilter;
  final List<ApplicationItem> applications;

  List<ApplicationItem> get filteredApplications {
    return switch (selectedFilter) {
      ApplicationFilter.all => applications,
      ApplicationFilter.inProgress =>
        applications
            .where((application) => application.status.isInProgress)
            .toList(growable: false),
      ApplicationFilter.closed =>
        applications
            .where((application) => application.status.isClosed)
            .toList(growable: false),
    };
  }

  ApplicationViewState copyWith({
    ApplicationScreenStatus? screenStatus,
    ApplicationFilter? selectedFilter,
    List<ApplicationItem>? applications,
  }) {
    return ApplicationViewState(
      screenStatus: screenStatus ?? this.screenStatus,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      applications: applications ?? this.applications,
    );
  }
}

extension ApplicationProgressStatusFilter on ApplicationProgressStatus {
  bool get isInProgress => switch (this) {
    ApplicationProgressStatus.submitted ||
    ApplicationProgressStatus.reviewing ||
    ApplicationProgressStatus.revisionRequested ||
    ApplicationProgressStatus.interviewing => true,
    ApplicationProgressStatus.accepted ||
    ApplicationProgressStatus.rejected ||
    ApplicationProgressStatus.cancelled ||
    ApplicationProgressStatus.ended => false,
  };

  bool get isClosed => !isInProgress;
}

@riverpod
class ApplicationViewModel extends _$ApplicationViewModel {
  @override
  ApplicationViewState build() {
    unawaited(Future<void>.microtask(_loadApplications));
    return const ApplicationViewState();
  }

  void selectFilter(ApplicationFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  Future<void> retry() {
    return _loadApplications();
  }

  Future<void> _loadApplications() async {
    state = state.copyWith(
      screenStatus: ApplicationScreenStatus.loading,
      applications: const [],
    );
    try {
      final repository = ref.read(applicationRepositoryProvider);
      final applications = await repository.getMyApplications();
      if (!ref.mounted) return;
      final items = applications.map(_toPresentation).toList(growable: false);
      state = state.copyWith(
        screenStatus: items.isEmpty
            ? ApplicationScreenStatus.empty
            : ApplicationScreenStatus.loaded,
        applications: items,
      );
    } on Object {
      if (!ref.mounted) return;
      state = state.copyWith(
        screenStatus: ApplicationScreenStatus.networkError,
        applications: const [],
      );
    }
  }

  void updateApplicationStatus(
    String applicationId,
    ApplicationProgressStatus status,
  ) {
    state = state.copyWith(
      applications: state.applications
          .map(
            (application) => application.id == applicationId
                ? application.copyWith(status: status)
                : application,
          )
          .toList(growable: false),
    );
  }

  ApplicationItem _toPresentation(ApplicationSummary application) {
    final job = application.job;
    return ApplicationItem(
      id: application.applicationId.toString(),
      companyName: job?.companyName ?? '',
      positionName: job?.title ?? '삭제된 공고',
      status: _toProgressStatus(application.status),
      submittedDate: formatApplicationDate(application.submittedAt),
      isDeleted: job == null || job.isDeleted,
    );
  }

  ApplicationProgressStatus _toProgressStatus(ApplicationStatus status) {
    return switch (status) {
      ApplicationStatus.draft => throw StateError('DRAFT는 앱 목록에 표시할 수 없습니다.'),
      ApplicationStatus.submitted => ApplicationProgressStatus.submitted,
      ApplicationStatus.editRequested ||
      ApplicationStatus.editAllowed ||
      ApplicationStatus.revisionRequested =>
        ApplicationProgressStatus.revisionRequested,
      ApplicationStatus.approved => ApplicationProgressStatus.accepted,
      ApplicationStatus.rejected => ApplicationProgressStatus.rejected,
      ApplicationStatus.forwarded => ApplicationProgressStatus.reviewing,
      ApplicationStatus.withdrawn => ApplicationProgressStatus.cancelled,
    };
  }
}
