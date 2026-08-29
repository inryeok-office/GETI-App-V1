import 'dart:async';

import 'package:geti_app/features/application/data/repository/application_repository_impl.dart';
import 'package:geti_app/features/application/domain/model/application_summary.dart';
import 'package:geti_app/features/application/domain/model/job_application_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'application_date_formatter.dart';
import 'application_view_model.dart';

part 'application_detail_view_model.g.dart';

enum ApplicationDetailScreenStatus { loaded, loading, empty, networkError }

enum ApplicationDetailVariant {
  reviewing,
  revisionRequested,
  submitted,
  interviewing,
  accepted,
  rejected,
  cancelled,
  deleted,
}

class ApplicationStatusHistory {
  const ApplicationStatusHistory({
    required this.label,
    required this.occurredAt,
  });

  final String label;
  final String occurredAt;
}

class ApplicationDetailAnswer {
  const ApplicationDetailAnswer({required this.title, required this.value});

  final String title;
  final String value;
}

class ApplicationDetailFile {
  const ApplicationDetailFile({
    required this.fileId,
    required this.name,
    required this.description,
    required this.downloadUrl,
  });

  final int? fileId;
  final String name;
  final String description;
  final String? downloadUrl;
}

class ApplicationDetail {
  const ApplicationDetail({
    required this.id,
    required this.companyName,
    required this.positionName,
    required this.variant,
    required this.submittedAt,
    required this.answers,
    required this.files,
    required this.history,
    this.availableActions = const [],
    this.noticeTitle,
    this.noticeDescription,
  });

  final String id;
  final String companyName;
  final String positionName;
  final ApplicationDetailVariant variant;
  final String submittedAt;
  final List<ApplicationDetailAnswer> answers;
  final List<ApplicationDetailFile> files;
  final List<ApplicationStatusHistory> history;
  final List<String> availableActions;
  final String? noticeTitle;
  final String? noticeDescription;

  ApplicationDetail copyWith({
    ApplicationDetailVariant? variant,
    List<ApplicationStatusHistory>? history,
    String? noticeTitle,
    String? noticeDescription,
    bool clearNotice = false,
  }) {
    return ApplicationDetail(
      id: id,
      companyName: companyName,
      positionName: positionName,
      variant: variant ?? this.variant,
      submittedAt: submittedAt,
      answers: answers,
      files: files,
      history: history ?? this.history,
      availableActions: availableActions,
      noticeTitle: clearNotice ? null : (noticeTitle ?? this.noticeTitle),
      noticeDescription: clearNotice
          ? null
          : (noticeDescription ?? this.noticeDescription),
    );
  }
}

class ApplicationDetailViewState {
  const ApplicationDetailViewState({
    this.screenStatus = ApplicationDetailScreenStatus.loaded,
    this.detail,
  });

  final ApplicationDetailScreenStatus screenStatus;
  final ApplicationDetail? detail;

  ApplicationDetailViewState copyWith({
    ApplicationDetailScreenStatus? screenStatus,
    ApplicationDetail? detail,
  }) {
    return ApplicationDetailViewState(
      screenStatus: screenStatus ?? this.screenStatus,
      detail: detail ?? this.detail,
    );
  }
}

@riverpod
class ApplicationDetailViewModel extends _$ApplicationDetailViewModel {
  @override
  ApplicationDetailViewState build(String applicationId) {
    unawaited(Future<void>.microtask(_loadDetail));
    return const ApplicationDetailViewState(
      screenStatus: ApplicationDetailScreenStatus.loading,
    );
  }

  Future<void> retry() => _loadDetail();

  Future<void> _loadDetail() async {
    state = const ApplicationDetailViewState(
      screenStatus: ApplicationDetailScreenStatus.loading,
    );
    final parsedApplicationId = int.tryParse(applicationId);
    if (parsedApplicationId == null) {
      state = const ApplicationDetailViewState(
        screenStatus: ApplicationDetailScreenStatus.empty,
      );
      return;
    }

    try {
      final repository = ref.read(applicationRepositoryProvider);
      final domain = await repository.getApplicationDetail(parsedApplicationId);
      if (!ref.mounted) return;
      if (domain == null) {
        state = const ApplicationDetailViewState(
          screenStatus: ApplicationDetailScreenStatus.empty,
        );
        return;
      }

      final detail = _toPresentation(domain);
      state = ApplicationDetailViewState(
        screenStatus: detail == null
            ? ApplicationDetailScreenStatus.empty
            : ApplicationDetailScreenStatus.loaded,
        detail: detail,
      );
    } on Object {
      if (!ref.mounted) return;
      state = const ApplicationDetailViewState(
        screenStatus: ApplicationDetailScreenStatus.networkError,
      );
    }
  }

