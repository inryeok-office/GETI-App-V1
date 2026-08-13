import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_detail_view_model.g.dart';

class JobDetail {
  const JobDetail({
    required this.recruitmentPeriod,
    required this.applicationTypeLabel,
    required this.description,
    required this.responsibilities,
    required this.qualifications,
    required this.preferredQualifications,
    required this.workConditions,
    required this.hiringProcess,
    this.sourceName,
    this.externalUrl,
    this.targetAudience,
  });

  final String recruitmentPeriod;
  final String applicationTypeLabel;
  final String description;
  final List<String> responsibilities;
  final List<String> qualifications;
  final List<String> preferredQualifications;
  final List<String> workConditions;
  final List<String> hiringProcess;

  /// 외부 공고에서만 사용됩니다.
  final String? sourceName;
  final String? externalUrl;

  /// 학교 공고에서만 사용됩니다.
  final String? targetAudience;
}

class JobDetailViewState {
  const JobDetailViewState({this.job, this.detail});

  final JobItem? job;
  final JobDetail? detail;
}

@riverpod
class JobDetailViewModel extends _$JobDetailViewModel {
  @override
  JobDetailViewState build(String jobId) {
    // 목록과 동일한 jobViewModelProvider의 jobs를 조회해, 목록에서 본 공고와
    // 상세에서 찾는 공고가 서로 다른 소스로 갈라지지 않도록 합니다. 상세
    // 전용 부가 정보(mockJobDetails)만 별도로 조회합니다.
    final jobs = ref.watch(jobViewModelProvider).jobs;
    final job = jobs.where((job) => job.id == jobId).firstOrNull;
    return JobDetailViewState(job: job, detail: mockJobDetails[jobId]);
  }
}

const mockJobDetails = <String, JobDetail>{
  'kepco-intern': JobDetail(
    recruitmentPeriod: '2026.07.20 ~ 2026.08.14',
    applicationTypeLabel: '교내 지원서 작성',
    targetAudience: '광주소프트웨어마이스터고 3학년 재학생',
    description: '한국전력공사에서 고졸 채용형 인턴을 모집합니다. 우수 인턴은 정규직 전환 기회가 제공됩니다.',
    responsibilities: ['전력 IT 시스템 운영 지원', '사내 데이터 정리 및 보고서 작성', '현업 부서 실무 보조'],
    qualifications: ['고등학교 졸업 예정자 또는 졸업자', '광주소프트웨어마이스터고 재학생'],
    preferredQualifications: ['컴퓨터활용능력 자격증 보유', '전공 관련 프로젝트 경험'],
    workConditions: [
      '근무 형태: 채용형 인턴 (6개월)',
      '근무 지역: 서울',
      '모집 기간: 2026.07.20 ~ 2026.08.14',
    ],
    hiringProcess: ['서류 심사', '면접', '최종 합격'],
  ),
  'naver-cloud-intern': JobDetail(
    recruitmentPeriod: '2026.07.20 ~ 2026.08.20',
    applicationTypeLabel: '외부 지원',
    sourceName: '네이버 채용',
    externalUrl: 'recruit.navercorp.com',
    description: '네이버클라우드의 AI 서비스 개발 프로젝트에 참여할 인턴을 모집합니다.',
    responsibilities: [
      'AI 기반 웹서비스 기능 개발',
      '프론트엔드 컴포넌트 구현',
      'API 연동 및 테스트',
      '팀 코드 리뷰 참여',
    ],
    qualifications: [
      '고등학교 졸업 예정자 또는 졸업자',
      'JavaScript 기본 이해',
      'Git을 활용한 협업 경험',
    ],
    preferredQualifications: ['React 또는 Next.js 프로젝트 경험', '개인 포트폴리오 보유'],
    workConditions: [
      '근무 형태: 체험형 인턴',
      '근무 지역: 경기도 성남시',
      '모집 기간: 2026.07.20 ~ 2026.08.20',
    ],
    hiringProcess: ['서류 심사', '면접', '최종 합격'],
  ),
  'woowa-frontend': JobDetail(
    recruitmentPeriod: '2026.07.01 ~ 2026.08.14',
    applicationTypeLabel: '외부 지원',
    sourceName: '우아한형제들 채용',
    externalUrl: 'career.woowahan.com',
    description: '배달의민족을 만드는 우아한형제들에서 프론트엔드 주니어 개발자를 채용합니다.',
    responsibilities: ['서비스 프론트엔드 개발', '컴포넌트 라이브러리 유지보수'],
    qualifications: ['웹 프론트엔드 개발 경험'],
    preferredQualifications: ['TypeScript, React 경험'],
    workConditions: [
      '근무 형태: 정규직',
      '근무 지역: 서울',
      '모집 기간: 2026.07.01 ~ 2026.08.14',
    ],
    hiringProcess: ['서류 심사', '코딩 테스트', '면접'],
  ),
  'gsw-portfolio': JobDetail(
    recruitmentPeriod: '2026.07.15 ~ 2026.08.31',
    applicationTypeLabel: '교내 지원서 작성',
    targetAudience: '광주소프트웨어마이스터고 졸업예정자',
    description: '교내 MOU 연계 기업이 포트폴리오 우수자를 대상으로 정규직 채용을 진행합니다.',
    responsibilities: ['제품 개발팀 실무 투입', '포트폴리오 기반 과제 수행'],
    qualifications: ['졸업 예정자', '개인 포트폴리오 보유'],
    preferredQualifications: ['수상 경력 또는 대외 활동 경험'],
    workConditions: [
      '근무 형태: 정규직',
      '근무 지역: 광주',
      '모집 기간: 2026.07.15 ~ 2026.08.31',
    ],
    hiringProcess: ['서류 심사', '포트폴리오 심사', '면접', '최종 합격'],
  ),
};
