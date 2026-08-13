import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'program_detail_view_model.g.dart';

enum ProgramDetailActionStatus {
  available,
  applying,
  concurrencyFailure,
  upcoming,
  full,
  closed,
  applied,
}

enum ProgramApplicationOutcome { success, concurrencyFailure }

@riverpod
ProgramApplicationOutcome programApplicationOutcome(Ref ref) {
  return ProgramApplicationOutcome.success;
}

class ProgramDetail {
  const ProgramDetail({
    required this.id,
    required this.title,
    required this.actionStatus,
    this.category = '특강',
    this.recruitmentBadge = '모집 중',
    this.applicationPeriod = '신청 08.01–08.10',
    this.viewCount = '조회수 128',
    this.schedule = '2026.08.12 14:00–16:00',
    this.location = '광주소프트웨어마이스터고 시청각실',
    this.capacity = '30명',
    this.description = '현직 프론트엔드 개발자가 실무 경험과 취업 준비 방법을 공유합니다.',
    this.recruitmentCapacity = '50명',
    this.currentApplicants = '32명',
    this.remainingCapacity = '18명',
    this.admissionType = '선착순',
  });

  final String id;
  final String title;
  final ProgramDetailActionStatus actionStatus;
  final String category;
  final String recruitmentBadge;
  final String applicationPeriod;
  final String viewCount;
  final String schedule;
  final String location;
  final String capacity;
  final String description;
  final String recruitmentCapacity;
  final String currentApplicants;
  final String remainingCapacity;
  final String admissionType;

  ProgramDetail copyWith({ProgramDetailActionStatus? actionStatus}) {
    return ProgramDetail(
      id: id,
      title: title,
      actionStatus: actionStatus ?? this.actionStatus,
      category: category,
      recruitmentBadge: recruitmentBadge,
      applicationPeriod: applicationPeriod,
      viewCount: viewCount,
      schedule: schedule,
      location: location,
      capacity: capacity,
      description: description,
      recruitmentCapacity: recruitmentCapacity,
      currentApplicants: currentApplicants,
      remainingCapacity: remainingCapacity,
      admissionType: admissionType,
    );
  }
}

class ProgramDetailViewState {
  const ProgramDetailViewState({this.detail});
  final ProgramDetail? detail;

  ProgramDetailViewState copyWith({ProgramDetail? detail}) {
    return ProgramDetailViewState(detail: detail ?? this.detail);
  }
}

@riverpod
class ProgramDetailViewModel extends _$ProgramDetailViewModel {
  @override
  ProgramDetailViewState build(String programId) {
    return ProgramDetailViewState(detail: mockProgramDetails[programId]);
  }

  Future<void> applyProgram() async {
    final detail = state.detail;
    if (detail == null ||
        detail.actionStatus != ProgramDetailActionStatus.available) {
      return;
    }

    state = state.copyWith(
      detail: detail.copyWith(actionStatus: ProgramDetailActionStatus.applying),
    );
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;

    final outcome = ref.read(programApplicationOutcomeProvider);
    state = state.copyWith(
      detail: state.detail!.copyWith(
        actionStatus: switch (outcome) {
          ProgramApplicationOutcome.success =>
            ProgramDetailActionStatus.applied,
          ProgramApplicationOutcome.concurrencyFailure =>
            ProgramDetailActionStatus.concurrencyFailure,
        },
      ),
    );
  }

  void confirmConcurrencyFailure() {
    final detail = state.detail;
    if (detail?.actionStatus != ProgramDetailActionStatus.concurrencyFailure) {
      return;
    }
    state = state.copyWith(
      detail: detail!.copyWith(
        actionStatus: ProgramDetailActionStatus.available,
      ),
    );
  }
}

const mockProgramDetails = <String, ProgramDetail>{
  'available': ProgramDetail(
    id: 'available',
    title: '현직자와 함께하는 프론트엔드 특강',
    actionStatus: ProgramDetailActionStatus.available,
  ),
  'upcoming': ProgramDetail(
    id: 'upcoming',
    title: '포트폴리오 1:1 멘토링',
    actionStatus: ProgramDetailActionStatus.upcoming,
  ),
  'full': ProgramDetail(
    id: 'full',
    title: '2026 하반기 취업 전략 설명회',
    actionStatus: ProgramDetailActionStatus.full,
  ),
  'closed': ProgramDetail(
    id: 'closed',
    title: '포트폴리오 1:1 멘토링',
    actionStatus: ProgramDetailActionStatus.closed,
  ),
  'applied': ProgramDetail(
    id: 'applied',
    title: '현직자와 함께하는 프론트엔드 특강',
    actionStatus: ProgramDetailActionStatus.applied,
  ),
};
