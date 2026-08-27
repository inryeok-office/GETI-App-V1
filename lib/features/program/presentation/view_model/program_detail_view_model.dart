import 'dart:async';

import 'package:geti_app/features/program/data/dto/program_detail_response.dart';
import 'package:geti_app/features/program/data/program_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'program_type.dart';

part 'program_detail_view_model.g.dart';

enum ProgramDetailScreenStatus {
  loaded,
  loading,
  notFound,
  deleted,
  networkError,
}

enum ProgramDetailActionStatus {
  available,
  applying,
  concurrencyFailure,
  upcoming,
  full,
  closed,
  applied,
  cancelling,
  cancelled,
  cancelFailure,
}

enum ProgramOperationalStatus { active, cancelled, deleted }

enum ProgramApplicationOutcome { success, concurrencyFailure }

@riverpod
ProgramApplicationOutcome programApplicationOutcome(Ref ref) {
  return ProgramApplicationOutcome.success;
}

enum ProgramCancellationOutcome { success, failure }

@riverpod
ProgramCancellationOutcome programCancellationOutcome(Ref ref) {
  return ProgramCancellationOutcome.success;
}

class ProgramDetail {
  const ProgramDetail({
    required this.id,
    required this.title,
    required this.actionStatus,
    required this.type,
    this.operationalStatus = ProgramOperationalStatus.active,
    this.recruitmentBadge = '모집 중',
    this.applicationPeriod = '신청 08.01-08.10',
    this.viewCount = '조회수 -',
    this.schedule = '일정 미정',
    this.location = '장소 미정',
    this.capacity = '정원 미정',
    this.description = '',
    this.recruitmentCapacity = '정원 미정',
    this.currentApplicants = '0명',
    this.remainingCapacity = '남은 인원 미정',
    this.admissionType = '선착순 아님',
    this.cancellationDate = '2026.08.08 (금) 15:20',
    this.cancellationReason = '사용자 취소',
    this.applicationSubmittedAt = '확인 불가',
    this.programStatusChangedAt = '확인 불가',
    this.programCancellationReason = '운영 사정으로 프로그램이 취소되었습니다.',
  });

  factory ProgramDetail.fromResponse(ProgramDetailResponse response) {
    return ProgramDetail(
      id: response.programId.toString(),
      title: response.title,
      actionStatus: programDetailActionStatusFrom(response),
      operationalStatus: response.status == 'DELETED'
          ? ProgramOperationalStatus.deleted
          : ProgramOperationalStatus.active,
      type: _programTypeFrom(response.programType),
      recruitmentBadge: _recruitmentBadgeFrom(response.status),
      applicationPeriod: _applicationPeriodLabel(
        response.applicationStartAt,
        response.applicationEndAt,
      ),
      schedule: _dateTimeRangeLabel(response.startAt, response.endAt),
      location: _textOrFallback(response.location, '장소 미정'),
      capacity: _countLabel(response.capacity, '정원 미정'),
      description: _textOrFallback(response.content, '프로그램 설명이 없습니다.'),
      recruitmentCapacity: _countLabel(response.capacity, '정원 미정'),
      currentApplicants: '${response.currentApplicants}명',
      remainingCapacity: _countLabel(response.remainingCapacity, '남은 인원 미정'),
      admissionType: response.firstComeServed ? '선착순' : '선착순 아님',
    );
  }

  factory ProgramDetail.deletedFallback(String programId) {
    return ProgramDetail(
      id: programId,
      title: '삭제된 프로그램입니다.',
      actionStatus: ProgramDetailActionStatus.applied,
      operationalStatus: ProgramOperationalStatus.deleted,
      type: ProgramType.specialLecture,
      recruitmentBadge: '삭제됨',
    );
  }

  final String id;
  final String title;
  final ProgramDetailActionStatus actionStatus;
  final ProgramOperationalStatus operationalStatus;
  final ProgramType type;
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
  final String cancellationDate;
  final String cancellationReason;
  final String applicationSubmittedAt;
  final String programStatusChangedAt;
  final String programCancellationReason;
  String get typeLabel => type.label;

