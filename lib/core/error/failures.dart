import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}

// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
  });
}

// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
  });
}

// Authentication failures
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    required super.message,
    super.code,
  });
}

// Validation failures
class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;

  const ValidationFailure({
    required super.message,
    super.code,
    this.fieldErrors,
  });

  @override
  List<Object?> get props => [message, code, fieldErrors];
}

// Cache/Local storage failures
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
  });
}

// File system failures
class FileSystemFailure extends Failure {
  const FileSystemFailure({
    required super.message,
    super.code,
  });
}

// Permissions failures
class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
    super.code,
  });
}

// General application failures
class ApplicationFailure extends Failure {
  const ApplicationFailure({
    required super.message,
    super.code,
  });
}

// Data parsing failures
class DataParsingFailure extends Failure {
  const DataParsingFailure({
    required super.message,
    super.code,
  });
}

// Book-specific failures
class BookNotFoundFailure extends Failure {
  const BookNotFoundFailure({
    required super.message,
    super.code,
  });
}

class DuplicateBookFailure extends Failure {
  const DuplicateBookFailure({
    required super.message,
    super.code,
  });
}

class InvalidISBNFailure extends Failure {
  const InvalidISBNFailure({
    required super.message,
    super.code,
  });
}

// Unexpected application failures
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    required super.message,
    super.code,
  });
}

// Helper function to create appropriate failure from error
Failure mapErrorToFailure(dynamic error) {
  if (error is Failure) {
    return error;
  }

  // Map different error types to appropriate failures
  if (error.toString().contains('network') || 
      error.toString().contains('connection')) {
    return NetworkFailure(
      message: 'Network connection error: ${error.toString()}',
    );
  }

  if (error.toString().contains('unauthorized') ||
      error.toString().contains('authentication')) {
    return const AuthenticationFailure(
      message: 'Authentication failed',
    );
  }

  if (error.toString().contains('validation')) {
    return ValidationFailure(
      message: 'Validation error: ${error.toString()}',
    );
  }

  // Default to application failure
  return ApplicationFailure(
    message: 'An unexpected error occurred: ${error.toString()}',
  );
}
