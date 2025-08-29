// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestModelImpl _$$LoginRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginRequestModelImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  rememberMe: json['rememberMe'] as bool? ?? false,
);

Map<String, dynamic> _$$LoginRequestModelImplToJson(
  _$LoginRequestModelImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'rememberMe': instance.rememberMe,
};

_$RegisterRequestModelImpl _$$RegisterRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestModelImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  username: json['username'] as String?,
);

Map<String, dynamic> _$$RegisterRequestModelImplToJson(
  _$RegisterRequestModelImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'username': instance.username,
};

_$ForgotPasswordRequestModelImpl _$$ForgotPasswordRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForgotPasswordRequestModelImpl(email: json['email'] as String);

Map<String, dynamic> _$$ForgotPasswordRequestModelImplToJson(
  _$ForgotPasswordRequestModelImpl instance,
) => <String, dynamic>{'email': instance.email};

_$ResetPasswordRequestModelImpl _$$ResetPasswordRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ResetPasswordRequestModelImpl(
  token: json['token'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
);

Map<String, dynamic> _$$ResetPasswordRequestModelImplToJson(
  _$ResetPasswordRequestModelImpl instance,
) => <String, dynamic>{
  'token': instance.token,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};
