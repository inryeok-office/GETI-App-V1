import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geti_app/features/recommendation/presentation/view_model/recommendation_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

class RecommendationStateContent extends StatelessWidget {
  const RecommendationStateContent({
    required this.status,
    required this.onGenerate,
    required this.onRetry,
    super.key,
  });

  final RecommendationStatus status;
  final VoidCallback onGenerate;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final content = switch (status) {
      RecommendationStatus.empty => const _StateDefinition(
        iconPath: 'assets/icons/search.svg',
        title: '추천 공고가 없습니다.',
        description: '현재 등록된 정보로는 추천할 만한 공고가 없어요.\n프로필을 업데이트해 보세요.',
        buttonLabel: '프로필 관리하기',
        outlinedButton: true,
        actionPadding: EdgeInsets.only(top: 12, bottom: 16),
      ),
      RecommendationStatus.beforeGeneration => const _StateDefinition(
        iconPath: 'assets/icons/recommendation_empty.svg',
        iconSize: 45,
        title: '아직 추천이 생성되지 않았습니다.',
        description: '프로필을 등록하면 AI가 회원님에게 맞는 공고를 추천해 드려요.',
        buttonLabel: '추천 생성하기',
      ),
      RecommendationStatus.generating => const _StateDefinition(
        iconPath: 'assets/icons/loading.svg',
        title: '추천 공고를 생성하고 있습니다.',
        description: 'AI가 회원님의 정보를 분석하여 맞춤 공고를 추천 중이에요.\n잠시만 기다려 주세요.',
      ),
      RecommendationStatus.failure => const _StateDefinition(
        iconPath: 'assets/icons/alert_circle.svg',
        title: '추천을 생성하지 못했습니다.',
        description: '일시적인 오류가 발생했어요.\n잠시 후 다시 시도해 주세요.',
        buttonLabel: '다시 시도',
      ),
      RecommendationStatus.loaded || RecommendationStatus.disabled =>
        throw StateError('추천 결과 상태는 RecommendationStateContent에서 표시하지 않습니다.'),
    };

    final callback = switch (status) {
      RecommendationStatus.beforeGeneration => onGenerate,
      RecommendationStatus.failure => onRetry,
      RecommendationStatus.empty => () {},
      _ => null,
    };

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: SizedBox(
          width: 326.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StateIcon(
                iconPath: content.iconPath,
                size: content.iconSize,
                rotates: status == RecommendationStatus.generating,
              ),
              SizedBox(height: 16.h),
              Text(
                content.title,
                textAlign: TextAlign.center,
                style: AppTypography.heading3.copyWith(
                  color: AppColors.stateTitle,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 300.w,
                height: 60.h,
                child: Text(
                  content.description,
                  textAlign: TextAlign.center,
                  style: AppTypography.body.copyWith(
                    color: AppColors.stateBody,
                  ),
                ),
              ),
              if (content.buttonLabel != null)
                Padding(
                  padding: content.actionPadding ?? EdgeInsets.only(top: 16.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42.h,
                    child: content.outlinedButton
                        ? OutlinedButton(
                            onPressed: callback,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.neutral900,
                              side: const BorderSide(
                                color: AppColors.neutral200,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              textStyle: AppTypography.caption,
                            ),
                            child: Text(content.buttonLabel!),
                          )
                        : FilledButton(
                            onPressed: callback,
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              textStyle: AppTypography.caption,
                            ),
                            child: Text(content.buttonLabel!),
                          ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StateIcon extends StatefulWidget {
  const _StateIcon({
    required this.iconPath,
    required this.size,
    required this.rotates,
  });

  final String iconPath;
  final double size;
  final bool rotates;

  @override
  State<_StateIcon> createState() => _StateIconState();
}

class _StateIconState extends State<_StateIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _syncAnimation();
  }

  @override
  void didUpdateWidget(covariant _StateIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rotates != widget.rotates) {
      _syncAnimation();
    }
  }

  void _syncAnimation() {
    if (widget.rotates) {
      _controller.repeat();
    } else {
      _controller
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(
      widget.iconPath,
      width: widget.size.w,
      height: widget.size.h,
    );

    if (!widget.rotates) {
      return icon;
    }

    return RotationTransition(
      key: const ValueKey('recommendation-loading-spinner'),
      turns: _controller,
      child: icon,
    );
  }
}

class _StateDefinition {
  const _StateDefinition({
    required this.iconPath,
    required this.title,
    required this.description,
    this.buttonLabel,
    this.outlinedButton = false,
    this.iconSize = 48,
    this.actionPadding,
  });

  final String iconPath;
  final String title;
  final String description;
  final String? buttonLabel;
  final bool outlinedButton;
  final double iconSize;
  final EdgeInsets? actionPadding;
}