  ProgramDetail copyWith({
    ProgramDetailActionStatus? actionStatus,
    ProgramOperationalStatus? operationalStatus,
  }) {
    return ProgramDetail(
      id: id,
      title: title,
      actionStatus: actionStatus ?? this.actionStatus,
      operationalStatus: operationalStatus ?? this.operationalStatus,
      type: type,
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
      cancellationDate: cancellationDate,
      cancellationReason: cancellationReason,
      applicationSubmittedAt: applicationSubmittedAt,
      programStatusChangedAt: programStatusChangedAt,
      programCancellationReason: programCancellationReason,
    );
  }
}

class ProgramDetailViewState {
  const ProgramDetailViewState({
    this.screenStatus = ProgramDetailScreenStatus.loaded,
    this.detail,
  });

  final ProgramDetailScreenStatus screenStatus;
  final ProgramDetail? detail;

  ProgramDetailViewState copyWith({
    ProgramDetailScreenStatus? screenStatus,
    ProgramDetail? detail,
    bool clearDetail = false,
  }) {
    return ProgramDetailViewState(
      screenStatus: screenStatus ?? this.screenStatus,
      detail: clearDetail ? null : (detail ?? this.detail),
    );
  }
}

@riverpod
class ProgramDetailViewModel extends _$ProgramDetailViewModel {
  int _detailRequestVersion = 0;

  @override
  ProgramDetailViewState build(String programId) {
    unawaited(Future.microtask(_fetchProgramDetail));
    return const ProgramDetailViewState(
      screenStatus: ProgramDetailScreenStatus.loading,
    );
  }

  Future<void> retry() => _fetchProgramDetail();

  Future<void> _fetchProgramDetail() async {
    final requestVersion = ++_detailRequestVersion;
    final id = int.tryParse(programId);
    if (id == null) {
      state = const ProgramDetailViewState(
        screenStatus: ProgramDetailScreenStatus.notFound,
      );
      return;
    }

    state = state.copyWith(
      screenStatus: ProgramDetailScreenStatus.loading,
      clearDetail: true,
    );

    try {
      final response = await ref
          .read(programRepositoryProvider)
          .getProgramDetail(id);
      if (!ref.mounted || requestVersion != _detailRequestVersion) return;

      final detail = ProgramDetail.fromResponse(response);
      state = ProgramDetailViewState(
        screenStatus:
            detail.operationalStatus == ProgramOperationalStatus.deleted
            ? ProgramDetailScreenStatus.deleted
            : ProgramDetailScreenStatus.loaded,
        detail: detail,
      );
    } on ProgramRepositoryException catch (error) {
      if (!ref.mounted || requestVersion != _detailRequestVersion) return;
      if (error.statusCode == 404 || error.code == 'PROGRAM_NOT_FOUND') {
        state = const ProgramDetailViewState(
          screenStatus: ProgramDetailScreenStatus.notFound,
        );
        return;
      }
      if (error.statusCode == 410 || error.code == 'PROGRAM_DELETED') {
        state = ProgramDetailViewState(
          screenStatus: ProgramDetailScreenStatus.deleted,
          detail: ProgramDetail.deletedFallback(programId),
        );
        return;
      }
      state = const ProgramDetailViewState(
        screenStatus: ProgramDetailScreenStatus.networkError,
      );
    } catch (_) {
      if (!ref.mounted || requestVersion != _detailRequestVersion) return;
      state = const ProgramDetailViewState(
        screenStatus: ProgramDetailScreenStatus.networkError,
      );
    }
  }

