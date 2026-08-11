import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/application/presentation/view_model/application_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ApplicationFilterControl extends StatelessWidget {
  const ApplicationFilterControl({
    required this.selectedFilter,
    required this.onSelected,
    super.key,
  });

  final ApplicationFilter selectedFilter;
  final ValueChanged<ApplicationFilter> onSelected;

  static const _labels = {
    ApplicationFilter.all: '전체',
    ApplicationFilter.inProgress: '진행 중',
    ApplicationFilter.closed: '종료',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.neutral200),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: ApplicationFilter.values.map((filter) {
          final isSelected = filter == selectedFilter;
          return Expanded(
            child: Material(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                key: ValueKey('application-filter-${filter.name}'),
                onTap: () => onSelected(filter),
                child: SizedBox(
                  height: 36.h,
                  child: Center(
                    child: Text(
                      _labels[filter]!,
                      style: AppTypography.captionMedium.copyWith(
                        color: isSelected
                            ? AppColors.onPrimary
                            : AppColors.neutral600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
