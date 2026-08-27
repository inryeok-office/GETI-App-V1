import 'dart:async';

import 'package:geti_app/features/program/data/dto/program_list_response.dart';
import 'package:geti_app/features/program/data/program_repository.dart';
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

  factory ProgramItem.fromSummary(ProgramSummaryResponse summary) {
    return ProgramItem(
      id: summary.programId.toString(),
      title: summary.title,
      schedule: _dateTimeRangeLabel(summary.startAt, summary.endAt),
      location: _textOrFallback(summary.location, '장소 미정'),
      applicationPeriod: _dateRangeLabel(
        summary.applicationStartAt,
        summary.applicationEndAt,
      ),
      status: programRecruitmentStatusFrom(summary.status),
      type: programTypeFrom(summary.programType),
      isApplied: summary.applied,
    );
  }
}

class ProgramViewState {
  const ProgramViewState({
    this.screenStatus = ProgramScreenStatus.loaded,
    this.selectedTab = ProgramTab.all,
    this.programs = const [],
    this.currentPage = 0,
    this.totalElements = 0,
    this.totalPages = 0,
    this.hasMore = false,
  });
  final ProgramScreenStatus screenStatus;
  final ProgramTab selectedTab;
  final List<ProgramItem> programs;
  final int currentPage;
  final int totalElements;
  final int totalPages;
  final bool hasMore;
  List<ProgramItem> get visiblePrograms => switch (selectedTab) {
    ProgramTab.all => programs,
    ProgramTab.applied =>
      programs.where((program) => program.isApplied).toList(growable: false),
  };
  ProgramViewState copyWith({
    ProgramScreenStatus? screenStatus,
    ProgramTab? selectedTab,
    List<ProgramItem>? programs,
    int? currentPage,
    int? totalElements,
    int? totalPages,
    bool? hasMore,
  }) => ProgramViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    selectedTab: selectedTab ?? this.selectedTab,
    programs: programs ?? this.programs,
    currentPage: currentPage ?? this.currentPage,
    totalElements: totalElements ?? this.totalElements,
    totalPages: totalPages ?? this.totalPages,
    hasMore: hasMore ?? this.hasMore,
  );
}

const _programPageSize = 20;

@riverpod
class ProgramViewModel extends _$ProgramViewModel {
  @override
  ProgramViewState build() {
    unawaited(Future.microtask(_fetchPrograms));
    return const ProgramViewState(screenStatus: ProgramScreenStatus.loading);
  }

  void selectTab(ProgramTab tab) => state = state.copyWith(selectedTab: tab);

  Future<void> retry() => _fetchPrograms();

  Future<void> _fetchPrograms() async {
    state = state.copyWith(screenStatus: ProgramScreenStatus.loading);
    try {
      final repository = ref.read(programRepositoryProvider);
      final programs = <ProgramItem>[];
      ProgramListResponse? latestPage;
      var page = 0;

      while (true) {
        final result = await repository.getPrograms(
          page: page,
          size: _programPageSize,
        );
        if (!ref.mounted) return;

        latestPage = result;
        programs.addAll(result.content.map(ProgramItem.fromSummary));
        if (result.last || result.content.isEmpty) break;
        page = result.page + 1;
      }

      state = state.copyWith(
        screenStatus: ProgramScreenStatus.loaded,
        programs: programs,
        currentPage: latestPage.page,
        totalElements: latestPage.totalElements,
        totalPages: latestPage.totalPages,
        hasMore: !latestPage.last,
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(screenStatus: ProgramScreenStatus.networkError);
    }
  }
}

ProgramType programTypeFrom(String raw) => switch (raw) {
  'EDUCATION' => ProgramType.education,
  _ => ProgramType.specialLecture,
};

ProgramRecruitmentStatus programRecruitmentStatusFrom(String raw) =>
    switch (raw) {
      'DRAFT' => ProgramRecruitmentStatus.upcoming,
      'PUBLISHED' => ProgramRecruitmentStatus.recruiting,
      'CLOSED' => ProgramRecruitmentStatus.closed,
      'DELETED' => ProgramRecruitmentStatus.deleted,
      _ => ProgramRecruitmentStatus.closed,
    };

String _textOrFallback(String? value, String fallback) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? fallback : trimmed;
}

String _dateTimeRangeLabel(DateTime? start, DateTime? end) {
  if (start == null && end == null) return '일정 미정';
  if (start == null) return '${_dateLabel(end!)} ${_timeLabel(end)}';
  if (end == null) return '${_dateLabel(start)} ${_timeLabel(start)}';
  if (_isSameDate(start, end)) {
    return '${_dateLabel(start)} ${_timeLabel(start)}-${_timeLabel(end)}';
  }
  return '${_dateLabel(start)} ${_timeLabel(start)} - '
      '${_dateLabel(end)} ${_timeLabel(end)}';
}

String _dateRangeLabel(DateTime? start, DateTime? end) {
  if (start == null && end == null) return '신청 기간 미정';
  if (start == null) return _fullDateLabel(end!);
  if (end == null) return _fullDateLabel(start);
  return '${_fullDateLabel(start)} - ${_fullDateLabel(end)}';
}

String _dateLabel(DateTime value) {
  return '${value.month.toString().padLeft(2, '0')}.'
      '${value.day.toString().padLeft(2, '0')}';
}

String _fullDateLabel(DateTime value) {
  return '${value.year}.'
      '${value.month.toString().padLeft(2, '0')}.'
      '${value.day.toString().padLeft(2, '0')}';
}

String _timeLabel(DateTime value) {
  return '${value.hour.toString().padLeft(2, '0')}:'
      '${value.minute.toString().padLeft(2, '0')}';
}

bool _isSameDate(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
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
