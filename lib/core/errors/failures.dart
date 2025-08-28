import 'package:equatable/equatable.dart';

/// Base class for all application failures
abstract class Failure extends Equatable {
  const Failure({
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
  String toString() => 'Failure(message: $message, code: $code, details: $details)';
}

/// Failure representing server-related errors
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.details,
    this.statusCode,
  });

  final int? statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}

/// Failure representing network connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection available',
    super.code = 'NETWORK_ERROR',
    super.details,
  });
}

/// Failure representing cached data unavailability
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cached data not available',
    super.code = 'CACHE_ERROR',
    super.details,
  });
}

/// Failure representing local storage issues
class StorageFailure extends Failure {
  const StorageFailure({
    required super.message,
    super.code = 'STORAGE_ERROR',
    super.details,
  });
}

/// Failure representing authentication issues
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    super.message = 'Authentication failed',
    super.code = 'AUTH_ERROR',
    super.details,
  });
}

/// Failure representing authorization issues
class AuthorizationFailure extends Failure {
  const AuthorizationFailure({
    super.message = 'Not authorized to perform this action',
    super.code = 'AUTHORIZATION_ERROR',
    super.details,
  });
}

/// Failure representing validation errors
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    super.details,
  });
}

/// Failure representing resource not found errors
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Requested resource not found',
    super.code = 'NOT_FOUND',
    super.details,
  });
}

/// Failure representing conflict errors
class ConflictFailure extends Failure {
  const ConflictFailure({
    required super.message,
    super.code = 'CONFLICT_ERROR',
    super.details,
  });
}

/// Failure representing rate limit errors
class RateLimitFailure extends Failure {
  const RateLimitFailure({
    super.message = 'Rate limit exceeded. Please try again later.',
    super.code = 'RATE_LIMIT_ERROR',
    super.details,
  });
}