  ApplicationDetail? _toPresentation(JobApplicationDetail detail) {
    final variant = _toVariant(detail.status);
    if (variant == null) return null;

    final answerByFieldId = <String, JobApplicationAnswer>{
      for (final answer in detail.answers)
        if (answer.fieldId != null) answer.fieldId!: answer,
    };
    final questions = [...detail.questions]
      ..sort((left, right) => (left.order ?? 0).compareTo(right.order ?? 0));
    final answers = <ApplicationDetailAnswer>[];
    for (final question in questions) {
      if (question.type == ApplicationQuestionType.file) continue;
      final fieldId = question.fieldId;
      final title = question.title?.trim();
      if (fieldId == null || title == null || title.isEmpty) continue;
      final value = _formatAnswerValue(answerByFieldId[fieldId]?.value);
      if (value == null || value.isEmpty) continue;
      answers.add(ApplicationDetailAnswer(title: title, value: value));
    }

    final files = detail.files
        .where((file) => file.originalName?.trim().isNotEmpty ?? false)
        .map((file) {
          final size = formatApplicationFileSize(file.size);
          return ApplicationDetailFile(
            fileId: file.fileId,
            name: file.originalName!.trim(),
            description: size.isEmpty ? '다운로드' : '$size · 다운로드',
            downloadUrl: file.downloadUrl,
          );
        })
        .toList(growable: false);

    final reason = detail.statusReason?.trim();
    final isRevision = variant == ApplicationDetailVariant.revisionRequested;
    final isCancelled = variant == ApplicationDetailVariant.cancelled;
    return ApplicationDetail(
      id: detail.applicationId.toString(),
      companyName: detail.companyName?.trim() ?? '',
      positionName: detail.jobTitle?.trim() ?? '',
      variant: variant,
      submittedAt: formatApplicationDateTime(detail.submittedAt),
      answers: List.unmodifiable(answers),
      files: List.unmodifiable(files),
      history: const [],
      availableActions: List.unmodifiable(detail.availableActions),
      noticeTitle: isRevision && reason != null && reason.isNotEmpty
          ? '수정·보완 요청'
          : isCancelled
          ? '취소 완료'
          : null,
      noticeDescription: isRevision && reason != null && reason.isNotEmpty
          ? reason
          : isCancelled
          ? '해당 지원이 취소되었습니다.'
          : null,
    );
  }

  ApplicationDetailVariant? _toVariant(ApplicationStatus status) {
    return switch (status) {
      ApplicationStatus.draft => null,
      ApplicationStatus.submitted => ApplicationDetailVariant.submitted,
      ApplicationStatus.editRequested ||
      ApplicationStatus.editAllowed ||
      ApplicationStatus.revisionRequested =>
        ApplicationDetailVariant.revisionRequested,
      ApplicationStatus.approved => ApplicationDetailVariant.accepted,
      ApplicationStatus.rejected => ApplicationDetailVariant.rejected,
      ApplicationStatus.forwarded => ApplicationDetailVariant.reviewing,
      ApplicationStatus.withdrawn => ApplicationDetailVariant.cancelled,
    };
  }

  String? _formatAnswerValue(Object? value) {
    if (value is String) return value.trim();
    if (value is num || value is bool) return value.toString();
    if (value is List<Object?> &&
        value.every((item) => item is String || item is num || item is bool)) {
      return value.map((item) => item.toString()).join(', ');
    }
    return null;
  }

