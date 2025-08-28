import 'package:equatable/equatable.dart';

/// Base class for all application exceptions
abstract class AppException extends Equatable implements Exception {
  const AppException({
    required this.message,
    this.code,
    this.details,
  });

  final String message;
  final String? code;
  final Map<String, dynamic>? details;

  @override
  List<Object?> get props => [message, code, details];

  @override
  String toString() => 'AppException(message: $message, code: $code, details: $details)';
}

/// Exception thrown when server returns an error
class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.code,
    super.details,
    this.statusCode,
  });

  final int? statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}

/// Exception thrown when there's a network connectivity issue
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection available',
    super.code = 'NETWORK_ERROR',
    super.details,
  });
}

/// Exception thrown when cached data is not available
class CacheException extends AppException {
  const CacheException({
    super.message = 'Cached data not available',
    super.code = 'CACHE_ERROR',
    super.details,
  });
}

/// Exception thrown when local storage operations fail
class StorageException extends AppException {
  const StorageException({
    required super.message,
    super.code = 'STORAGE_ERROR',
    super.details,
  });
}

/// Exception thrown when authentication fails
class AuthenticationException extends AppException {
  const AuthenticationException({
    super.message = 'Authentication failed',
    super.code = 'AUTH_ERROR',
    super.details,
  });
}

/// Exception thrown when user is not authorized to perform an action
class AuthorizationException extends AppException {
  const AuthorizationException({
    super.message = 'Not authorized to perform this action',
    super.code = 'AUTHORIZATION_ERROR',
    super.details,
  });
}

/// Exception thrown when input validation fails
class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    super.details,
  });
}

/// Exception thrown when a requested resource is not found
class NotFoundException extends AppException {
  const NotFoundException({
    super.message = 'Requested resource not found',
    super.code = 'NOT_FOUND',
    super.details,
  });
}

/// Exception thrown when there's a conflict with current state
class ConflictException extends AppException {
  const ConflictException({
    required super.message,
    super.code = 'CONFLICT_ERROR',
    super.details,
  });
}

/// Exception thrown when rate limit is exceeded
class RateLimitException extends AppException {
  const RateLimitException({
    super.message = 'Rate limit exceeded. Please try again later.',
    super.code = 'RATE_LIMIT_ERROR',
    super.details,
  });
}
