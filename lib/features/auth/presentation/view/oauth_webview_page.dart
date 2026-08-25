import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geti_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// DG OAuth 인가 URL을 WebView로 열고, 서버의 콜백 URL
/// (`/api/v1/auth/dg/callback`)로 이동하려는 시점을 가로채 직접 처리합니다.
/// 콜백이 JSON을 그대로 반환하므로(App 클라이언트 기준) 별도 딥링크 스킴
/// 등록 없이 Navigation 감지만으로 로그인을 완료할 수 있습니다.
class OAuthWebViewPage extends ConsumerStatefulWidget {
  const OAuthWebViewPage({required this.authorizationUrl, super.key});

  final String authorizationUrl;

  @override
  ConsumerState<OAuthWebViewPage> createState() => _OAuthWebViewPageState();
}

class _OAuthWebViewPageState extends ConsumerState<OAuthWebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _handledCallback = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (mounted) setState(() => _isLoading = true);
          },
          onPageFinished: (_) {
            if (mounted) setState(() => _isLoading = false);
          },
          onNavigationRequest: _onNavigationRequest,
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizationUrl));
  }

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    final uri = Uri.tryParse(request.url);
    if (uri != null && uri.path.contains('/auth/dg/callback')) {
      unawaited(_handleCallback(uri));
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  Future<void> _handleCallback(Uri uri) async {
    if (_handledCallback) return;
    _handledCallback = true;

    final code = uri.queryParameters['code'];
    final state = uri.queryParameters['state'];
    if (code == null || state == null) {
      if (mounted) Navigator.of(context).pop();
      return;
    }

    await ref
        .read(authViewModelProvider.notifier)
        .completeOAuthLogin(code: code, oauthState: state);

    // 로그인에 성공하면 LoginView의 ref.listen이 이미 go()로 이 화면을
    // 스택에서 제거했으므로 pop이 필요 없습니다(실패 시에만 되돌아갑니다).
    final loggedIn = ref.read(authViewModelProvider).loginResult != null;
    if (!loggedIn && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        leading: IconButton(
          key: const ValueKey('oauth-webview-close'),
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
        ],
      ),
    );
  }
}
