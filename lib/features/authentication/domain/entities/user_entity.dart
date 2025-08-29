import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
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
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
