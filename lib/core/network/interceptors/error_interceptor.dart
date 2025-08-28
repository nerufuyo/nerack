import 'package:dio/dio.dart';
import '../../errors/exceptions.dart';

/// Interceptor for handling and transforming HTTP errors
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapDioExceptionToAppException(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: exception,
        message: exception.message,
      ),
    );
  }

  AppException _mapDioExceptionToAppException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timeout. Please check your internet connection.',
          code: 'TIMEOUT_ERROR',
        );

      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'Unable to connect to server. Please check your internet connection.',
          code: 'CONNECTION_ERROR',
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(dioException);

      case DioExceptionType.cancel:
        return const ServerException(
          message: 'Request was cancelled',
          code: 'REQUEST_CANCELLED',
        );

      case DioExceptionType.unknown:
        return const ServerException(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        );

      default:
        return const ServerException(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        );
    }
  }

  AppException _handleBadResponse(DioException dioException) {
    final response = dioException.response;
    final statusCode = response?.statusCode;
    final data = response?.data;

    switch (statusCode) {
      case 400:
        return ValidationException(
          message: _extractErrorMessage(data) ?? 'Invalid request data',
          code: 'BAD_REQUEST',
          details: _extractErrorDetails(data),
        );

      case 401:
        return const AuthenticationException(
          message: 'Authentication failed. Please log in again.',
          code: 'UNAUTHORIZED',
        );

      case 403:
        return const AuthorizationException(
          message: 'You are not authorized to perform this action',
          code: 'FORBIDDEN',
        );

      case 404:
        return NotFoundException(
          message: _extractErrorMessage(data) ?? 'Requested resource not found',
          code: 'NOT_FOUND',
          details: _extractErrorDetails(data),
        );

      case 409:
        return ConflictException(
          message: _extractErrorMessage(data) ?? 'Conflict with current state',
          code: 'CONFLICT',
          details: _extractErrorDetails(data),
        );

      case 422:
        return ValidationException(
          message: _extractErrorMessage(data) ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
          details: _extractErrorDetails(data),
        );

      case 429:
        return const RateLimitException(
          message: 'Too many requests. Please try again later.',
          code: 'RATE_LIMIT_EXCEEDED',
        );

      case 500:
        return const ServerException(
          message: 'Internal server error. Please try again later.',
          code: 'INTERNAL_SERVER_ERROR',
          statusCode: 500,
        );

      case 502:
        return const ServerException(
          message: 'Bad gateway. Please try again later.',
          code: 'BAD_GATEWAY',
          statusCode: 502,
        );

      case 503:
        return const ServerException(
          message: 'Service unavailable. Please try again later.',
          code: 'SERVICE_UNAVAILABLE',
          statusCode: 503,
        );

      default:
        return ServerException(
          message: _extractErrorMessage(data) ?? 'Server error occurred',
          code: 'SERVER_ERROR',
          statusCode: statusCode,
          details: _extractErrorDetails(data),
        );
    }
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map<String, dynamic>) {
      // Try common error message fields
      return data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String? ??
          data['msg'] as String?;
    }

    if (data is String) {
      return data;
    }

    return null;
  }

  Map<String, dynamic>? _extractErrorDetails(dynamic data) {
    if (data is Map<String, dynamic>) {
      return Map<String, dynamic>.from(data)..remove('message')..remove('error');
    }
    return null;
  }
}
