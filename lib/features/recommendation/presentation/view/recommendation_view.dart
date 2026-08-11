import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';
import 'package:geti_app/features/recommendation/presentation/widgets/recommendation_job_card.dart';
import 'package:geti_app/features/recommendation/presentation/widgets/recommendation_state_content.dart';
import 'package:geti_app/features/recommendation/presentation/widgets/recommendation_uninterested_bottom_sheet.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';

class RecommendationView extends ConsumerStatefulWidget {
  const RecommendationView({super.key});

  @override
  ConsumerState<RecommendationView> createState() => _RecommendationViewState();
}

class _RecommendationViewState extends ConsumerState<RecommendationView> {
  bool _isUninterestedSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recommendationViewModelProvider);
    final viewModel = ref.read(recommendationViewModelProvider.notifier);

    ref.listen(
      recommendationViewModelProvider.select(
        (value) => value.uninterestedSheetStatus,
      ),
      (previous, next) {
        if (next == UninterestedSheetStatus.hidden &&
            _isUninterestedSheetOpen &&
            Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const _RecommendationHeader(),
                Expanded(
                  child: RecommendationScreenBody(
                    state: state,
                    onGenerate: viewModel.startGeneration,
                    onRetry: viewModel.startGeneration,
                    onUninterested: _showUninterestedSheet,
                    onBookmark: viewModel.toggleBookmark,
                  ),
                ),
              ],
            ),
          ),
          if (state.showUninterestedSuccess)
            Positioned(
              left: 33.w,
              right: 32.w,
              bottom: 4.h,
              child: UninterestedSuccessBanner(
                onClose: viewModel.dismissUninterestedSuccess,
              ),
            ),
        ],
      ),
      bottomNavigationBar: const SafeArea(
        top: false,
        child: AppBottomNavigation(currentIndex: 0),
      ),
    );
  }

  Future<void> _showUninterestedSheet(RecommendationJob job) async {
    if (_isUninterestedSheetOpen) return;

    final viewModel = ref.read(recommendationViewModelProvider.notifier);
    viewModel.openUninterested(job);
    _isUninterestedSheetOpen = true;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0x40111111),
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(recommendationViewModelProvider);
          final selectedJob = state.selectedJob;
          if (selectedJob == null ||
              state.uninterestedSheetStatus == UninterestedSheetStatus.hidden) {
            return const SizedBox.shrink();
          }

          final viewModel = ref.read(recommendationViewModelProvider.notifier);
          return RecommendationUninterestedBottomSheet(
            status: state.uninterestedSheetStatus,
            job: selectedJob,
            scope: state.uninterestedScope,
            isUnsetting: state.isUnsetting,
            onScopeChanged: viewModel.selectUninterestedScope,
            onClose: viewModel.closeUninterestedSheet,
            onConfirm: viewModel.confirmUninterested,
            onUnset: viewModel.unsetUninterested,
            onRetry: viewModel.retryUninterested,
          );
        },
      ),
    );

    _isUninterestedSheetOpen = false;
    if (mounted &&
        ref.read(recommendationViewModelProvider).uninterestedSheetStatus !=
            UninterestedSheetStatus.hidden) {
      viewModel.closeUninterestedSheet();
    }
  }
}

class RecommendationScreenBody extends StatelessWidget {
  const RecommendationScreenBody({
    required this.state,
    required this.onGenerate,
    required this.onRetry,
    this.onUninterested,
    this.onBookmark,
    super.key,
  });

  final RecommendationViewState state;
  final VoidCallback onGenerate;
  final VoidCallback onRetry;
  final ValueChanged<RecommendationJob>? onUninterested;
  final ValueChanged<RecommendationJob>? onBookmark;

  @override
  Widget build(BuildContext context) {
    if (state.status != RecommendationStatus.loaded) {
      return RecommendationStateContent(
        status: state.status,
        onGenerate: onGenerate,
        onRetry: onRetry,
      );
    }

    return Center(
      child: SizedBox(
        width: 326.w,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          itemCount: state.jobs.length + 1,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Text(
                '추천 공고 ${state.jobs.length}개',
                style: AppTypography.body.copyWith(color: AppColors.neutral900),
              );
            }

            final job = state.jobs[index - 1];
            return RecommendationJobCard(
              job: job,
              isUninterested: state.uninterestedJobs.contains(job),
              isBookmarked: state.bookmarkedJobs.contains(job),
              onBookmarkTap: onBookmark == null ? null : () => onBookmark!(job),
              onUninterestedTap: onUninterested == null
                  ? null
                  : () => onUninterested!(job),
            );
          },
        ),
      ),
    );
  }
}

class _RecommendationHeader extends StatelessWidget {
  const _RecommendationHeader();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/geti_logo.png',
                  width: 56,
                  height: 56,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                '맞춤 추천',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.neutral900,
                  fontSize: 18,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.18,
                ),
              ),
            ),
            const SizedBox(width: 120),
          ],
        ),
      ),
    );
  }
}
