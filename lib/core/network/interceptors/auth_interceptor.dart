import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/app_constants.dart';
import '../../storage/secure_storage_service.dart';

/// Interceptor to handle authentication tokens
class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip authentication for auth endpoints
    if (_isAuthEndpoint(options.path)) {
      return handler.next(options);
    }

    try {
      final secureStorage = _ref.read(secureStorageServiceProvider);
      final accessToken = await secureStorage.read(AppConstants.accessTokenKey);

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {
      // Continue without token if storage fails
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - attempt token refresh
    if (err.response?.statusCode == 401) {
      try {
        final secureStorage = _ref.read(secureStorageServiceProvider);
        final refreshToken = await secureStorage.read(
          AppConstants.refreshTokenKey,
        );

        if (refreshToken != null) {
          final success = await _refreshToken(refreshToken);
          if (success) {
            // Retry the original request
            final clonedRequest = await _cloneRequest(err.requestOptions);
            final response = await Dio().fetch(clonedRequest);
            return handler.resolve(response);
          }
        }

        // Clear tokens if refresh fails
        await _clearTokens();
      } catch (e) {
        await _clearTokens();
      }
    }

    handler.next(err);
  }

  /// Check if the endpoint is an authentication endpoint
  bool _isAuthEndpoint(String path) {
    final authEndpoints = [
      '/auth/login',
      '/auth/register',
      '/auth/refresh',
      '/auth/forgot-password',
      '/auth/reset-password',
    ];
    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }

  /// Attempt to refresh the access token
  Future<bool> _refreshToken(String refreshToken) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final newAccessToken = data['accessToken'] as String?;
        final newRefreshToken = data['refreshToken'] as String?;

        if (newAccessToken != null && newRefreshToken != null) {
          final secureStorage = _ref.read(secureStorageServiceProvider);
          await secureStorage.write(
            AppConstants.accessTokenKey,
            newAccessToken,
          );
          await secureStorage.write(
            AppConstants.refreshTokenKey,
            newRefreshToken,
          );
          return true;
        }
      }
    } catch (e) {
      // Token refresh failed
    }
    return false;
  }

  /// Clone a request for retry
  Future<RequestOptions> _cloneRequest(RequestOptions options) async {
    final secureStorage = _ref.read(secureStorageServiceProvider);
    final accessToken = await secureStorage.read(AppConstants.accessTokenKey);

    return options.copyWith(
      headers: {
        ...options.headers,
        if (accessToken != null) 'Authorization': 'Bearer $accessToken',
      },
    );
  }

  /// Clear all stored tokens
  Future<void> _clearTokens() async {
    try {
      final secureStorage = _ref.read(secureStorageServiceProvider);
      await secureStorage.delete(AppConstants.accessTokenKey);
      await secureStorage.delete(AppConstants.refreshTokenKey);
      await secureStorage.delete(AppConstants.userDataKey);
    } catch (e) {
      // Ignore storage errors during cleanup
    }
  }
}
