import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_view_model.g.dart';

enum JobScreenStatus { loaded, loading, networkError }

enum JobSource { school, external }

class JobItem {
  const JobItem({
    required this.id,
    required this.companyName,
    required this.title,
    required this.source,
    required this.sourceDescriptor,
    required this.location,
    required this.jobType,
    required this.deadlineLabel,
    this.dDayLabel,
    this.isClosed = false,
    this.isPublic = true,
    this.isDeleted = false,
    this.canApply = true,
    this.eligibilityReason,
  });

  final String id;
  final String companyName;
  final String title;
  final JobSource source;
  final String sourceDescriptor;
  final String location;
  final String jobType;
  final String deadlineLabel;
  final String? dDayLabel;
  final bool isClosed;

  /// 비공개 처리된 공고입니다. 목록/검색 어디에도 노출되지 않습니다.
  final bool isPublic;

  /// 삭제된 공고입니다. 목록/검색 어디에도 노출되지 않습니다.
  final bool isDeleted;

  /// 마감 여부와 별개로, 자격 요건 등으로 지원이 불가능한지 나타냅니다.
  final bool canApply;

  /// canApply가 false일 때 상세 화면에 표시할 사유입니다.
  final String? eligibilityReason;

  /// dDayLabel("D-7")에서 남은 일수를 파싱합니다. 형식이 다르면 null입니다.
  int? get remainingDays {
    final label = dDayLabel;
    if (label == null || !label.startsWith('D-')) return null;
    return int.tryParse(label.substring(2));
  }
}

const deadlineSoonThresholdDays = 7;

class JobViewState {
  const JobViewState({
    this.screenStatus = JobScreenStatus.loaded,
    this.jobs = mockJobs,
    this.searchQuery = '',
    this.bookmarkedJobIds = const {},
    this.typeFilter,
    this.sourceFilter,
    this.deadlineSoonOnly = false,
  });

  final JobScreenStatus screenStatus;
  final List<JobItem> jobs;
  final String searchQuery;
  final Set<String> bookmarkedJobIds;
  final String? typeFilter;
  final JobSource? sourceFilter;
  final bool deadlineSoonOnly;

  /// 비공개·삭제 공고를 제외한, 필터 대상이 되는 공고 목록입니다.
  List<JobItem> get _publishedJobs =>
      jobs.where((job) => job.isPublic && !job.isDeleted).toList();

  List<String> get availableTypes =>
      _publishedJobs.map((job) => job.jobType).toSet().toList();

  List<JobItem> get visibleJobs {
    final query = searchQuery.trim();
    return _publishedJobs
        .where((job) {
          final matchesQuery =
              query.isEmpty ||
              job.title.contains(query) ||
              job.companyName.contains(query);
          final matchesType = typeFilter == null || job.jobType == typeFilter;
          final matchesSource =
              sourceFilter == null || job.source == sourceFilter;
          final matchesDeadline =
              !deadlineSoonOnly ||
              (job.remainingDays != null &&
                  job.remainingDays! <= deadlineSoonThresholdDays);
          return matchesQuery &&
              matchesType &&
              matchesSource &&
              matchesDeadline;
        })
        .toList(growable: false);
  }

  List<JobItem> get bookmarkedJobs =>
      jobs.where((job) => bookmarkedJobIds.contains(job.id)).toList();

  JobViewState copyWith({
    JobScreenStatus? screenStatus,
    List<JobItem>? jobs,
    String? searchQuery,
    Set<String>? bookmarkedJobIds,
    bool clearTypeFilter = false,
    String? typeFilter,
    bool clearSourceFilter = false,
    JobSource? sourceFilter,
    bool? deadlineSoonOnly,
  }) => JobViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    jobs: jobs ?? this.jobs,
    searchQuery: searchQuery ?? this.searchQuery,
    bookmarkedJobIds: bookmarkedJobIds ?? this.bookmarkedJobIds,
    typeFilter: clearTypeFilter ? null : (typeFilter ?? this.typeFilter),
    sourceFilter: clearSourceFilter
        ? null
        : (sourceFilter ?? this.sourceFilter),
    deadlineSoonOnly: deadlineSoonOnly ?? this.deadlineSoonOnly,
  );
}

