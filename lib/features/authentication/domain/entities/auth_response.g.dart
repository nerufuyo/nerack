// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'expiresIn': instance.expiresIn,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'emailVerified': instance.emailVerified,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$RefreshTokenResponseImpl _$$RefreshTokenResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RefreshTokenResponseImpl(
  accessToken: json['accessToken'] as String,
  expiresIn: (json['expiresIn'] as num).toInt(),
);

Map<String, dynamic> _$$RefreshTokenResponseImplToJson(
  _$RefreshTokenResponseImpl instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'expiresIn': instance.expiresIn,
};
