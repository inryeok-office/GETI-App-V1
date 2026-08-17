import 'package:flutter/material.dart';
import 'package:geti_app/shared/widgets/common_error_view.dart';

/// 세션 만료 등으로 재인증이 필요할 때 표시하는 안내 화면입니다.
/// 실제 로그인 이동은 인증 연동 단계에서 [onAction]으로 연결합니다.
class ReloginPromptView extends StatelessWidget {
  const ReloginPromptView({super.key, this.onAction});

  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return CommonErrorView(
      type: CommonErrorType.sessionExpired,
      onAction: onAction ?? _noop,
    );
  }
}

void _noop() {}
