// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uri resetPasswordUri, String error) init,
    required TResult Function(String password, String repeatPassword)
        resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uri resetPasswordUri, String error)? init,
    TResult? Function(String password, String repeatPassword)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uri resetPasswordUri, String error)? init,
    TResult Function(String password, String repeatPassword)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ResetPassword value) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res, ResetPasswordEvent>;
}

/// @nodoc
class _$ResetPasswordEventCopyWithImpl<$Res, $Val extends ResetPasswordEvent>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri resetPasswordUri, String error});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetPasswordUri = null,
    Object? error = null,
  }) {
    return _then(_$InitImpl(
      resetPasswordUri: null == resetPasswordUri
          ? _value.resetPasswordUri
          : resetPasswordUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl({required this.resetPasswordUri, required this.error});

  @override
  final Uri resetPasswordUri;
  @override
  final String error;

  @override
  String toString() {
    return 'ResetPasswordEvent.init(resetPasswordUri: $resetPasswordUri, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.resetPasswordUri, resetPasswordUri) ||
                other.resetPasswordUri == resetPasswordUri) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetPasswordUri, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uri resetPasswordUri, String error) init,
    required TResult Function(String password, String repeatPassword)
        resetPassword,
  }) {
    return init(resetPasswordUri, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uri resetPasswordUri, String error)? init,
    TResult? Function(String password, String repeatPassword)? resetPassword,
  }) {
    return init?.call(resetPasswordUri, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uri resetPasswordUri, String error)? init,
    TResult Function(String password, String repeatPassword)? resetPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(resetPasswordUri, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ResetPasswordEvent {
  const factory _Init(
      {required final Uri resetPasswordUri,
      required final String error}) = _$InitImpl;

  Uri get resetPasswordUri;
  String get error;
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
          _$ResetPasswordImpl value, $Res Function(_$ResetPasswordImpl) then) =
      __$$ResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String repeatPassword});
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
      _$ResetPasswordImpl _value, $Res Function(_$ResetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? repeatPassword = null,
  }) {
    return _then(_$ResetPasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword: null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetPasswordImpl implements _ResetPassword {
  const _$ResetPasswordImpl(
      {required this.password, required this.repeatPassword});

  @override
  final String password;
  @override
  final String repeatPassword;

  @override
  String toString() {
    return 'ResetPasswordEvent.resetPassword(password: $password, repeatPassword: $repeatPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.repeatPassword, repeatPassword) ||
                other.repeatPassword == repeatPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, repeatPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uri resetPasswordUri, String error) init,
    required TResult Function(String password, String repeatPassword)
        resetPassword,
  }) {
    return resetPassword(password, repeatPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uri resetPasswordUri, String error)? init,
    TResult? Function(String password, String repeatPassword)? resetPassword,
  }) {
    return resetPassword?.call(password, repeatPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uri resetPasswordUri, String error)? init,
    TResult Function(String password, String repeatPassword)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(password, repeatPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements ResetPasswordEvent {
  const factory _ResetPassword(
      {required final String password,
      required final String repeatPassword}) = _$ResetPasswordImpl;

  String get password;
  String get repeatPassword;
  @JsonKey(ignore: true)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResetPasswordState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isExpired => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  FieldValidationErrorModel? get passwordError =>
      throw _privateConstructorUsedError;
  FieldValidationErrorModel? get repeatPasswordError =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      bool isExpired,
      String? errorMessage,
      FieldValidationErrorModel? passwordError,
      FieldValidationErrorModel? repeatPasswordError});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isExpired = null,
    Object? errorMessage = freezed,
    Object? passwordError = freezed,
    Object? repeatPasswordError = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
      repeatPasswordError: freezed == repeatPasswordError
          ? _value.repeatPasswordError
          : repeatPasswordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordStateImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateImplCopyWith(_$ResetPasswordStateImpl value,
          $Res Function(_$ResetPasswordStateImpl) then) =
      __$$ResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      bool isExpired,
      String? errorMessage,
      FieldValidationErrorModel? passwordError,
      FieldValidationErrorModel? repeatPasswordError});
}

/// @nodoc
class __$$ResetPasswordStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateImpl>
    implements _$$ResetPasswordStateImplCopyWith<$Res> {
  __$$ResetPasswordStateImplCopyWithImpl(_$ResetPasswordStateImpl _value,
      $Res Function(_$ResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isExpired = null,
    Object? errorMessage = freezed,
    Object? passwordError = freezed,
    Object? repeatPasswordError = freezed,
  }) {
    return _then(_$ResetPasswordStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
      repeatPasswordError: freezed == repeatPasswordError
          ? _value.repeatPasswordError
          : repeatPasswordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateImpl implements _ResetPasswordState {
  const _$ResetPasswordStateImpl(
      {required this.status,
      required this.isExpired,
      this.errorMessage,
      this.passwordError,
      this.repeatPasswordError});

  @override
  final FormzSubmissionStatus status;
  @override
  final bool isExpired;
  @override
  final String? errorMessage;
  @override
  final FieldValidationErrorModel? passwordError;
  @override
  final FieldValidationErrorModel? repeatPasswordError;

  @override
  String toString() {
    return 'ResetPasswordState(status: $status, isExpired: $isExpired, errorMessage: $errorMessage, passwordError: $passwordError, repeatPasswordError: $repeatPasswordError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.repeatPasswordError, repeatPasswordError) ||
                other.repeatPasswordError == repeatPasswordError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isExpired, errorMessage,
      passwordError, repeatPasswordError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      __$$ResetPasswordStateImplCopyWithImpl<_$ResetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ResetPasswordState implements ResetPasswordState {
  const factory _ResetPasswordState(
          {required final FormzSubmissionStatus status,
          required final bool isExpired,
          final String? errorMessage,
          final FieldValidationErrorModel? passwordError,
          final FieldValidationErrorModel? repeatPasswordError}) =
      _$ResetPasswordStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  bool get isExpired;
  @override
  String? get errorMessage;
  @override
  FieldValidationErrorModel? get passwordError;
  @override
  FieldValidationErrorModel? get repeatPasswordError;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
