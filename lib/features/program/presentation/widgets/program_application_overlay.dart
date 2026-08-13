import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class ProgramApplyingOverlay extends StatelessWidget {
  const ProgramApplyingOverlay({super.key});

  @override
  Widget build(BuildContext context) => _OverlayFrame(
    child: SizedBox(
      width: 326.w,
      height: 182.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _RotatingLoadingIcon(),
          SizedBox(height: 24.h),
          Text(
            '신청을 처리 중입니다.',
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 12.h),
          Text(
            '잠시만 기다려 주세요.',
            style: AppTypography.body.copyWith(color: AppColors.neutral500),
          ),
        ],
      ),
    ),
  );
}

class ProgramConcurrencyFailureOverlay extends StatelessWidget {
  const ProgramConcurrencyFailureOverlay({required this.onConfirm, super.key});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) => _OverlayFrame(
    child: Container(
      width: 326.w,
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/alert_circle.svg',
            width: 48.w,
            height: 48.h,
          ),
          SizedBox(height: 24.h),
          Text(
            '정원이 마감되어 신청할 수 없어요.',
            textAlign: TextAlign.center,
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 12.h),
          Text(
            '다른 프로그램을 확인해 주세요.',
            textAlign: TextAlign.center,
            style: AppTypography.body.copyWith(color: AppColors.neutral500),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            height: 42.h,
            child: Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
              child: InkWell(
                key: const ValueKey('program-concurrency-confirm'),
                onTap: onConfirm,
                borderRadius: BorderRadius.circular(8.r),
                child: Center(
                  child: Text(
                    '확인',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _OverlayFrame extends StatelessWidget {
  const _OverlayFrame({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Positioned.fill(
    child: Material(
      color: const Color(0x40111111),
      child: Center(
        child: Material(
          color: AppColors.surface,
          elevation: 8,
          shadowColor: const Color(0x1A17252D),
          borderRadius: BorderRadius.circular(16.r),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ),
    ),
  );
}

class _RotatingLoadingIcon extends StatefulWidget {
  const _RotatingLoadingIcon();

  @override
  State<_RotatingLoadingIcon> createState() => _RotatingLoadingIconState();
}

class _RotatingLoadingIconState extends State<_RotatingLoadingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RotationTransition(
    key: const ValueKey('program-applying-loading'),
    turns: _controller,
    child: SvgPicture.asset(
      'assets/icons/loading.svg',
      width: 48.w,
      height: 48.h,
    ),
  );
}
