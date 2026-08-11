import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';
import 'package:geti_app/features/application/presentation/widgets/application_card.dart';
import 'package:geti_app/features/application/presentation/widgets/application_filter.dart';
import 'package:geti_app/features/application/presentation/widgets/application_state_content.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';

class ApplicationView extends ConsumerWidget {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(applicationViewModelProvider);
    final viewModel = ref.read(applicationViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _ApplicationHeader(),
            Expanded(
              child: ApplicationScreenBody(
                state: state,
                onFilterSelected: viewModel.selectFilter,
                onRetry: viewModel.retry,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        top: false,
        child: AppBottomNavigation(currentIndex: 3),
      ),
    );
  }
}

class ApplicationScreenBody extends StatelessWidget {
  const ApplicationScreenBody({
    required this.state,
    required this.onFilterSelected,
    required this.onRetry,
    super.key,
  });

  final ApplicationViewState state;
  final ValueChanged<ApplicationFilter> onFilterSelected;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 326.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              '내 지원 목록',
              style: AppTypography.heading2.copyWith(
                color: AppColors.neutral900,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              '제출한 지원서와 현재 상태를 확인하세요.',
              style: AppTypography.body.copyWith(color: AppColors.neutral600),
            ),
            SizedBox(height: 12.h),
            ApplicationFilterControl(
              selectedFilter: state.selectedFilter,
              onSelected: onFilterSelected,
            ),
            SizedBox(height: 12.h),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (state.screenStatus != ApplicationScreenStatus.loaded) {
      return ApplicationStateContent(
        status: state.screenStatus,
        onRetry: onRetry,
      );
    }

    final applications = state.filteredApplications;
    if (applications.isEmpty) {
      return ApplicationStateContent(
        status: ApplicationScreenStatus.empty,
        onRetry: onRetry,
      );
    }

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: applications.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) =>
          ApplicationCard(application: applications[index]),
    );
  }
}

class _ApplicationHeader extends StatelessWidget {
  const _ApplicationHeader();

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
                '내 지원',
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
