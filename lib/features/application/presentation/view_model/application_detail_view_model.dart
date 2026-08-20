import 'package:riverpod_annotation/riverpod_annotation.dart';

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

class ApplicationDetail {
  const ApplicationDetail({
    required this.id,
    required this.companyName,
    required this.positionName,
    required this.variant,
    required this.submittedAt,
    required this.answer,
    required this.fileName,
    required this.fileDescription,
    required this.history,
    this.noticeTitle,
    this.noticeDescription,
  });

  final String id;
  final String companyName;
  final String positionName;
  final ApplicationDetailVariant variant;
  final String submittedAt;
  final String answer;
  final String fileName;
  final String fileDescription;
  final List<ApplicationStatusHistory> history;
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
      answer: answer,
      fileName: fileName,
      fileDescription: fileDescription,
      history: history ?? this.history,
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
    final detail = mockApplicationDetails[applicationId];
    return ApplicationDetailViewState(
      screenStatus: detail == null
          ? ApplicationDetailScreenStatus.empty
          : ApplicationDetailScreenStatus.loaded,
      detail: detail,
    );
  }

  Future<void> retry() async {
    state = state.copyWith(screenStatus: ApplicationDetailScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = state.copyWith(
      screenStatus: state.detail == null
          ? ApplicationDetailScreenStatus.empty
          : ApplicationDetailScreenStatus.loaded,
    );
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
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
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
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
    history: _submittedHistory,
  ),
  'reviewing': ApplicationDetail(
    id: 'reviewing',
    companyName: '토스페이먼츠',
    positionName: 'Frontend Developer',
    variant: ApplicationDetailVariant.reviewing,
    submittedAt: '2026.08.01 14:32',
    answer: '프론트엔드 개발 역량을 더 성장시키고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
    history: _submittedHistory,
  ),
  'interviewing': ApplicationDetail(
    id: 'interviewing',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.interviewing,
    submittedAt: '2026.08.01 14:32',
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
    history: _submittedHistory,
  ),
  'accepted': ApplicationDetail(
    id: 'accepted',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.accepted,
    submittedAt: '2026.08.01 14:32',
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
    history: _submittedHistory,
  ),
  'rejected': ApplicationDetail(
    id: 'rejected',
    companyName: '당근',
    positionName: '웹 프론트엔드 인턴',
    variant: ApplicationDetailVariant.rejected,
    submittedAt: '2026.08.01 14:32',
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
    history: _submittedHistory,
  ),
  'cancelled': ApplicationDetail(
    id: 'cancelled',
    companyName: '토스페이먼츠',
    positionName: 'Frontend Developer',
    variant: ApplicationDetailVariant.cancelled,
    submittedAt: '2026.08.01 14:32',
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
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
    answer: '사용자 문제를 해결하는 프론트엔드 개발자가 되고 싶어 지원했습니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
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
    answer: '공고 종료 전 제출한 지원서입니다.',
    fileName: 'portfolio.pdf',
    fileDescription: '1.8MB · 다운로드',
    history: _submittedHistory,
    noticeTitle: '종료된 공고',
    noticeDescription: '해당 공고는 종료되어 상세 내용을 확인할 수 없습니다. 지원 진행 상태는 유지됩니다.',
  ),
};
