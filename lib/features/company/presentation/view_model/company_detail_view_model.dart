import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geti_app/features/company/presentation/view_model/company_view_model.dart';
import 'package:geti_app/features/job/data/job_repository.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_detail_view_model.g.dart';

class CompanyDetail {
  const CompanyDetail({
    required this.industry,
    required this.address,
    required this.description,
    required this.homepageUrl,
  });

  final String industry;
  final String address;
  final String description;
  final String homepageUrl;
}

class CompanyDetailViewState {
  const CompanyDetailViewState({
    this.company,
    this.detail,
    this.jobs = const [],
  });

  final CompanyItem? company;
  final CompanyDetail? detail;

  /// 별도로 관리하지 않고 jobViewModelProvider의 jobs를 기업명으로 필터링한
  /// 결과입니다. 목록/상세가 같은 소스를 보도록 유지합니다.
  final List<JobItem> jobs;

  CompanyDetailViewState copyWith({List<JobItem>? jobs}) =>
      CompanyDetailViewState(
        company: company,
        detail: detail,
        jobs: jobs ?? this.jobs,
      );
}

@riverpod
class CompanyDetailViewModel extends _$CompanyDetailViewModel {
  @override
  CompanyDetailViewState build(String companyId) {
    final company = mockCompanies
        .where((company) => company.id == companyId)
        .firstOrNull;
    final jobs = company == null
        ? const <JobItem>[]
        : ref
              .watch(jobViewModelProvider.select((state) => state.jobs))
              .where((job) => job.companyName == company.name && !job.isClosed)
              .toList(growable: false);
    return CompanyDetailViewState(
      company: company,
      detail: company == null ? null : mockCompanyDetails[companyId],
      jobs: jobs,
    );
  }

  /// 이 화면이 보여주는 공고 카드는 jobViewModelProvider의 현재 목록에
  /// 없을 수도 있으므로(다른 필터/페이지 상태), 그 목록에서 찾아 토글하지
  /// 않고 이 화면 자신의 jobs를 직접 갱신하면서 API를 호출합니다.
  Future<void> toggleBookmark(
    String jobId, {
    required bool currentlyBookmarked,
  }) async {
    final nextBookmarked = !currentlyBookmarked;
    _applyBookmark(jobId, nextBookmarked);
    try {
      final repository = ref.read(jobRepositoryProvider);
      final id = int.parse(jobId);
      if (nextBookmarked) {
        await repository.addBookmark(id);
      } else {
        await repository.removeBookmark(id);
      }
    } catch (_) {
      if (!ref.mounted) return;
      _applyBookmark(jobId, currentlyBookmarked);
    }
  }

  void _applyBookmark(String jobId, bool bookmarked) {
    state = state.copyWith(
      jobs: [
        for (final job in state.jobs)
          if (job.id == jobId) job.copyWith(bookmarked: bookmarked) else job,
      ],
    );
  }
}

const mockCompanyDetails = <String, CompanyDetail>{
  'naver-cloud': CompanyDetail(
    industry: 'IT 서비스',
    address: '경기도 성남시',
    description:
        '클라우드와 AI 기술을 기반으로 다양한 디지털 서비스를 제공하는 기업입니다. 안정적인 인프라와 개발 기술을 바탕으로 기업과 사용자의 디지털 전환을 지원합니다.',
    homepageUrl: 'naver-cloud.com',
  ),
  'woowa': CompanyDetail(
    industry: 'IT 서비스',
    address: '서울특별시',
    description: '배달의민족을 만드는 우아한형제들은 물류와 기술을 결합해 다양한 생활 서비스를 제공하는 기업입니다.',
    homepageUrl: 'woowahan.com',
  ),
  'kepco': CompanyDetail(
    industry: '에너지',
    address: '전라남도 나주시',
    description: '국내 최대 에너지 공기업으로, 안정적인 전력 공급과 차세대 에너지 기술을 연구·개발합니다.',
    homepageUrl: 'kepco.co.kr',
  ),
  'kakao': CompanyDetail(
    industry: 'IT 서비스',
    address: '제주특별자치도',
    description: '국민 메신저 카카오톡을 기반으로 다양한 모바일 플랫폼 서비스를 제공하는 기업입니다.',
    homepageUrl: 'kakaocorp.com',
  ),
  'nhn': CompanyDetail(
    industry: 'IT 서비스',
    address: '경기도 성남시',
    description: '게임, 커머스, 클라우드 등 다양한 IT 사업을 운영하는 기업입니다.',
    homepageUrl: 'nhn.com',
  ),
};
