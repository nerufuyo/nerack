import '../../../../core/storage/secure_storage_service.dart';

abstract class AuthLocalDataSource {
  Future<void> storeTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
  Future<void> storeBiometricEnabled(bool enabled);
  Future<bool> isBiometricEnabled();
  Future<void> storeRememberMe(bool remember);
  Future<bool> isRememberMeEnabled();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService _secureStorage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _biometricEnabledKey = 'biometric_enabled';
  static const String _rememberMeKey = 'remember_me';

  AuthLocalDataSourceImpl({required SecureStorageService secureStorage})
    : _secureStorage = secureStorage;

  @override
  Future<void> storeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _secureStorage.write(_accessTokenKey, accessToken),
      _secureStorage.write(_refreshTokenKey, refreshToken),
    ]);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(_accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(_refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait([
      _secureStorage.delete(_accessTokenKey),
      _secureStorage.delete(_refreshTokenKey),
    ]);
  }

  @override
  Future<void> storeBiometricEnabled(bool enabled) async {
    await _secureStorage.write(_biometricEnabledKey, enabled.toString());
  }

  @override
  Future<bool> isBiometricEnabled() async {
    final value = await _secureStorage.read(_biometricEnabledKey);
    return value == 'true';
  }

  @override
  Future<void> storeRememberMe(bool remember) async {
    await _secureStorage.write(_rememberMeKey, remember.toString());
  }

  @override
  Future<bool> isRememberMeEnabled() async {
    final value = await _secureStorage.read(_rememberMeKey);
    return value == 'true';
  }
}
