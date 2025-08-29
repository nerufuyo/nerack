/// A type that represents either a success or a failure
/// 
/// This is a simple implementation of the Result pattern commonly used
/// for error handling in functional programming.
sealed class Result<T, E> {
  const Result();
  
  /// Create a successful result
  const factory Result.success(T value) = Success<T, E>;
  
  /// Create a failure result
  const factory Result.failure(E error) = ResultFailure<T, E>;
  
  /// Check if the result is successful
  bool get isSuccess => this is Success<T, E>;
  
  /// Check if the result is a failure
  bool get isFailure => this is ResultFailure<T, E>;
  
  /// Get the success value (throws if failure)
  T get value {
    return switch (this) {
      Success<T, E>(value: final v) => v,
      ResultFailure<T, E>() => throw StateError('Called value on a Failure'),
    };
  }
  
  /// Get the error value (throws if success)
  E get error {
    return switch (this) {
      Success<T, E>() => throw StateError('Called error on a Success'),
      ResultFailure<T, E>(error: final e) => e,
    };
  }
  
  /// Get the success value or null
  T? get valueOrNull {
    return switch (this) {
      Success<T, E>(value: final v) => v,
      ResultFailure<T, E>() => null,
    };
  }
  
  /// Get the error value or null
  E? get errorOrNull {
    return switch (this) {
      Success<T, E>() => null,
      ResultFailure<T, E>(error: final e) => e,
    };
  }
  
  /// Transform the success value
  Result<U, E> map<U>(U Function(T) transform) {
    return switch (this) {
      Success<T, E>(value: final v) => Result.success(transform(v)),
      ResultFailure<T, E>(error: final e) => Result.failure(e),
    };
  }
  
  /// Transform the error value
  Result<T, U> mapError<U>(U Function(E) transform) {
    return switch (this) {
      Success<T, E>(value: final v) => Result.success(v),
      ResultFailure<T, E>(error: final e) => Result.failure(transform(e)),
    };
  }
  
  /// Chain another operation that returns a Result
  Result<U, E> flatMap<U>(Result<U, E> Function(T) transform) {
    return switch (this) {
      Success<T, E>(value: final v) => transform(v),
      ResultFailure<T, E>(error: final e) => Result.failure(e),
    };
  }
  
  /// Execute a function on success, return original result
  Result<T, E> onSuccess(void Function(T) action) {
    if (this case Success<T, E>(value: final v)) {
      action(v);
    }
    return this;
  }
  
  /// Execute a function on failure, return original result
  Result<T, E> onFailure(void Function(E) action) {
    if (this case ResultFailure<T, E>(error: final e)) {
      action(e);
    }
    return this;
  }
  
  /// Fold the result into a single value
  U fold<U>(U Function(T) onSuccess, U Function(E) onFailure) {
    return switch (this) {
      Success<T, E>(value: final v) => onSuccess(v),
      ResultFailure<T, E>(error: final e) => onFailure(e),
    };
  }
  
  /// Get the value or a default value
  T getOrDefault(T defaultValue) {
    return switch (this) {
      Success<T, E>(value: final v) => v,
      ResultFailure<T, E>() => defaultValue,
    };
  }
  
  /// Get the value or compute a default value
  T getOrElse(T Function() defaultValue) {
    return switch (this) {
      Success<T, E>(value: final v) => v,
      ResultFailure<T, E>() => defaultValue(),
    };
  }
}

/// Success case of Result
final class Success<T, E> extends Result<T, E> {
  final T value;
  
  const Success(this.value);
  
  @override
  bool operator ==(Object other) {
    return other is Success<T, E> && other.value == value;
  }
  
  @override
  int get hashCode => value.hashCode;
  
  @override
  String toString() => 'Success($value)';
}

/// Failure case of Result
final class ResultFailure<T, E> extends Result<T, E> {
  final E error;
  
  const ResultFailure(this.error);
  
  @override
  bool operator ==(Object other) {
    return other is ResultFailure<T, E> && other.error == error;
  }
  
  @override
  int get hashCode => error.hashCode;
  
  @override
  String toString() => 'Failure($error)';
}

/// Extension methods for working with Future<Result>
extension FutureResultExtensions<T, E> on Future<Result<T, E>> {
  /// Map the success value asynchronously
  Future<Result<U, E>> mapAsync<U>(Future<U> Function(T) transform) async {
    final result = await this;
    return switch (result) {
      Success<T, E>(value: final v) => Result.success(await transform(v)),
      ResultFailure<T, E>(error: final e) => Result.failure(e),
    };
  }
  
  /// Chain another async operation that returns a Result
  Future<Result<U, E>> flatMapAsync<U>(Future<Result<U, E>> Function(T) transform) async {
    final result = await this;
    return switch (result) {
      Success<T, E>(value: final v) => await transform(v),
      ResultFailure<T, E>(error: final e) => Result.failure(e),
    };
  }
}
