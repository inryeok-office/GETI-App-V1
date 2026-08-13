import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/program/presentation/view_model/program_detail_view_model.dart';
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

class ProgramCancelConfirmBottomSheet extends StatelessWidget {
  const ProgramCancelConfirmBottomSheet({
    required this.onCancel,
    required this.onContinue,
    super.key,
  });

  final VoidCallback onCancel;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.surface,
    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    clipBehavior: Clip.antiAlias,
    child: SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.neutral200,
                borderRadius: BorderRadius.circular(999.r),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              '프로그램 신청을 취소할까요?',
              textAlign: TextAlign.center,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.neutral900,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              '취소 후 정원이 마감되면 다시 신청할 수 없습니다.',
              textAlign: TextAlign.center,
              style: AppTypography.body.copyWith(color: AppColors.neutral500),
            ),
            SizedBox(height: 24.h),
            const _CancelNoticeBox(),
            SizedBox(height: 24.h),
            _SheetActionButton(
              key: const ValueKey('program-cancel-confirm'),
              label: '신청 취소',
              filled: true,
              danger: true,
              onPressed: onCancel,
            ),
            SizedBox(height: 12.h),
            _SheetActionButton(
              key: const ValueKey('program-cancel-continue'),
              label: '계속 참여하기',
              onPressed: onContinue,
            ),
          ],
        ),
      ),
    ),
  );
}

class ProgramCancellingOverlay extends StatelessWidget {
  const ProgramCancellingOverlay({super.key});

  @override
  Widget build(BuildContext context) => _OverlayFrame(
    child: Container(
      width: 326.w,
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _RotatingLoadingIcon(
            indicatorKey: ValueKey('program-cancelling-loading'),
          ),
          SizedBox(height: 16.h),
          Text(
            '신청 취소 처리 중입니다.',
            textAlign: TextAlign.center,
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 16.h),
          Text(
            '잠시만 기다려 주세요.',
            textAlign: TextAlign.center,
            style: AppTypography.body.copyWith(color: AppColors.neutral500),
          ),
        ],
      ),
    ),
  );
}

class ProgramCancelSuccessOverlay extends StatelessWidget {
  const ProgramCancelSuccessOverlay({
    required this.detail,
    required this.onGoToPrograms,
    super.key,
  });

  final ProgramDetail detail;
  final VoidCallback onGoToPrograms;

  @override
  Widget build(BuildContext context) => _OverlayFrame(
    child: Container(
      width: 326.w,
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '신청이 취소되었습니다',
            textAlign: TextAlign.center,
            style: AppTypography.heading3.copyWith(
              color: const Color(0xFF111827),
            ),
          ),
          SizedBox(height: 16.h),
          _CancelResultBox(detail: detail),
          SizedBox(height: 16.h),
          _DialogActionButton(
            key: const ValueKey('program-cancel-go-programs'),
            label: '프로그램 목록으로',
            onPressed: onGoToPrograms,
          ),
        ],
      ),
    ),
  );
}

class ProgramCancelFailureOverlay extends StatelessWidget {
  const ProgramCancelFailureOverlay({
    required this.onRetry,
    required this.onClose,
    super.key,
  });

  final VoidCallback onRetry;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) => _OverlayFrame(
    child: Container(
      width: 326.w,
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '신청을 취소하지 못했어요',
            textAlign: TextAlign.center,
            style: AppTypography.heading3.copyWith(
              color: const Color(0xFF111827),
            ),
          ),
          SizedBox(height: 16.h),
          const _CancelErrorBox(),
          SizedBox(height: 16.h),
          _DialogActionButton(
            key: const ValueKey('program-cancel-retry'),
            label: '다시 시도',
            onPressed: onRetry,
          ),
          SizedBox(height: 8.h),
          _DialogActionButton(
            key: const ValueKey('program-cancel-close'),
            label: '닫기',
            filled: false,
            onPressed: onClose,
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

class _CancelNoticeBox extends StatelessWidget {
  const _CancelNoticeBox();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: const Color(0xFF8CC8DA)),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '유의사항',
          style: AppTypography.label.copyWith(color: AppColors.primary),
        ),
        SizedBox(height: 12.h),
        Text(
          '프로그램 시작 2일 전까지 취소할 수 있습니다.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
        SizedBox(height: 12.h),
        Text(
          '프로그램 시작 이후에는 취소가 불가능합니다.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class _CancelResultBox extends StatelessWidget {
  const _CancelResultBox({required this.detail});

  final ProgramDetail detail;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: const Color(0xFFE5E7EB)),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Column(
      children: [
        _CancelResultRow(label: '취소일', value: detail.cancellationDate),
        SizedBox(height: 12.h),
        _CancelResultRow(label: '취소 사유', value: detail.cancellationReason),
      ],
    ),
  );
}

class _CancelResultRow extends StatelessWidget {
  const _CancelResultRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      SizedBox(
        width: 52.w,
        child: Text(
          label,
          style: AppTypography.caption.copyWith(color: const Color(0xFF334155)),
        ),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: Text(
          value,
          style: AppTypography.caption.copyWith(color: const Color(0xFF334155)),
        ),
      ),
    ],
  );
}

class _CancelErrorBox extends StatelessWidget {
  const _CancelErrorBox();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: const Color(0xFFE5E7EB)),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사유',
          style: AppTypography.captionMedium.copyWith(
            color: const Color(0xFF334155),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          '이미 취소 가능한 기한이 지났거나\n다른 이유로 취소가 불가능합니다.',
          style: AppTypography.caption.copyWith(color: const Color(0xFF475569)),
        ),
      ],
    ),
  );
}

class _SheetActionButton extends StatelessWidget {
  const _SheetActionButton({
    required this.label,
    required this.onPressed,
    this.filled = false,
    this.danger = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool filled;
  final bool danger;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 44.h,
    child: Material(
      color: filled
          ? (danger ? AppColors.error : AppColors.primary)
          : AppColors.surface,
      borderRadius: BorderRadius.circular(8.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: filled ? null : Border.all(color: AppColors.neutral200),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            label,
            style: AppTypography.label.copyWith(
              color: filled ? AppColors.onPrimary : AppColors.neutral900,
            ),
          ),
        ),
      ),
    ),
  );
}

class _DialogActionButton extends StatelessWidget {
  const _DialogActionButton({
    required this.label,
    required this.onPressed,
    this.filled = true,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 42.h,
    child: Material(
      color: filled ? AppColors.primary : AppColors.surface,
      borderRadius: BorderRadius.circular(8.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: filled ? null : Border.all(color: AppColors.neutral200),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            label,
            style: AppTypography.caption.copyWith(
              color: filled ? AppColors.onPrimary : AppColors.neutral900,
            ),
          ),
        ),
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
  const _RotatingLoadingIcon({
    this.indicatorKey = const ValueKey('program-applying-loading'),
  });

  final Key indicatorKey;

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
    key: widget.indicatorKey,
    turns: _controller,
    child: SvgPicture.asset(
      'assets/icons/loading.svg',
      width: 48.w,
      height: 48.h,
    ),
  );
}
