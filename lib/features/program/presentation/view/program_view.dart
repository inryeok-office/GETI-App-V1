import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/program/presentation/view_model/program_view_model.dart';
import 'package:geti_app/features/program/presentation/widgets/program_card.dart';
import 'package:geti_app/features/program/presentation/widgets/program_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';

class ProgramView extends ConsumerWidget {
  const ProgramView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(programViewModelProvider);
    final viewModel = ref.read(programViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _ProgramAppBar(),
            Expanded(
              child: ProgramScreenBody(
                state: state,
                onTabSelected: viewModel.selectTab,
                onRetry: viewModel.retry,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        top: false,
        child: AppBottomNavigation(currentIndex: 0),
      ),
    );
  }
}

class ProgramScreenBody extends StatelessWidget {
  const ProgramScreenBody({
    required this.state,
    required this.onTabSelected,
    required this.onRetry,
    super.key,
  });
  final ProgramViewState state;
  final ValueChanged<ProgramTab> onTabSelected;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      width: 326.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProgramTabs(
            selectedTab: state.selectedTab,
            onSelected: onTabSelected,
          ),
          SizedBox(height: 24.h),
          Text(
            '취업 프로그램',
            style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 12.h),
          Text(
            '취업 준비에 도움이 되는 프로그램을 확인하세요.',
            style: AppTypography.body.copyWith(color: AppColors.neutral600),
          ),
          SizedBox(height: 24.h),
          Expanded(child: _content()),
        ],
      ),
    ),
  );

  Widget _content() {
    if (state.screenStatus == ProgramScreenStatus.loading) {
      return const ProgramLoadingState();
    }
    if (state.screenStatus == ProgramScreenStatus.networkError) {
      return ProgramNetworkErrorState(onRetry: onRetry);
    }
    final programs = state.visiblePrograms;
    if (programs.isEmpty) {
      return ProgramEmptyState(
        isAppliedTab: state.selectedTab == ProgramTab.applied,
      );
    }
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: programs.length,
      separatorBuilder: (_, _) => SizedBox(height: 12.h),
      itemBuilder: (_, index) => ProgramCard(program: programs[index]),
    );
  }
}

class _ProgramAppBar extends StatelessWidget {
  const _ProgramAppBar();
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 56.h,
    decoration: const BoxDecoration(
      color: AppColors.surface,
      border: Border(bottom: BorderSide(color: AppColors.neutral200)),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 44.w,
          height: 44.h,
          child: IconButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.chevron_left, size: 24.w),
            color: AppColors.neutral600,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          '취업 프로그램',
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
      ],
    ),
  );
}

class _ProgramTabs extends StatelessWidget {
  const _ProgramTabs({required this.selectedTab, required this.onSelected});
  final ProgramTab selectedTab;
  final ValueChanged<ProgramTab> onSelected;
  @override
  Widget build(BuildContext context) => SizedBox(
    height: 48.h,
    child: Row(
      children: ProgramTab.values
          .map((tab) {
            final selected = tab == selectedTab;
            return Expanded(
              child: InkWell(
                key: ValueKey('program-tab-${tab.name}'),
                onTap: () => onSelected(tab),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      tab == ProgramTab.all ? '전체' : '신청한 프로그램',
                      style:
                          (selected ? AppTypography.label : AppTypography.body)
                              .copyWith(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.neutral600,
                              ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: selected ? 2.h : 1.h,
                      color: selected
                          ? AppColors.primary
                          : AppColors.neutral200,
                    ),
                  ],
                ),
              ),
            );
          })
          .toList(growable: false),
    ),
  );
}
