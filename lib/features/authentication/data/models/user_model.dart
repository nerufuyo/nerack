import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
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

  UserEntity toEntity() => UserEntity(
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
