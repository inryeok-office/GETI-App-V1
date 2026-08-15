import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

/// [AppBottomNavigation]의 탭 인덱스를 실제 라우트로 이동시킵니다.
void navigateToBottomTab(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.go('/');
    case 1:
      context.go('/jobs');
    case 2:
      context.go('/notifications');
    case 3:
      context.go('/applications');
  }
}

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    required this.currentIndex,
    this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static const _items = [
    _NavigationItem(label: '홈', assetPath: 'assets/icons/nav_home.svg'),
    _NavigationItem(label: '공고', assetPath: 'assets/icons/nav_jobs.svg'),
    _NavigationItem(
      label: '알림',
      assetPath: 'assets/icons/nav_notification.svg',
    ),
    _NavigationItem(label: '마이', assetPath: 'assets/icons/nav_my.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.neutral200)),
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: SizedBox(
        height: 72.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = currentIndex == index;
            final color = isSelected
                ? AppColors.primaryAccent
                : AppColors.neutral500;

            return Semantics(
              selected: isSelected,
              button: true,
              label: item.label,
              child: InkWell(
                onTap: onTap == null ? null : () => onTap!(index),
                child: SizedBox(
                  width: 78.w,
                  height: 48.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (item.label == '알림')
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/nav_notification_top.svg',
                                width: 20.w,
                                height: 20.h,
                                colorFilter: ColorFilter.mode(
                                  color,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/nav_notification_bottom.svg',
                                width: 20.w,
                                height: 20.h,
                                colorFilter: ColorFilter.mode(
                                  color,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        SvgPicture.asset(
                          item.assetPath,
                          width: 20.w,
                          height: 20.h,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                        ),
                      SizedBox(height: 4.h),
                      Text(
                        item.label,
                        style:
                            (isSelected
                                    ? AppTypography.captionMedium
                                    : AppTypography.caption)
                                .copyWith(color: color),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavigationItem {
  const _NavigationItem({required this.label, required this.assetPath});

  final String label;
  final String assetPath;
}
