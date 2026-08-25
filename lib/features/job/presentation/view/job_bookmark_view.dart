import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/job/presentation/view_model/job_bookmark_view_model.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/features/job/presentation/widgets/job_card.dart';
import 'package:geti_app/features/job/presentation/widgets/job_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class JobBookmarkView extends ConsumerWidget {
  const JobBookmarkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jobBookmarkViewModelProvider);
    final viewModel = ref.read(jobBookmarkViewModelProvider.notifier);
    final bookmarkedJobs = state.jobs;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 56.h,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: const Border(bottom: BorderSide(color: AppColors.neutral200)),
        leadingWidth: 52.w,
        leading: IconButton(
          key: const ValueKey('job-bookmark-back'),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/jobs');
            }
          },
          icon: Icon(Icons.chevron_left, size: 28.w),
          color: AppColors.neutral600,
        ),
        titleSpacing: 0,
        title: Text(
          '북마크',
          style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 326.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                '저장한 공고를 한곳에서 확인해 보세요.',
                style: AppTypography.body.copyWith(color: AppColors.neutral600),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: switch (state.screenStatus) {
                  JobScreenStatus.loading => const JobLoadingState(),
                  JobScreenStatus.networkError => JobNetworkErrorState(
                    onRetry: viewModel.retry,
                  ),
                  JobScreenStatus.loaded when bookmarkedJobs.isEmpty =>
                    JobBookmarkEmptyState(
                      onBrowseJobs: () => context.go('/jobs'),
                    ),
                  JobScreenStatus.loaded => ListView.separated(
                    padding: EdgeInsets.only(bottom: 24.h),
                    itemCount: bookmarkedJobs.length + 1,
                    separatorBuilder: (_, _) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Text(
                            '저장한 공고 ${bookmarkedJobs.length}개',
                            style: AppTypography.body.copyWith(
                              color: AppColors.neutral900,
                            ),
                          ),
                        );
                      }
                      final job = bookmarkedJobs[index - 1];
                      return JobCard(
                        job: job,
                        isBookmarked: true,
                        onTap: () => context.push('/jobs/${job.id}'),
                        onBookmarkTap: () => viewModel.toggleBookmark(job.id),
                      );
                    },
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