  Future<void> applyProgram() async {
    final detail = state.detail;
    if (detail == null ||
        detail.actionStatus != ProgramDetailActionStatus.available) {
      return;
    }
    _detailRequestVersion++;

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

  Future<void> cancelProgram() async {
    final detail = state.detail;
    if (detail == null ||
        (detail.actionStatus != ProgramDetailActionStatus.applied &&
            detail.actionStatus != ProgramDetailActionStatus.cancelFailure)) {
      return;
    }
    _detailRequestVersion++;

    state = state.copyWith(
      detail: detail.copyWith(
        actionStatus: ProgramDetailActionStatus.cancelling,
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;

    final currentDetail = state.detail;
    if (currentDetail == null ||
        currentDetail.actionStatus != ProgramDetailActionStatus.cancelling) {
      return;
    }

    final outcome = ref.read(programCancellationOutcomeProvider);
    state = state.copyWith(
      detail: currentDetail.copyWith(
        actionStatus: switch (outcome) {
          ProgramCancellationOutcome.success =>
            ProgramDetailActionStatus.cancelled,
          ProgramCancellationOutcome.failure =>
            ProgramDetailActionStatus.cancelFailure,
        },
      ),
    );
  }

  void closeCancelFailure() {
    final detail = state.detail;
    if (detail?.actionStatus != ProgramDetailActionStatus.cancelFailure) {
      return;
    }
    state = state.copyWith(
      screenStatus: ProgramDetailScreenStatus.loaded,
      detail: detail!.copyWith(actionStatus: ProgramDetailActionStatus.applied),
    );
  }
}

ProgramDetailActionStatus programDetailActionStatusFrom(
  ProgramDetailResponse response,
) {
  if (response.status == 'DELETED') {
    return ProgramDetailActionStatus.applied;
  }
  if (_hasAction(response, 'CANCEL') ||
      response.eligibilityReason == 'ALREADY_APPLIED') {
    return ProgramDetailActionStatus.applied;
  }
  if (response.canApply || _hasAction(response, 'APPLY')) {
    return ProgramDetailActionStatus.available;
  }

  return switch (response.eligibilityReason) {
    'PROGRAM_NOT_OPEN' ||
    'PROGRAM_NOT_PUBLISHED' => ProgramDetailActionStatus.upcoming,
    'PROGRAM_FULL' => ProgramDetailActionStatus.full,
    'PROGRAM_CLOSED' => ProgramDetailActionStatus.closed,
    _ => switch (response.status) {
      'DRAFT' => ProgramDetailActionStatus.upcoming,
      'CLOSED' => ProgramDetailActionStatus.closed,
      _ => ProgramDetailActionStatus.closed,
    },
  };
}

bool _hasAction(ProgramDetailResponse response, String action) {
  return response.availableActions.any(
    (value) => value.toUpperCase() == action,
  );
}

String _recruitmentBadgeFrom(String status) {
  return switch (status) {
    'DRAFT' => '모집 예정',
    'PUBLISHED' => '모집 중',
    'CLOSED' => '모집 종료',
    'DELETED' => '삭제됨',
    _ => '모집 상태 미정',
  };
}

String _textOrFallback(String? value, String fallback) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? fallback : trimmed;
}

String _countLabel(int? value, String fallback) {
  return value == null ? fallback : '$value명';
}

ProgramType _programTypeFrom(String raw) => switch (raw) {
  'EDUCATION' => ProgramType.education,
  _ => ProgramType.specialLecture,
};

String _dateTimeRangeLabel(DateTime? start, DateTime? end) {
  if (start == null && end == null) return '일정 미정';
  if (start == null) return '${_fullDateLabel(end!)} ${_timeLabel(end)}';
  if (end == null) return '${_fullDateLabel(start)} ${_timeLabel(start)}';
  if (_isSameDate(start, end)) {
    return '${_fullDateLabel(start)} ${_timeLabel(start)}-${_timeLabel(end)}';
  }
  return '${_fullDateLabel(start)} ${_timeLabel(start)} - '
      '${_fullDateLabel(end)} ${_timeLabel(end)}';
}

String _applicationPeriodLabel(DateTime? start, DateTime? end) {
  if (start == null && end == null) return '신청 기간 미정';
  if (start == null) return '신청 ${_shortDateLabel(end!)}';
  if (end == null) return '신청 ${_shortDateLabel(start)}';
  return '신청 ${_shortDateLabel(start)}-${_shortDateLabel(end)}';
}

String _shortDateLabel(DateTime value) {
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
