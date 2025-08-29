import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nerack/features/authentication/domain/entities/auth_response.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String accessToken,
    required String refreshToken,
    required UserProfileModel user,
    required int expiresIn,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  AuthResponse toEntity() => AuthResponse(
    accessToken: accessToken,
    refreshToken: refreshToken,
    user: user.toEntity(),
    expiresIn: expiresIn,
  );
}

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String id,
    required String email,
    String? firstName,
    String? lastName,
    String? username,
    String? avatar,
    String? bio,
    @Default(false) bool emailVerified,
    DateTime? lastLogin,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  factory UserProfileModel.fromEntity(UserProfile entity) => UserProfileModel(
    id: entity.id,
    email: entity.email,
    firstName: entity.firstName,
    lastName: entity.lastName,
    username: entity.username,
    avatar: entity.avatar,
    bio: entity.bio,
    emailVerified: entity.emailVerified,
    lastLogin: entity.lastLogin,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
  );

  UserProfile toEntity() => UserProfile(
    id: id,
    email: email,
    firstName: firstName,
    lastName: lastName,
    username: username,
    avatar: avatar,
    bio: bio,
    emailVerified: emailVerified,
    lastLogin: lastLogin,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

@freezed
class RefreshTokenResponseModel with _$RefreshTokenResponseModel {
  const factory RefreshTokenResponseModel({
    required String accessToken,
    required int expiresIn,
  }) = _RefreshTokenResponseModel;

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);

  RefreshTokenResponse toEntity() =>
      RefreshTokenResponse(accessToken: accessToken, expiresIn: expiresIn);
}
