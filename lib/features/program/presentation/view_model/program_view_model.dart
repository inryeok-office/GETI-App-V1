import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'program_type.dart';

part 'program_view_model.g.dart';

enum ProgramScreenStatus { loaded, loading, networkError }

enum ProgramTab { all, applied }

enum ProgramRecruitmentStatus {
  recruiting,
  full,
  upcoming,
  closed,
  cancelled,
  deleted,
}

class ProgramItem {
  const ProgramItem({
    required this.id,
    required this.title,
    required this.schedule,
    required this.location,
    required this.applicationPeriod,
    required this.status,
    required this.type,
    this.isApplied = false,
  });
  final String id;
  final String title;
  final String schedule;
  final String location;
  final String applicationPeriod;
  final ProgramRecruitmentStatus status;
  final ProgramType type;
  final bool isApplied;
}

class ProgramViewState {
  const ProgramViewState({
    this.screenStatus = ProgramScreenStatus.loaded,
    this.selectedTab = ProgramTab.all,
    this.programs = mockPrograms,
  });
  final ProgramScreenStatus screenStatus;
  final ProgramTab selectedTab;
  final List<ProgramItem> programs;
  List<ProgramItem> get visiblePrograms => switch (selectedTab) {
    ProgramTab.all => programs,
    ProgramTab.applied =>
      programs.where((program) => program.isApplied).toList(growable: false),
  };
  ProgramViewState copyWith({
    ProgramScreenStatus? screenStatus,
    ProgramTab? selectedTab,
    List<ProgramItem>? programs,
  }) => ProgramViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    selectedTab: selectedTab ?? this.selectedTab,
    programs: programs ?? this.programs,
  );
}

@riverpod
class ProgramViewModel extends _$ProgramViewModel {
  @override
  ProgramViewState build() => const ProgramViewState();
  void selectTab(ProgramTab tab) => state = state.copyWith(selectedTab: tab);
  Future<void> retry() async {
    state = state.copyWith(screenStatus: ProgramScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = state.copyWith(screenStatus: ProgramScreenStatus.loaded);
  }
}

const mockPrograms = [
  ProgramItem(
    id: 'applied',
    title: '현직자와 함께하는 프론트엔드 특강',
    schedule: '08.12 14:00–16:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.07.20 – 2026.08.10',
    status: ProgramRecruitmentStatus.recruiting,
    type: ProgramType.specialLecture,
    isApplied: true,
  ),
  ProgramItem(
    id: 'cancelled',
    title: '현직자와 함께하는 프론트엔드 특강',
    schedule: '08.12 14:00–16:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.07.20 – 2026.08.10',
    status: ProgramRecruitmentStatus.cancelled,
    type: ProgramType.specialLecture,
    isApplied: true,
  ),
  ProgramItem(
    id: 'deleted',
    title: '삭제된 프로그램입니다.',
    schedule: '08.12 14:00–16:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.07.20 – 2026.08.10',
    status: ProgramRecruitmentStatus.deleted,
    type: ProgramType.specialLecture,
    isApplied: true,
  ),
  ProgramItem(
    id: 'full',
    title: '2026 하반기 취업 전략 설명회',
    schedule: '08.18 13:00–15:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.07.20 – 2026.08.15',
    status: ProgramRecruitmentStatus.full,
    type: ProgramType.education,
  ),
  ProgramItem(
    id: 'upcoming',
    title: '포트폴리오 1:1 멘토링',
    schedule: '08.25 10:00–17:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.08.01 – 2026.08.20',
    status: ProgramRecruitmentStatus.upcoming,
    type: ProgramType.education,
  ),
  ProgramItem(
    id: 'closed',
    title: '포트폴리오 1:1 멘토링',
    schedule: '08.25 10:00–17:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.08.01 – 2026.08.20',
    status: ProgramRecruitmentStatus.closed,
    type: ProgramType.education,
  ),
  ProgramItem(
    id: 'available',
    title: '현직자와 함께하는 프론트엔드 특강',
    schedule: '08.12 14:00–16:00',
    location: '광주소프트웨어마이스터고 시청각실',
    applicationPeriod: '2026.07.20 – 2026.08.10',
    status: ProgramRecruitmentStatus.recruiting,
    type: ProgramType.specialLecture,
  ),
];
