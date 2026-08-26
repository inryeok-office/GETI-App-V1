import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/features/auth/presentation/widgets/logout_confirm_dialog.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:geti_app/shared/widgets/app_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class MyPageView extends ConsumerWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _MyPageAppBar(),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 326.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      _MyPageMenuItem(
                        key: const ValueKey('mypage-applications'),
                        label: '내 지원 현황',
                        onTap: () => context.push('/applications'),
                      ),
                      _MyPageMenuItem(
                        key: const ValueKey('mypage-logout'),
                        label: '로그아웃',
                        labelColor: AppColors.error,
                        onTap: () => _onLogout(context, ref),
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
          currentIndex: 3,
          onTap: (index) => navigateToBottomTab(context, index),
        ),
      ),
    );
  }

  Future<void> _onLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await LogoutConfirmDialog.show(context);
    if (!confirmed) return;
    final viewModel = ref.read(authViewModelProvider.notifier);
    try {
      await viewModel.logout();
    } catch (_) {
      // 로그아웃 API 호출이 실패해도 로컬 상태는 초기화하고 로그인 화면으로 보냅니다.
    }
    viewModel.reset();
    if (!context.mounted) return;
    context.go('/login');
  }
}

class _MyPageAppBar extends StatelessWidget {
  const _MyPageAppBar();

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
        '마이페이지',
        style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
      ),
    ),
  );
}

class _MyPageMenuItem extends StatelessWidget {
  const _MyPageMenuItem({
    required this.label,
    required this.onTap,
    this.labelColor = AppColors.neutral900,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.neutral200)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.bodyLarge.copyWith(color: labelColor),
            ),
            Icon(Icons.chevron_right, size: 20.w, color: AppColors.neutral500),
          ],
        ),
      ),
    );
  }
}
