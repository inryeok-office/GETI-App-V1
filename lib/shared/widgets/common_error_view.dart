import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_spacing.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

const double _contentTopPadding = 244;
const double _standardErrorActionSpacing = 12;

/// Figma 오류 화면을 표시하기 위한 UI preset입니다.
/// 실제 HTTP/Auth 오류와의 연결은 각 기능의 연동 계층에서 처리합니다.
enum CommonErrorType { forbidden, notFound, network, sessionExpired }

class CommonErrorView extends StatelessWidget {
  const CommonErrorView({
    required this.type,
    required this.onAction,
    super.key,
  });

  final CommonErrorType type;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final content = _CommonErrorContent.from(type);

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.xl.w,
            _contentTopPadding.h,
            AppSpacing.xl.w,
            AppSpacing.lg.h,
          ),
          child: Container(
            key: const Key('common_error_card'),
            width: double.infinity,
            padding: EdgeInsets.all(AppSpacing.lg.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  content.title,
                  textAlign: TextAlign.center,
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: AppSpacing.md.h),
                Text(
                  content.description,
                  textAlign: TextAlign.center,
                  style: AppTypography.body.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
                SizedBox(height: content.actionSpacing.h),
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: FilledButton(
                    key: const Key('common_error_action'),
                    onPressed: onAction,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      content.actionText,
                      style: AppTypography.label.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CommonErrorContent {
  const _CommonErrorContent({
    required this.title,
    required this.description,
    required this.actionText,
    required this.actionSpacing,
  });

  factory _CommonErrorContent.from(CommonErrorType type) {
    return switch (type) {
      CommonErrorType.forbidden => const _CommonErrorContent(
        title: '접근 권한이 없습니다.',
        description: '이 페이지를 볼 수 있는 권한이 없습니다.\n권한을 확인한 후 다시 이용해 주세요.',
        actionText: '홈으로 이동',
        actionSpacing: _standardErrorActionSpacing,
      ),
      CommonErrorType.notFound => const _CommonErrorContent(
        title: '페이지를 찾을 수 없습니다.',
        description: '주소가 잘못되었거나 페이지가\n삭제 또는 이동되었을 수 있습니다.',
        actionText: '홈으로 이동',
        actionSpacing: _standardErrorActionSpacing,
      ),
      CommonErrorType.network => const _CommonErrorContent(
        title: '네트워크에 연결할 수 없습니다.',
        description: '인터넷 연결 상태를 확인한 후\n다시 시도해 주세요.',
        actionText: '다시 시도',
        actionSpacing: _standardErrorActionSpacing,
      ),
      CommonErrorType.sessionExpired => const _CommonErrorContent(
        title: '로그인이 만료되었습니다.',
        description: '보안을 위해 로그인 시간이 만료되었습니다.\n다시 로그인하여 서비스를 이용해 주세요.',
        actionText: '다시 로그인',
        actionSpacing: AppSpacing.md,
      ),
    };
  }

  final String title;
  final String description;
  final String actionText;
  final double actionSpacing;
}