@riverpod
class JobViewModel extends _$JobViewModel {
  @override
  JobViewState build() => const JobViewState();

  void updateSearchQuery(String query) =>
      state = state.copyWith(searchQuery: query);

  void updateTypeFilter(String? type) => state = type == null
      ? state.copyWith(clearTypeFilter: true)
      : state.copyWith(typeFilter: type);

  void updateSourceFilter(JobSource? source) => state = source == null
      ? state.copyWith(clearSourceFilter: true)
      : state.copyWith(sourceFilter: source);

  void updateDeadlineSoonOnly(bool value) =>
      state = state.copyWith(deadlineSoonOnly: value);

  void toggleBookmark(String jobId) {
    final updated = {...state.bookmarkedJobIds};
    if (!updated.add(jobId)) {
      updated.remove(jobId);
    }
    state = state.copyWith(bookmarkedJobIds: updated);
  }

  Future<void> retry() async {
    state = state.copyWith(screenStatus: JobScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = state.copyWith(screenStatus: JobScreenStatus.loaded);
  }
}

const mockJobs = [
  JobItem(
    id: 'kepco-intern',
    companyName: '한국전력공사',
    title: '2026년 고졸 채용형 인턴 모집',
    source: JobSource.school,
    sourceDescriptor: 'MOU · 교내 모집',
    location: '서울',
    jobType: '인턴',
    deadlineLabel: '08.14 마감',
    dDayLabel: 'D-17',
  ),
  JobItem(
    id: 'naver-cloud-intern',
    companyName: '네이버클라우드',
    title: '2026 AI 서비스 개발 인턴십 참가자 모집',
    source: JobSource.external,
    sourceDescriptor: '외부 공고 · 기업 채용 페이지',
    location: '경기 성남',
    jobType: '인턴',
    deadlineLabel: '08.20 마감',
    dDayLabel: 'D-23',
  ),
  JobItem(
    id: 'woowa-frontend',
    companyName: '우아한형제들',
    title: '웹 프론트엔드 주니어 개발자 채용',
    source: JobSource.external,
    sourceDescriptor: '외부 공고 · 기업 채용 페이지',
    location: '서울',
    jobType: '신입',
    deadlineLabel: '08.14',
    isClosed: true,
  ),
  JobItem(
    id: 'gsw-portfolio',
    companyName: '광주소프트웨어마이스터고',
    title: '교내 연계 기업 포트폴리오 우수자 채용',
    source: JobSource.school,
    sourceDescriptor: 'MOU · 교내 모집',
    location: '광주',
    jobType: '정규직',
    deadlineLabel: '08.31 마감',
    dDayLabel: 'D-34',
  ),
  JobItem(
    id: 'toss-payments-fe',
    companyName: '토스페이먼츠',
    title: '3학년 대상 프론트엔드 채용형 인턴',
    source: JobSource.school,
    sourceDescriptor: 'MOU · 교내 모집',
    location: '서울',
    jobType: '인턴',
    deadlineLabel: '08.25 마감',
    dDayLabel: 'D-3',
    canApply: false,
    eligibilityReason: '3학년 재학생만 지원할 수 있는 공고입니다.',
  ),
  JobItem(
    id: 'hidden-internal-review',
    companyName: '비공개 검토 기업',
    title: '검토 중인 비공개 공고',
    source: JobSource.school,
    sourceDescriptor: 'MOU · 교내 모집',
    location: '서울',
    jobType: '인턴',
    deadlineLabel: '09.01 마감',
    dDayLabel: 'D-10',
    isPublic: false,
  ),
  JobItem(
    id: 'removed-partner-role',
    companyName: '계약 종료 기업',
    title: '삭제된 채용 공고',
    source: JobSource.external,
    sourceDescriptor: '외부 공고 · 기업 채용 페이지',
    location: '서울',
    jobType: '신입',
    deadlineLabel: '07.30 마감',
    isDeleted: true,
  ),
];
