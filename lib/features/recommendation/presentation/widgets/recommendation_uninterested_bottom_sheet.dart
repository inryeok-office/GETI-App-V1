import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_spacing.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class RecommendationUninterestedBottomSheet extends StatelessWidget {
  const RecommendationUninterestedBottomSheet({
    required this.status,
    required this.job,
    required this.scope,
    required this.isUnsetting,
    required this.onScopeChanged,
    required this.onClose,
    required this.onConfirm,
    required this.onUnset,
    required this.onRetry,
    super.key,
  });

  final UninterestedSheetStatus status;
  final RecommendationJob job;
  final UninterestedScope scope;
  final bool isUnsetting;
  final ValueChanged<UninterestedScope> onScopeChanged;
  final VoidCallback onClose;
  final VoidCallback onConfirm;
  final VoidCallback onUnset;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final content = switch (status) {
      UninterestedSheetStatus.selecting => _SelectionContent(
        scope: scope,
        onScopeChanged: onScopeChanged,
        onClose: onClose,
        onConfirm: onConfirm,
      ),
      UninterestedSheetStatus.unsetting => _UnsettingContent(
        job: job,
        scope: scope,
        onClose: onClose,
        onUnset: onUnset,
      ),
      UninterestedSheetStatus.processing => _ProcessingContent(
        isUnsetting: isUnsetting,
      ),
      UninterestedSheetStatus.settingFailed => _MessageContent(
        definition: const _MessageDefinition(
          title: '관심 없음 설정에 실패했습니다.',
          description: '네트워크 연결을 확인하고 다시 시도해 주세요.',
          showRetry: true,
        ),
        onClose: onClose,
        onRetry: onRetry,
      ),
      UninterestedSheetStatus.alreadyUninterested => _MessageContent(
        definition: const _MessageDefinition(
          title: '이미 관심없음으로 설정한 공고입니다.',
          description: '이 공고는 추천 목록에 표시되지 않습니다.',
          useTextAlert: true,
        ),
        onClose: onClose,
        onRetry: onRetry,
      ),
      UninterestedSheetStatus.unsettingFailed => _MessageContent(
        definition: const _MessageDefinition(
          title: '관심 없음 설정 해제에 실패했습니다.',
          description: '네트워크 연결을 확인하고 다시 시도해 주세요.',
          showRetry: true,
        ),
        onClose: onClose,
        onRetry: onRetry,
      ),
      UninterestedSheetStatus.notUninterested => _MessageContent(
        definition: const _MessageDefinition(
          title: '이미 관심 없음 공고가 아닙니다.',
          description: '네트워크 연결을 확인하고 다시 시도해 주세요.',
          useTextAlert: true,
        ),
        onClose: onClose,
        onRetry: onRetry,
      ),
      UninterestedSheetStatus.hidden => const SizedBox.shrink(),
    };

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg.w),
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
              SizedBox(height: 40.h),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectionContent extends StatelessWidget {
  const _SelectionContent({
    required this.scope,
    required this.onScopeChanged,
    required this.onClose,
    required this.onConfirm,
  });

  final UninterestedScope scope;
  final ValueChanged<UninterestedScope> onScopeChanged;
  final VoidCallback onClose;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '관심 없는 공고로 설정',
          style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Text(
          '추천에서 제외할 범위를 선택해 주세요.',
          style: AppTypography.bodyLarge.copyWith(color: AppColors.neutral600),
        ),
        SizedBox(height: 40.h),
        _ScopeOption(
          selected: scope == UninterestedScope.currentJob,
          title: '이 공고만',
          description: '현재 공고만 추천에서 제외합니다.',
          onTap: () => onScopeChanged(UninterestedScope.currentJob),
        ),
        SizedBox(height: 32.h),
        _ScopeOption(
          selected: scope == UninterestedScope.similarJobs,
          title: '비슷한 공고도',
          description: '유사한 직무의 추천도 함께 제외됩니다.',
          onTap: () => onScopeChanged(UninterestedScope.similarJobs),
        ),
        SizedBox(height: 40.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '안내',
                style: AppTypography.label.copyWith(
                  color: const Color(0xFF2563EB),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '관심 없음 설정은 추천 알고리즘에 반영되어 더 적합한 추천 결과를 제공합니다.',
                style: AppTypography.caption.copyWith(
                  color: const Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SheetButton(label: '취소', onPressed: onClose),
              SizedBox(width: 16.w),
              _SheetButton(label: '설정', filled: true, onPressed: onConfirm),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScopeOption extends StatelessWidget {
  const _ScopeOption({
    required this.selected,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Container(
              width: 20.w,
              height: 20.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF9CA3AF)),
              ),
              child: selected
                  ? const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  style: AppTypography.body.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UnsettingContent extends StatelessWidget {
  const _UnsettingContent({
    required this.job,
    required this.scope,
    required this.onClose,
    required this.onUnset,
  });

  final RecommendationJob job;
  final UninterestedScope scope;
  final VoidCallback onClose;
  final VoidCallback onUnset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '관심 없음 설정 해제',
          style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Text(
          '다시 추천받을 공고의 관심 없음 설정을 해제할 수 있습니다.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
        SizedBox(height: 40.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.neutral200),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.positionName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.heading3.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${job.companyName} · ${scope == UninterestedScope.similarJobs ? '비슷한 공고도' : '이 공고만'}',
                      style: AppTypography.body.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              _SheetButton(label: '해제', onPressed: onUnset),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        Align(
          alignment: Alignment.centerRight,
          child: _SheetButton(label: '확인', filled: true, onPressed: onClose),
        ),
      ],
    );
  }
}

class _ProcessingContent extends StatelessWidget {
  const _ProcessingContent({required this.isUnsetting});

  final bool isUnsetting;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isUnsetting ? '관심 없음 설정 해제 중...' : '관심 없음 설정 중...',
          style: AppTypography.heading3.copyWith(
            color: const Color(0xFF111827),
          ),
        ),
        SizedBox(height: 24.h),
        const _RotatingLoadingIcon(),
        SizedBox(height: 24.h),
        Text(
          '잠시만 기다려 주세요.',
          style: AppTypography.bodyLarge.copyWith(
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          '처리가 완료되면 추천 목록이 업데이트됩니다.',
          style: AppTypography.body.copyWith(color: const Color(0xFF6B7280)),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _MessageContent extends StatelessWidget {
  const _MessageContent({
    required this.definition,
    required this.onClose,
    required this.onRetry,
  });

  final _MessageDefinition definition;
  final VoidCallback onClose;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (definition.useTextAlert)
          SizedBox(
            height: 48.h,
            child: Text(
              '!',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 34.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        else
          SvgPicture.asset(
            'assets/icons/alert_circle.svg',
            width: 48.w,
            height: 48.h,
          ),
        SizedBox(height: 24.h),
        Text(
          definition.title,
          textAlign: TextAlign.center,
          style: AppTypography.bodyLarge.copyWith(
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          definition.description,
          textAlign: TextAlign.center,
          style: AppTypography.body.copyWith(color: const Color(0xFF6B7280)),
        ),
        SizedBox(height: 24.h),
        if (definition.showRetry)
          Row(
            children: [
              Expanded(
                child: _SheetButton(label: '닫기', onPressed: onClose),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _SheetButton(
                  label: '다시 시도',
                  filled: true,
                  onPressed: onRetry,
                ),
              ),
            ],
          )
        else
          SizedBox(
            width: double.infinity,
            child: _SheetButton(label: '확인', filled: true, onPressed: onClose),
          ),
      ],
    );
  }
}

class _SheetButton extends StatelessWidget {
  const _SheetButton({
    required this.label,
    required this.onPressed,
    this.filled = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: filled
          ? FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                textStyle: AppTypography.label,
              ),
              child: Text(label),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.neutral600,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                side: const BorderSide(color: AppColors.neutral200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                textStyle: AppTypography.label,
              ),
              child: Text(label),
            ),
    );
  }
}

class _RotatingLoadingIcon extends StatefulWidget {
  const _RotatingLoadingIcon();

  @override
  State<_RotatingLoadingIcon> createState() => _RotatingLoadingIconState();
}

class _RotatingLoadingIconState extends State<_RotatingLoadingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      key: const ValueKey('uninterested-loading-spinner'),
      turns: _controller,
      child: SvgPicture.asset(
        'assets/icons/loading.svg',
        width: 48.w,
        height: 48.h,
      ),
    );
  }
}

class _MessageDefinition {
  const _MessageDefinition({
    required this.title,
    required this.description,
    this.showRetry = false,
    this.useTextAlert = false,
  });

  final String title;
  final String description;
  final bool showRetry;
  final bool useTextAlert;
}

class UninterestedSuccessBanner extends StatelessWidget {
  const UninterestedSuccessBanner({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        border: Border.all(color: const Color(0xFF22C55E)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/check_fill.svg',
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              '관심 없음으로 설정되었습니다.',
              style: AppTypography.label.copyWith(color: AppColors.neutral900),
            ),
          ),
          InkWell(
            onTap: onClose,
            child: SvgPicture.asset(
              'assets/icons/close.svg',
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
