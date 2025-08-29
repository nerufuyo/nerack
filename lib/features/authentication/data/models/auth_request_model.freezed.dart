// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) {
  return _LoginRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestModelCopyWith<LoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestModelCopyWith<$Res> {
  factory $LoginRequestModelCopyWith(
    LoginRequestModel value,
    $Res Function(LoginRequestModel) then,
  ) = _$LoginRequestModelCopyWithImpl<$Res, LoginRequestModel>;
  @useResult
  $Res call({String email, String password, bool rememberMe});
}

/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res, $Val extends LoginRequestModel>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            rememberMe: null == rememberMe
                ? _value.rememberMe
                : rememberMe // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestModelImplCopyWith<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  factory _$$LoginRequestModelImplCopyWith(
    _$LoginRequestModelImpl value,
    $Res Function(_$LoginRequestModelImpl) then,
  ) = __$$LoginRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, bool rememberMe});
}

/// @nodoc
class __$$LoginRequestModelImplCopyWithImpl<$Res>
    extends _$LoginRequestModelCopyWithImpl<$Res, _$LoginRequestModelImpl>
    implements _$$LoginRequestModelImplCopyWith<$Res> {
  __$$LoginRequestModelImplCopyWithImpl(
    _$LoginRequestModelImpl _value,
    $Res Function(_$LoginRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
  }) {
    return _then(
      _$LoginRequestModelImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        rememberMe: null == rememberMe
            ? _value.rememberMe
            : rememberMe // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestModelImpl implements _LoginRequestModel {
  const _$LoginRequestModelImpl({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  factory _$LoginRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey()
  final bool rememberMe;

  @override
  String toString() {
    return 'LoginRequestModel(email: $email, password: $password, rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, rememberMe);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      __$$LoginRequestModelImplCopyWithImpl<_$LoginRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestModelImplToJson(this);
  }
}

abstract class _LoginRequestModel implements LoginRequestModel {
  const factory _LoginRequestModel({
    required final String email,
    required final String password,
    final bool rememberMe,
  }) = _$LoginRequestModelImpl;

  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) =
      _$LoginRequestModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get rememberMe;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequestModel _$RegisterRequestModelFromJson(Map<String, dynamic> json) {
  return _RegisterRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestModelCopyWith<RegisterRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestModelCopyWith<$Res> {
  factory $RegisterRequestModelCopyWith(
    RegisterRequestModel value,
    $Res Function(RegisterRequestModel) then,
  ) = _$RegisterRequestModelCopyWithImpl<$Res, RegisterRequestModel>;
  @useResult
  $Res call({
    String email,
    String password,
    String confirmPassword,
    String? firstName,
    String? lastName,
    String? username,
  });
}

/// @nodoc
class _$RegisterRequestModelCopyWithImpl<
  $Res,
  $Val extends RegisterRequestModel
>
    implements $RegisterRequestModelCopyWith<$Res> {
  _$RegisterRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            confirmPassword: null == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterRequestModelImplCopyWith<$Res>
    implements $RegisterRequestModelCopyWith<$Res> {
  factory _$$RegisterRequestModelImplCopyWith(
    _$RegisterRequestModelImpl value,
    $Res Function(_$RegisterRequestModelImpl) then,
  ) = __$$RegisterRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    String confirmPassword,
    String? firstName,
    String? lastName,
    String? username,
  });
}

/// @nodoc
class __$$RegisterRequestModelImplCopyWithImpl<$Res>
    extends _$RegisterRequestModelCopyWithImpl<$Res, _$RegisterRequestModelImpl>
    implements _$$RegisterRequestModelImplCopyWith<$Res> {
  __$$RegisterRequestModelImplCopyWithImpl(
    _$RegisterRequestModelImpl _value,
    $Res Function(_$RegisterRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
  }) {
    return _then(
      _$RegisterRequestModelImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestModelImpl implements _RegisterRequestModel {
  const _$RegisterRequestModelImpl({
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.firstName,
    this.lastName,
    this.username,
  });

  factory _$RegisterRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? username;

  @override
  String toString() {
    return 'RegisterRequestModel(email: $email, password: $password, confirmPassword: $confirmPassword, firstName: $firstName, lastName: $lastName, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    password,
    confirmPassword,
    firstName,
    lastName,
    username,
  );

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestModelImplCopyWith<_$RegisterRequestModelImpl>
  get copyWith =>
      __$$RegisterRequestModelImplCopyWithImpl<_$RegisterRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestModelImplToJson(this);
  }
}

abstract class _RegisterRequestModel implements RegisterRequestModel {
  const factory _RegisterRequestModel({
    required final String email,
    required final String password,
    required final String confirmPassword,
    final String? firstName,
    final String? lastName,
    final String? username,
  }) = _$RegisterRequestModelImpl;

  factory _RegisterRequestModel.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get username;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestModelImplCopyWith<_$RegisterRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForgotPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordRequestModel {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ForgotPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordRequestModelCopyWith<ForgotPasswordRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordRequestModelCopyWith<$Res> {
  factory $ForgotPasswordRequestModelCopyWith(
    ForgotPasswordRequestModel value,
    $Res Function(ForgotPasswordRequestModel) then,
  ) =
      _$ForgotPasswordRequestModelCopyWithImpl<
        $Res,
        ForgotPasswordRequestModel
      >;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordRequestModelCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordRequestModel
>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  _$ForgotPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordRequestModelImplCopyWith<$Res>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  factory _$$ForgotPasswordRequestModelImplCopyWith(
    _$ForgotPasswordRequestModelImpl value,
    $Res Function(_$ForgotPasswordRequestModelImpl) then,
  ) = __$$ForgotPasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordRequestModelImplCopyWithImpl<$Res>
    extends
        _$ForgotPasswordRequestModelCopyWithImpl<
          $Res,
          _$ForgotPasswordRequestModelImpl
        >
    implements _$$ForgotPasswordRequestModelImplCopyWith<$Res> {
  __$$ForgotPasswordRequestModelImplCopyWithImpl(
    _$ForgotPasswordRequestModelImpl _value,
    $Res Function(_$ForgotPasswordRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ForgotPasswordRequestModelImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordRequestModelImpl implements _ForgotPasswordRequestModel {
  const _$ForgotPasswordRequestModelImpl({required this.email});

  factory _$ForgotPasswordRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ForgotPasswordRequestModelImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordRequestModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordRequestModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordRequestModelImplCopyWith<_$ForgotPasswordRequestModelImpl>
  get copyWith =>
      __$$ForgotPasswordRequestModelImplCopyWithImpl<
        _$ForgotPasswordRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordRequestModelImplToJson(this);
  }
}

abstract class _ForgotPasswordRequestModel
    implements ForgotPasswordRequestModel {
  const factory _ForgotPasswordRequestModel({required final String email}) =
      _$ForgotPasswordRequestModelImpl;

  factory _ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordRequestModelImpl.fromJson;

  @override
  String get email;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordRequestModelImplCopyWith<_$ForgotPasswordRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResetPasswordRequestModel _$ResetPasswordRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ResetPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordRequestModel {
  String get token => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordRequestModelCopyWith<ResetPasswordRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordRequestModelCopyWith<$Res> {
  factory $ResetPasswordRequestModelCopyWith(
    ResetPasswordRequestModel value,
    $Res Function(ResetPasswordRequestModel) then,
  ) = _$ResetPasswordRequestModelCopyWithImpl<$Res, ResetPasswordRequestModel>;
  @useResult
  $Res call({String token, String password, String confirmPassword});
}

/// @nodoc
class _$ResetPasswordRequestModelCopyWithImpl<
  $Res,
  $Val extends ResetPasswordRequestModel
>
    implements $ResetPasswordRequestModelCopyWith<$Res> {
  _$ResetPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            confirmPassword: null == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordRequestModelImplCopyWith<$Res>
    implements $ResetPasswordRequestModelCopyWith<$Res> {
  factory _$$ResetPasswordRequestModelImplCopyWith(
    _$ResetPasswordRequestModelImpl value,
    $Res Function(_$ResetPasswordRequestModelImpl) then,
  ) = __$$ResetPasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String password, String confirmPassword});
}

/// @nodoc
class __$$ResetPasswordRequestModelImplCopyWithImpl<$Res>
    extends
        _$ResetPasswordRequestModelCopyWithImpl<
          $Res,
          _$ResetPasswordRequestModelImpl
        >
    implements _$$ResetPasswordRequestModelImplCopyWith<$Res> {
  __$$ResetPasswordRequestModelImplCopyWithImpl(
    _$ResetPasswordRequestModelImpl _value,
    $Res Function(_$ResetPasswordRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _$ResetPasswordRequestModelImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordRequestModelImpl implements _ResetPasswordRequestModel {
  const _$ResetPasswordRequestModelImpl({
    required this.token,
    required this.password,
    required this.confirmPassword,
  });

  factory _$ResetPasswordRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordRequestModelImplFromJson(json);

  @override
  final String token;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ResetPasswordRequestModel(token: $token, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, password, confirmPassword);

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestModelImplCopyWith<_$ResetPasswordRequestModelImpl>
  get copyWith =>
      __$$ResetPasswordRequestModelImplCopyWithImpl<
        _$ResetPasswordRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordRequestModelImplToJson(this);
  }
}

abstract class _ResetPasswordRequestModel implements ResetPasswordRequestModel {
  const factory _ResetPasswordRequestModel({
    required final String token,
    required final String password,
    required final String confirmPassword,
  }) = _$ResetPasswordRequestModelImpl;

  factory _ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordRequestModelImpl.fromJson;

  @override
  String get token;
  @override
  String get password;
  @override
  String get confirmPassword;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordRequestModelImplCopyWith<_$ResetPasswordRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
