import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/company/presentation/view_model/company_view_model.dart';
import 'package:geti_app/features/company/presentation/widgets/company_card.dart';
import 'package:geti_app/features/company/presentation/widgets/company_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class CompanyView extends ConsumerWidget {
  const CompanyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(companyViewModelProvider);
    final viewModel = ref.read(companyViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _CompanyAppBar(),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 326.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        '기업 정보',
                        style: AppTypography.heading2.copyWith(
                          color: AppColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '다양한 기업의 정보와 채용 중인 공고를 확인해 보세요.',
                        style: AppTypography.body.copyWith(
                          color: AppColors.neutral600,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: _CompanySearchField(
                              query: state.searchQuery,
                              onChanged: viewModel.updateSearchQuery,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          _CompanyTypeFilterButton(
                            selectedType: state.typeFilter,
                            availableTypes: state.availableTypes,
                            onSelected: viewModel.updateTypeFilter,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Expanded(
                        child: _CompanyList(
                          state: state,
                          onRetry: viewModel.retry,
                          onCompanyTap: (company) =>
                              context.push('/companies/${company.id}'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: AppBottomNavigation(
          currentIndex: 0,
          onTap: (index) => navigateToBottomTab(context, index),
        ),
      ),
    );
  }
}

class _CompanyList extends ConsumerWidget {
  const _CompanyList({
    required this.state,
    required this.onRetry,
    required this.onCompanyTap,
  });

  final CompanyViewState state;
  final VoidCallback onRetry;
  final ValueChanged<CompanyItem> onCompanyTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.screenStatus == CompanyScreenStatus.loading) {
      return const CompanyLoadingState();
    }
    if (state.screenStatus == CompanyScreenStatus.networkError) {
      return CompanyNetworkErrorState(onRetry: onRetry);
    }
    final companies = state.visibleCompanies;
    if (companies.isEmpty) {
      return const CompanyEmptySearchState();
    }
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: companies.length + 1,
      separatorBuilder: (_, _) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text.rich(
              TextSpan(
                style: AppTypography.body.copyWith(color: AppColors.neutral900),
                children: [
                  const TextSpan(text: '총 '),
                  TextSpan(
                    text: '${companies.length}개',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const TextSpan(text: '의 기업'),
                ],
              ),
            ),
          );
        }
        final company = companies[index - 1];
        final activeJobCount = ref.watch(
          companyActiveJobCountProvider(company.name),
        );
        return CompanyCard(
          company: company,
          activeJobCount: activeJobCount,
          onTap: () => onCompanyTap(company),
        );
      },
    );
  }
}

class _CompanyTypeFilterButton extends StatelessWidget {
  const _CompanyTypeFilterButton({
    required this.selectedType,
    required this.availableTypes,
    required this.onSelected,
  });

  final String? selectedType;
  final List<String> availableTypes;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const ValueKey('company-type-filter'),
      onTap: () => _showTypeFilterSheet(context),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.neutral200),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '기업 유형 ${selectedType ?? '전체'}',
              style: AppTypography.label.copyWith(color: AppColors.neutral600),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.expand_more, size: 20.w, color: AppColors.neutral600),
          ],
        ),
      ),
    );
  }

  void _showTypeFilterSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12.h),
            Text(
              '기업 유형',
              style: AppTypography.heading3.copyWith(
                color: AppColors.neutral900,
              ),
            ),
            SizedBox(height: 8.h),
            _CompanyTypeOption(
              label: '전체',
              selected: selectedType == null,
              onTap: () {
                Navigator.of(sheetContext).pop();
                onSelected(null);
              },
            ),
            for (final type in availableTypes)
              _CompanyTypeOption(
                label: type,
                selected: selectedType == type,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  onSelected(type);
                },
              ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class _CompanyTypeOption extends StatelessWidget {
  const _CompanyTypeOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey('company-type-option-$label'),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTypography.bodyLarge.copyWith(
                  color: selected ? AppColors.primary : AppColors.neutral900,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
            if (selected)
              Icon(Icons.check, size: 20.w, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _CompanyAppBar extends StatelessWidget {
  const _CompanyAppBar();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 56.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: const BoxDecoration(
      color: AppColors.surface,
      border: Border(bottom: BorderSide(color: AppColors.neutral200)),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '기업 정보',
        style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
      ),
    ),
  );
}

class _CompanySearchField extends StatefulWidget {
  const _CompanySearchField({required this.query, required this.onChanged});

  final String query;
  final ValueChanged<String> onChanged;

  @override
  State<_CompanySearchField> createState() => _CompanySearchFieldState();
}

class _CompanySearchFieldState extends State<_CompanySearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.query,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    height: 48.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          'assets/icons/search_field.svg',
          width: 20.w,
          height: 20.w,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: TextField(
            key: const ValueKey('company-search-field'),
            controller: _controller,
            onChanged: widget.onChanged,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.neutral900,
            ),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: '기업명으로 검색해 보세요.',
              hintStyle: AppTypography.bodyLarge.copyWith(
                color: AppColors.neutral600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
