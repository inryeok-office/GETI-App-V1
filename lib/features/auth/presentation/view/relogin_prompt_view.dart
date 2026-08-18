import 'package:flutter/material.dart';
import 'package:geti_app/shared/widgets/common_error_view.dart';
import 'package:go_router/go_router.dart';

/// 세션 만료 등으로 재인증이 필요할 때 표시하는 안내 화면입니다.
/// 별도 동작을 주입하지 않으면 기존 로그인 화면으로 이동합니다.
class ReloginPromptView extends StatelessWidget {
  const ReloginPromptView({super.key, this.onAction});

  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return CommonErrorView(
      type: CommonErrorType.sessionExpired,
      onAction: onAction ?? () => context.go('/login'),
    );
  }
}
