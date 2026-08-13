import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_view_model.g.dart';

enum CompanyScreenStatus { loaded, loading, networkError }

class CompanyItem {
  const CompanyItem({
    required this.id,
    required this.name,
    required this.typeLabel,
    required this.isMou,
  });

  final String id;
  final String name;
  final String typeLabel;
  final bool isMou;
}

class CompanyViewState {
  const CompanyViewState({
    this.screenStatus = CompanyScreenStatus.loaded,
    this.companies = mockCompanies,
    this.searchQuery = '',
  });

  final CompanyScreenStatus screenStatus;
  final List<CompanyItem> companies;
  final String searchQuery;

  List<CompanyItem> get visibleCompanies {
    final query = searchQuery.trim();
    if (query.isEmpty) return companies;
    return companies
        .where((company) => company.name.contains(query))
        .toList(growable: false);
  }

  CompanyViewState copyWith({
    CompanyScreenStatus? screenStatus,
    List<CompanyItem>? companies,
    String? searchQuery,
  }) => CompanyViewState(
    screenStatus: screenStatus ?? this.screenStatus,
    companies: companies ?? this.companies,
    searchQuery: searchQuery ?? this.searchQuery,
  );
}

@riverpod
class CompanyViewModel extends _$CompanyViewModel {
  @override
  CompanyViewState build() => const CompanyViewState();

  void updateSearchQuery(String query) =>
      state = state.copyWith(searchQuery: query);

  Future<void> retry() async {
    state = state.copyWith(screenStatus: CompanyScreenStatus.loading);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!ref.mounted) return;
    state = state.copyWith(screenStatus: CompanyScreenStatus.loaded);
  }
}

/// 기업 상세의 "채용 중인 공고"는 이 목록을 다시 만들지 않고, 채용 공고
/// 기능(jobViewModelProvider)의 jobs를 기업명으로 필터링해 재사용합니다.
/// 목록/상세/기업 상세가 서로 다른 소스로 갈라지지 않도록 합니다.
@riverpod
int companyActiveJobCount(Ref ref, String companyName) {
  final jobs = ref.watch(jobViewModelProvider.select((state) => state.jobs));
  return jobs
      .where((job) => job.companyName == companyName && !job.isClosed)
      .length;
}

const mockCompanies = [
  CompanyItem(
    id: 'naver-cloud',
    name: '네이버클라우드',
    typeLabel: '대기업',
    isMou: true,
  ),
  CompanyItem(id: 'woowa', name: '우아한형제들', typeLabel: '중견기업', isMou: false),
  CompanyItem(id: 'kepco', name: '한국전력공사', typeLabel: '공기업', isMou: true),
  CompanyItem(id: 'kakao', name: '카카오', typeLabel: '대기업', isMou: false),
  CompanyItem(id: 'nhn', name: 'NHN', typeLabel: '중견기업', isMou: true),
];
