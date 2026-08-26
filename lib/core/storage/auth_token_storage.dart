import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geti_app/core/storage/secure_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_token_storage.g.dart';

class AuthTokens {
  const AuthTokens({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;
}

/// Access/Refresh Token을 안전하게 저장·조회합니다.
/// 테스트에서 대체 구현을 주입할 수 있도록 추상 인터페이스로 정의합니다.
abstract class AuthTokenStorage {
  Future<String?> readAccessToken();
  Future<String?> readRefreshToken();
  Future<void> saveTokens(AuthTokens tokens);
  Future<void> clear();
}

class SecureAuthTokenStorage implements AuthTokenStorage {
  SecureAuthTokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  @override
  Future<String?> readAccessToken() => _storage.read(key: _accessTokenKey);

  @override
  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    await _storage.write(key: _accessTokenKey, value: tokens.accessToken);
    await _storage.write(key: _refreshTokenKey, value: tokens.refreshToken);
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}

@Riverpod(keepAlive: true)
AuthTokenStorage authTokenStorage(Ref ref) {
  return SecureAuthTokenStorage(ref.watch(secureStorageProvider));
}
