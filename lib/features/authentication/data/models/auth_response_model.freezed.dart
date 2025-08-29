// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  UserProfileModel get user => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this AuthResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
    AuthResponseModel value,
    $Res Function(AuthResponseModel) then,
  ) = _$AuthResponseModelCopyWithImpl<$Res, AuthResponseModel>;
  @useResult
  $Res call({
    String accessToken,
    String refreshToken,
    UserProfileModel user,
    int expiresIn,
  });

  $UserProfileModelCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res, $Val extends AuthResponseModel>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
    Object? expiresIn = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserProfileModel,
            expiresIn: null == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get user {
    return $UserProfileModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseModelImplCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$$AuthResponseModelImplCopyWith(
    _$AuthResponseModelImpl value,
    $Res Function(_$AuthResponseModelImpl) then,
  ) = __$$AuthResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accessToken,
    String refreshToken,
    UserProfileModel user,
    int expiresIn,
  });

  @override
  $UserProfileModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthResponseModelImplCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res, _$AuthResponseModelImpl>
    implements _$$AuthResponseModelImplCopyWith<$Res> {
  __$$AuthResponseModelImplCopyWithImpl(
    _$AuthResponseModelImpl _value,
    $Res Function(_$AuthResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
    Object? expiresIn = null,
  }) {
    return _then(
      _$AuthResponseModelImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserProfileModel,
        expiresIn: null == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseModelImpl implements _AuthResponseModel {
  const _$AuthResponseModelImpl({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    required this.expiresIn,
  });

  factory _$AuthResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final UserProfileModel user;
  @override
  final int expiresIn;

  @override
  String toString() {
    return 'AuthResponseModel(accessToken: $accessToken, refreshToken: $refreshToken, user: $user, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, user, expiresIn);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      __$$AuthResponseModelImplCopyWithImpl<_$AuthResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseModelImplToJson(this);
  }
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel({
    required final String accessToken,
    required final String refreshToken,
    required final UserProfileModel user,
    required final int expiresIn,
  }) = _$AuthResponseModelImpl;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$AuthResponseModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  UserProfileModel get user;
  @override
  int get expiresIn;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
    UserProfileModel value,
    $Res Function(UserProfileModel) then,
  ) = _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call({
    String id,
    String email,
    String? firstName,
    String? lastName,
    String? username,
    String? avatar,
    String? bio,
    bool emailVerified,
    DateTime? lastLogin,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? bio = freezed,
    Object? emailVerified = null,
    Object? lastLogin = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            emailVerified: null == emailVerified
                ? _value.emailVerified
                : emailVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastLogin: freezed == lastLogin
                ? _value.lastLogin
                : lastLogin // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(
    _$UserProfileModelImpl value,
    $Res Function(_$UserProfileModelImpl) then,
  ) = __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String? firstName,
    String? lastName,
    String? username,
    String? avatar,
    String? bio,
    bool emailVerified,
    DateTime? lastLogin,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(
    _$UserProfileModelImpl _value,
    $Res Function(_$UserProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? bio = freezed,
    Object? emailVerified = null,
    Object? lastLogin = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$UserProfileModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        emailVerified: null == emailVerified
            ? _value.emailVerified
            : emailVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastLogin: freezed == lastLogin
            ? _value.lastLogin
            : lastLogin // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  const _$UserProfileModelImpl({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.avatar,
    this.bio,
    this.emailVerified = false,
    this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? username;
  @override
  final String? avatar;
  @override
  final String? bio;
  @override
  @JsonKey()
  final bool emailVerified;
  @override
  final DateTime? lastLogin;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserProfileModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, username: $username, avatar: $avatar, bio: $bio, emailVerified: $emailVerified, lastLogin: $lastLogin, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    firstName,
    lastName,
    username,
    avatar,
    bio,
    emailVerified,
    lastLogin,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(this);
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  const factory _UserProfileModel({
    required final String id,
    required final String email,
    final String? firstName,
    final String? lastName,
    final String? username,
    final String? avatar,
    final String? bio,
    final bool emailVerified,
    final DateTime? lastLogin,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get username;
  @override
  String? get avatar;
  @override
  String? get bio;
  @override
  bool get emailVerified;
  @override
  DateTime? get lastLogin;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _RefreshTokenResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponseModel {
  String get accessToken => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenResponseModelCopyWith<RefreshTokenResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseModelCopyWith<$Res> {
  factory $RefreshTokenResponseModelCopyWith(
    RefreshTokenResponseModel value,
    $Res Function(RefreshTokenResponseModel) then,
  ) = _$RefreshTokenResponseModelCopyWithImpl<$Res, RefreshTokenResponseModel>;
  @useResult
  $Res call({String accessToken, int expiresIn});
}

/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<
  $Res,
  $Val extends RefreshTokenResponseModel
>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? expiresIn = null}) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresIn: null == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefreshTokenResponseModelImplCopyWith<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  factory _$$RefreshTokenResponseModelImplCopyWith(
    _$RefreshTokenResponseModelImpl value,
    $Res Function(_$RefreshTokenResponseModelImpl) then,
  ) = __$$RefreshTokenResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, int expiresIn});
}

/// @nodoc
class __$$RefreshTokenResponseModelImplCopyWithImpl<$Res>
    extends
        _$RefreshTokenResponseModelCopyWithImpl<
          $Res,
          _$RefreshTokenResponseModelImpl
        >
    implements _$$RefreshTokenResponseModelImplCopyWith<$Res> {
  __$$RefreshTokenResponseModelImplCopyWithImpl(
    _$RefreshTokenResponseModelImpl _value,
    $Res Function(_$RefreshTokenResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? expiresIn = null}) {
    return _then(
      _$RefreshTokenResponseModelImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresIn: null == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenResponseModelImpl implements _RefreshTokenResponseModel {
  const _$RefreshTokenResponseModelImpl({
    required this.accessToken,
    required this.expiresIn,
  });

  factory _$RefreshTokenResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResponseModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final int expiresIn;

  @override
  String toString() {
    return 'RefreshTokenResponseModel(accessToken: $accessToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResponseModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, expiresIn);

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResponseModelImplCopyWith<_$RefreshTokenResponseModelImpl>
  get copyWith =>
      __$$RefreshTokenResponseModelImplCopyWithImpl<
        _$RefreshTokenResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResponseModelImplToJson(this);
  }
}

abstract class _RefreshTokenResponseModel implements RefreshTokenResponseModel {
  const factory _RefreshTokenResponseModel({
    required final String accessToken,
    required final int expiresIn,
  }) = _$RefreshTokenResponseModelImpl;

  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResponseModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  int get expiresIn;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenResponseModelImplCopyWith<_$RefreshTokenResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
