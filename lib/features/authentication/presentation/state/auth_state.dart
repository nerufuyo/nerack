import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({
    required String userId,
    required String email,
    String? firstName,
    String? lastName,
    String? username,
    String? avatar,
  }) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error({required String message, String? code}) =
      AuthError;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.error({required String message, String? code}) =
      LoginError;
}

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success() = RegisterSuccess;
  const factory RegisterState.error({required String message, String? code}) =
      RegisterError;
}

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = ForgotPasswordInitial;
  const factory ForgotPasswordState.loading() = ForgotPasswordLoading;
  const factory ForgotPasswordState.success() = ForgotPasswordSuccess;
  const factory ForgotPasswordState.error({
    required String message,
    String? code,
  }) = ForgotPasswordError;
}
