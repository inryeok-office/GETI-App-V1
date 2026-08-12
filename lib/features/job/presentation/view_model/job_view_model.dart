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
}

class JobViewState {
  const JobViewState({
    this.screenStatus = JobScreenStatus.loaded,
    this.jobs = mockJobs,
    this.searchQuery = '',
    this.bookmarkedJobIds = const {},
  });

  final JobScreenStatus screenStatus;
  final List<JobItem> jobs;
  final String searchQuery;
  final Set<String> bookmarkedJobIds;

  List<JobItem> get visibleJobs {
    final query = searchQuery.trim();
    if (query.isEmpty) return jobs;
    return jobs
        .where(
          (job) => job.title.contains(query) || job.companyName.contains(query),
        )
        .toList(growable: false);
  }

  List<JobItem> get bookmarkedJobs =>
      jobs.where((job) => bookmarkedJobIds.contains(job.id)).toList();

  JobViewState copyWith({
    JobScreenStatus? screenStatus,
    List<JobItem>? jobs,
    String? searchQuery,
    Set<String>? bookmarkedJobIds,
  }) => JobViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    jobs: jobs ?? this.jobs,
    searchQuery: searchQuery ?? this.searchQuery,
    bookmarkedJobIds: bookmarkedJobIds ?? this.bookmarkedJobIds,
  );
}

@riverpod
class JobViewModel extends _$JobViewModel {
  @override
  JobViewState build() => const JobViewState();

  void updateSearchQuery(String query) =>
      state = state.copyWith(searchQuery: query);

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
];
