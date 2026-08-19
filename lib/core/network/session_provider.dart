import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

/// 세션 만료(401) 감지 상태입니다. dio 인터셉터가 감지 시 [notifyExpired]를
/// 호출하고, 앱 최상단에서 이 상태를 구독해 재로그인 화면으로 이동합니다.
@riverpod
class SessionExpired extends _$SessionExpired {
  @override
  bool build() => false;

  void notifyExpired() => state = true;

  void acknowledge() => state = false;
}
