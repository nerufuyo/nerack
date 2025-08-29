import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_request.dart';

part 'auth_request_model.freezed.dart';
part 'auth_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String email,
    required String password,
    @Default(false) bool rememberMe,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  factory LoginRequestModel.fromEntity(LoginRequest entity) =>
      LoginRequestModel(
        email: entity.email,
        password: entity.password,
        rememberMe: entity.rememberMe,
      );

  LoginRequest toEntity() =>
      LoginRequest(email: email, password: password, rememberMe: rememberMe);
}

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String email,
    required String password,
    required String confirmPassword,
    String? firstName,
    String? lastName,
    String? username,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  factory RegisterRequestModel.fromEntity(RegisterRequest entity) =>
      RegisterRequestModel(
        email: entity.email,
        password: entity.password,
        confirmPassword: entity.confirmPassword,
        firstName: entity.firstName,
        lastName: entity.lastName,
        username: entity.username,
      );

  RegisterRequest toEntity() => RegisterRequest(
    email: email,
    password: password,
    confirmPassword: confirmPassword,
    firstName: firstName,
    lastName: lastName,
    username: username,
  );
}

@freezed
class ForgotPasswordRequestModel with _$ForgotPasswordRequestModel {
  const factory ForgotPasswordRequestModel({required String email}) =
      _ForgotPasswordRequestModel;

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestModelFromJson(json);

  factory ForgotPasswordRequestModel.fromEntity(ForgotPasswordRequest entity) =>
      ForgotPasswordRequestModel(email: entity.email);

  ForgotPasswordRequest toEntity() => ForgotPasswordRequest(email: email);
}

@freezed
class ResetPasswordRequestModel with _$ResetPasswordRequestModel {
  const factory ResetPasswordRequestModel({
    required String token,
    required String password,
    required String confirmPassword,
  }) = _ResetPasswordRequestModel;

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);

  factory ResetPasswordRequestModel.fromEntity(ResetPasswordRequest entity) =>
      ResetPasswordRequestModel(
        token: entity.token,
        password: entity.password,
        confirmPassword: entity.confirmPassword,
      );

  ResetPasswordRequest toEntity() => ResetPasswordRequest(
    token: token,
    password: password,
    confirmPassword: confirmPassword,
  );
}
