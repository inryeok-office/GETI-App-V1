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
}

class ApplicationViewState {
  const ApplicationViewState({
    this.screenStatus = ApplicationScreenStatus.loaded,
    this.selectedFilter = ApplicationFilter.all,
    this.applications = mockApplications,
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
  ApplicationViewState build() => const ApplicationViewState();

  void selectFilter(ApplicationFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  Future<void> retry() async {
    state = state.copyWith(screenStatus: ApplicationScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = state.copyWith(screenStatus: ApplicationScreenStatus.loaded);
  }
}

const mockApplications = [
  ApplicationItem(
    id: 'submitted',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    status: ApplicationProgressStatus.submitted,
    submittedDate: '2026.08.01',
  ),
  ApplicationItem(
    id: 'reviewing',
    companyName: '토스페이먼츠',
    positionName: 'Frontend Developer',
    status: ApplicationProgressStatus.reviewing,
    submittedDate: '2026.08.01',
  ),
  ApplicationItem(
    id: 'deleted',
    companyName: '네이버클라우드',
    positionName: '삭제된 공고',
    status: ApplicationProgressStatus.cancelled,
    submittedDate: '2026.07.20',
    isDeleted: true,
  ),
  ApplicationItem(
    id: 'revision',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    status: ApplicationProgressStatus.revisionRequested,
    submittedDate: '2026.08.01',
  ),
  ApplicationItem(
    id: 'interviewing',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    status: ApplicationProgressStatus.interviewing,
    submittedDate: '2026.08.01',
  ),
  ApplicationItem(
    id: 'accepted',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    status: ApplicationProgressStatus.accepted,
    submittedDate: '2026.08.01',
  ),
  ApplicationItem(
    id: 'rejected',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    status: ApplicationProgressStatus.rejected,
    submittedDate: '2026.08.01',
  ),
  ApplicationItem(
    id: 'ended',
    companyName: '네이버클라우드',
    positionName: '삭제된 공고',
    status: ApplicationProgressStatus.ended,
    submittedDate: '2026.07.20',
    isDeleted: true,
  ),
];