  void withdrawApplication() {
    final detail = state.detail;
    if (detail == null ||
        (detail.variant != ApplicationDetailVariant.submitted &&
            detail.variant != ApplicationDetailVariant.revisionRequested)) {
      return;
    }

    state = state.copyWith(
      detail: detail.copyWith(
        variant: ApplicationDetailVariant.cancelled,
        history: [
          ...detail.history,
          const ApplicationStatusHistory(
            label: '지원 취소',
            occurredAt: '08.08 15:20',
          ),
        ],
        noticeTitle: '취소 완료',
        noticeDescription: '해당 지원이 취소되었습니다.',
      ),
    );
    ref
        .read(applicationViewModelProvider.notifier)
        .updateApplicationStatus(
          detail.id,
          ApplicationProgressStatus.cancelled,
        );
  }

  void resubmitApplication() {
    final detail = state.detail;
    if (detail == null ||
        detail.variant != ApplicationDetailVariant.revisionRequested) {
      return;
    }

    state = state.copyWith(
      detail: detail.copyWith(
        variant: ApplicationDetailVariant.submitted,
        history: [
          ...detail.history,
          const ApplicationStatusHistory(
            label: '재제출 완료',
            occurredAt: '08.02 09:30',
          ),
        ],
        clearNotice: true,
      ),
    );
    ref
        .read(applicationViewModelProvider.notifier)
        .updateApplicationStatus(
          detail.id,
          ApplicationProgressStatus.submitted,
        );
  }
}

const _mockFile = ApplicationDetailFile(
  fileId: 1,
  name: 'portfolio.pdf',
  description: '1.8MB · 다운로드',
  downloadUrl: null,
);
const _submittedHistory = [
  ApplicationStatusHistory(label: '제출 완료', occurredAt: '08.01 14:32'),
];

const _revisionHistory = [
  ApplicationStatusHistory(label: '제출 완료', occurredAt: '08.01 14:32'),
  ApplicationStatusHistory(label: '수정 요청', occurredAt: '08.02 09:18'),
];
const mockApplicationDetails = <String, ApplicationDetail>{
  'revision': ApplicationDetail(
    id: 'revision',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.revisionRequested,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _revisionHistory,
    noticeTitle: '수정·보완 요청',
    noticeDescription: '지원 동기의 프로젝트 경험을 조금 더 구체적으로 작성해 주세요.',
  ),
  'submitted': ApplicationDetail(
    id: 'submitted',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.submitted,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
  ),
  'reviewing': ApplicationDetail(
    id: 'reviewing',
    companyName: '토스페이먼츠',
    positionName: 'Frontend Developer',
    variant: ApplicationDetailVariant.reviewing,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '프론트엔드 개발 역량을 더 성장시키고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
  ),
  'interviewing': ApplicationDetail(
    id: 'interviewing',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.interviewing,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
  ),
  'accepted': ApplicationDetail(
    id: 'accepted',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.accepted,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
  ),
  'rejected': ApplicationDetail(
    id: 'rejected',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.rejected,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
  ),
  'cancelled': ApplicationDetail(
    id: 'cancelled',
    companyName: '토스페이먼츠',
    positionName: 'Frontend Developer',
    variant: ApplicationDetailVariant.cancelled,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
    noticeTitle: '취소 완료',
    noticeDescription: '해당 지원이 취소되었습니다.',
  ),
  'deleted': ApplicationDetail(
    id: 'deleted',
    companyName: '네이버클라우드',
    positionName: '삭제된 공고',
    variant: ApplicationDetailVariant.deleted,
    submittedAt: '2026.08.01 14:32',
    answers: [
      ApplicationDetailAnswer(
        title: '지원 동기',
        value: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
      ),
    ],
    files: [_mockFile],
    history: _submittedHistory,
    noticeTitle: '삭제된 공고',
    noticeDescription: '해당 공고는 삭제되어 상세 내용을 확인할 수 없습니다. 지원 진행 상태는 유지됩니다.',
  ),
  'ended': ApplicationDetail(
    id: 'ended',
    companyName: '네이버클라우드',
    positionName: '종료된 공고',
    variant: ApplicationDetailVariant.deleted,
    submittedAt: '2026.07.20 10:00',
    answers: [
      ApplicationDetailAnswer(title: '지원 동기', value: '공고 종료 전 제출한 지원서입니다.'),
    ],
    files: [_mockFile],
    history: _submittedHistory,
    noticeTitle: '종료된 공고',
    noticeDescription: '해당 공고는 종료되어 상세 내용을 확인할 수 없습니다. 지원 진행 상태는 유지됩니다.',
  ),
};
