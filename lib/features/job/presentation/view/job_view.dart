import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/features/job/presentation/widgets/job_card.dart';
import 'package:geti_app/features/job/presentation/widgets/job_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class JobView extends ConsumerWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jobViewModelProvider);
    final viewModel = ref.read(jobViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _JobAppBar(onBookmarksTap: () => context.push('/jobs/bookmarks')),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 326.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        '채용 공고',
                        style: AppTypography.heading2.copyWith(
                          color: AppColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '다양한 채용 정보를 한곳에서 확인하고 나에게 맞는 공고를 찾아보세요.',
                        style: AppTypography.body.copyWith(
                          color: AppColors.neutral600,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _JobSearchField(
                        query: state.searchQuery,
                        onChanged: viewModel.updateSearchQuery,
                      ),
                      SizedBox(height: 12.h),
                      _JobFilterRow(state: state, viewModel: viewModel),
                      SizedBox(height: 20.h),
                      Expanded(
                        child: _JobList(
                          state: state,
                          onRetry: viewModel.retry,
                          onJobTap: (job) => context.push('/jobs/${job.id}'),
                          onBookmarkTap: (job) => viewModel.toggleBookmark(
                            job.id,
                            currentlyBookmarked: job.bookmarked,
                          ),
                          onLoadMore: viewModel.loadMore,
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
          currentIndex: 1,
          onTap: (index) => navigateToBottomTab(context, index),
        ),
      ),
    );
  }
}

class _JobFilterRow extends StatelessWidget {
  const _JobFilterRow({required this.state, required this.viewModel});

  final JobViewState state;
  final JobViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _JobFilterChip(
            key: const ValueKey('job-type-filter'),
            label: '유형 ${_postingTypeLabel(state.postingTypeFilter)}',
            selected: state.postingTypeFilter != null,
            onTap: () => _showOptionSheet(
              context: context,
              title: '공고 유형',
              options: const ['전체', '일반', 'MOU', '교내'],
              selectedLabel: _postingTypeLabel(state.postingTypeFilter),
              onSelected: (label) =>
                  viewModel.updatePostingTypeFilter(switch (label) {
                    '일반' => JobPostingType.general,
                    'MOU' => JobPostingType.mou,
                    '교내' => JobPostingType.school,
                    _ => null,
                  }),
            ),
          ),
          SizedBox(width: 8.w),
          _JobFilterChip(
            key: const ValueKey('job-source-filter'),
            label: '출처 ${_sourceLabel(state.applicationMethodFilter)}',
            selected: state.applicationMethodFilter != null,
            onTap: () => _showOptionSheet(
              context: context,
              title: '공고 출처',
              options: const ['전체', '학교', '외부'],
              selectedLabel: _sourceLabel(state.applicationMethodFilter),
              onSelected: (label) =>
                  viewModel.updateApplicationMethodFilter(switch (label) {
                    '학교' => JobApplicationMethod.internal,
                    '외부' => JobApplicationMethod.external,
                    _ => null,
                  }),
            ),
          ),
          SizedBox(width: 8.w),
          _JobFilterChip(
            key: const ValueKey('job-deadline-soon-filter'),
            label: '마감임박',
            selected: state.deadlineSoonOnly,
            onTap: () =>
                viewModel.updateDeadlineSoonOnly(!state.deadlineSoonOnly),
          ),
        ],
      ),
    );
  }

  String _sourceLabel(JobApplicationMethod? method) => switch (method) {
    JobApplicationMethod.internal => '학교',
    JobApplicationMethod.external => '외부',
    null => '전체',
  };

  String _postingTypeLabel(JobPostingType? type) =>
      type == null ? '전체' : postingTypeLabel(type);

  void _showOptionSheet({
    required BuildContext context,
    required String title,
    required List<String> options,
    required String selectedLabel,
    required ValueChanged<String> onSelected,
  }) {
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
              title,
              style: AppTypography.heading3.copyWith(
                color: AppColors.neutral900,
              ),
            ),
            SizedBox(height: 8.h),
            for (final option in options)
              InkWell(
                key: ValueKey('job-filter-option-$option'),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  onSelected(option);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 14.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          option,
                          style: AppTypography.bodyLarge.copyWith(
                            color: option == selectedLabel
                                ? AppColors.primary
                                : AppColors.neutral900,
                            fontWeight: option == selectedLabel
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                      if (option == selectedLabel)
                        Icon(Icons.check, size: 20.w, color: AppColors.primary),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class _JobFilterChip extends StatelessWidget {
  const _JobFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primarySubtle : AppColors.surface,
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.neutral200,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: AppTypography.captionMedium.copyWith(
            color: selected ? AppColors.primary : AppColors.neutral600,
          ),
        ),
      ),
    );
  }
}

class _JobList extends StatelessWidget {
  const _JobList({
    required this.state,
    required this.onRetry,
    required this.onJobTap,
    required this.onBookmarkTap,
    required this.onLoadMore,
  });

  final JobViewState state;
  final VoidCallback onRetry;
  final ValueChanged<JobItem> onJobTap;
  final ValueChanged<JobItem> onBookmarkTap;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    if (state.screenStatus == JobScreenStatus.loading) {
      return const JobLoadingState();
    }
    if (state.screenStatus == JobScreenStatus.networkError) {
      return JobNetworkErrorState(onRetry: onRetry);
    }
    final jobs = state.visibleJobs;
    if (jobs.isEmpty) {
      return const JobEmptySearchState();
    }
    final showLoadMore = state.hasMore;
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: jobs.length + 1 + (showLoadMore ? 1 : 0),
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
                    text: '${jobs.length}개',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const TextSpan(text: '의 공고'),
                ],
              ),
            ),
          );
        }
        if (showLoadMore && index == jobs.length + 1) {
          return Center(
            child: TextButton(
              key: const ValueKey('job-load-more'),
              onPressed: state.isLoadingMore ? null : onLoadMore,
              child: Text(
                state.isLoadingMore ? '불러오는 중...' : '더보기',
                style: AppTypography.label.copyWith(color: AppColors.primary),
              ),
            ),
          );
        }
        final job = jobs[index - 1];
        return JobCard(
          job: job,
          isBookmarked: job.bookmarked,
          onTap: () => onJobTap(job),
          onBookmarkTap: () => onBookmarkTap(job),
        );
      },
    );
  }
}

class _JobAppBar extends StatelessWidget {
  const _JobAppBar({required this.onBookmarksTap});
  final VoidCallback onBookmarksTap;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 56.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: const BoxDecoration(
      color: AppColors.surface,
      border: Border(bottom: BorderSide(color: AppColors.neutral200)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '채용 공고',
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
        IconButton(
          key: const ValueKey('job-bookmarks-entry'),
          onPressed: onBookmarksTap,
          icon: SvgPicture.asset(
            'assets/icons/bookmark.svg',
            width: 22.w,
            height: 22.w,
          ),
        ),
      ],
    ),
  );
}

class _JobSearchField extends StatefulWidget {
  const _JobSearchField({required this.query, required this.onChanged});

  final String query;
  final ValueChanged<String> onChanged;

  @override
  State<_JobSearchField> createState() => _JobSearchFieldState();
}

class _JobSearchFieldState extends State<_JobSearchField> {
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
            key: const ValueKey('job-search-field'),
            controller: _controller,
            onChanged: widget.onChanged,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.neutral900,
            ),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: '기업명 또는 공고 제목을 검색해보세요',
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
