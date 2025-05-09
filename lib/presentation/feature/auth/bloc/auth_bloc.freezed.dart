// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isSessionExist,
    required TResult Function() logout,
    required TResult Function() deleteAccount,
    required TResult Function(AuthenticationStatus authenticationStatus)
        authenticationStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isSessionExist,
    TResult? Function()? logout,
    TResult? Function()? deleteAccount,
    TResult? Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isSessionExist,
    TResult Function()? logout,
    TResult Function()? deleteAccount,
    TResult Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsSessionExist value) isSessionExist,
    required TResult Function(_Logout value) logout,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_AuthenticationStatusChanged value)
        authenticationStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsSessionExist value)? isSessionExist,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsSessionExist value)? isSessionExist,
    TResult Function(_Logout value)? logout,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IsSessionExistImplCopyWith<$Res> {
  factory _$$IsSessionExistImplCopyWith(_$IsSessionExistImpl value,
          $Res Function(_$IsSessionExistImpl) then) =
      __$$IsSessionExistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsSessionExistImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$IsSessionExistImpl>
    implements _$$IsSessionExistImplCopyWith<$Res> {
  __$$IsSessionExistImplCopyWithImpl(
      _$IsSessionExistImpl _value, $Res Function(_$IsSessionExistImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsSessionExistImpl implements _IsSessionExist {
  const _$IsSessionExistImpl();

  @override
  String toString() {
    return 'AuthEvent.isSessionExist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsSessionExistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isSessionExist,
    required TResult Function() logout,
    required TResult Function() deleteAccount,
    required TResult Function(AuthenticationStatus authenticationStatus)
        authenticationStatusChanged,
  }) {
    return isSessionExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isSessionExist,
    TResult? Function()? logout,
    TResult? Function()? deleteAccount,
    TResult? Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
  }) {
    return isSessionExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isSessionExist,
    TResult Function()? logout,
    TResult Function()? deleteAccount,
    TResult Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (isSessionExist != null) {
      return isSessionExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsSessionExist value) isSessionExist,
    required TResult Function(_Logout value) logout,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_AuthenticationStatusChanged value)
        authenticationStatusChanged,
  }) {
    return isSessionExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsSessionExist value)? isSessionExist,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
  }) {
    return isSessionExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsSessionExist value)? isSessionExist,
    TResult Function(_Logout value)? logout,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (isSessionExist != null) {
      return isSessionExist(this);
    }
    return orElse();
  }
}

abstract class _IsSessionExist implements AuthEvent {
  const factory _IsSessionExist() = _$IsSessionExistImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isSessionExist,
    required TResult Function() logout,
    required TResult Function() deleteAccount,
    required TResult Function(AuthenticationStatus authenticationStatus)
        authenticationStatusChanged,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isSessionExist,
    TResult? Function()? logout,
    TResult? Function()? deleteAccount,
    TResult? Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isSessionExist,
    TResult Function()? logout,
    TResult Function()? deleteAccount,
    TResult Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsSessionExist value) isSessionExist,
    required TResult Function(_Logout value) logout,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_AuthenticationStatusChanged value)
        authenticationStatusChanged,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsSessionExist value)? isSessionExist,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsSessionExist value)? isSessionExist,
    TResult Function(_Logout value)? logout,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$DeleteAccountImplCopyWith<$Res> {
  factory _$$DeleteAccountImplCopyWith(
          _$DeleteAccountImpl value, $Res Function(_$DeleteAccountImpl) then) =
      __$$DeleteAccountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAccountImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DeleteAccountImpl>
    implements _$$DeleteAccountImplCopyWith<$Res> {
  __$$DeleteAccountImplCopyWithImpl(
      _$DeleteAccountImpl _value, $Res Function(_$DeleteAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteAccountImpl implements _DeleteAccount {
  const _$DeleteAccountImpl();

  @override
  String toString() {
    return 'AuthEvent.deleteAccount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteAccountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isSessionExist,
    required TResult Function() logout,
    required TResult Function() deleteAccount,
    required TResult Function(AuthenticationStatus authenticationStatus)
        authenticationStatusChanged,
  }) {
    return deleteAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isSessionExist,
    TResult? Function()? logout,
    TResult? Function()? deleteAccount,
    TResult? Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
  }) {
    return deleteAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isSessionExist,
    TResult Function()? logout,
    TResult Function()? deleteAccount,
    TResult Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsSessionExist value) isSessionExist,
    required TResult Function(_Logout value) logout,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_AuthenticationStatusChanged value)
        authenticationStatusChanged,
  }) {
    return deleteAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsSessionExist value)? isSessionExist,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
  }) {
    return deleteAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsSessionExist value)? isSessionExist,
    TResult Function(_Logout value)? logout,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount(this);
    }
    return orElse();
  }
}

abstract class _DeleteAccount implements AuthEvent {
  const factory _DeleteAccount() = _$DeleteAccountImpl;
}

/// @nodoc
abstract class _$$AuthenticationStatusChangedImplCopyWith<$Res> {
  factory _$$AuthenticationStatusChangedImplCopyWith(
          _$AuthenticationStatusChangedImpl value,
          $Res Function(_$AuthenticationStatusChangedImpl) then) =
      __$$AuthenticationStatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthenticationStatus authenticationStatus});
}

/// @nodoc
class __$$AuthenticationStatusChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthenticationStatusChangedImpl>
    implements _$$AuthenticationStatusChangedImplCopyWith<$Res> {
  __$$AuthenticationStatusChangedImplCopyWithImpl(
      _$AuthenticationStatusChangedImpl _value,
      $Res Function(_$AuthenticationStatusChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticationStatus = null,
  }) {
    return _then(_$AuthenticationStatusChangedImpl(
      authenticationStatus: null == authenticationStatus
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }
}

/// @nodoc

class _$AuthenticationStatusChangedImpl
    implements _AuthenticationStatusChanged {
  const _$AuthenticationStatusChangedImpl({required this.authenticationStatus});

  @override
  final AuthenticationStatus authenticationStatus;

  @override
  String toString() {
    return 'AuthEvent.authenticationStatusChanged(authenticationStatus: $authenticationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStatusChangedImpl &&
            (identical(other.authenticationStatus, authenticationStatus) ||
                other.authenticationStatus == authenticationStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authenticationStatus);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationStatusChangedImplCopyWith<_$AuthenticationStatusChangedImpl>
      get copyWith => __$$AuthenticationStatusChangedImplCopyWithImpl<
          _$AuthenticationStatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isSessionExist,
    required TResult Function() logout,
    required TResult Function() deleteAccount,
    required TResult Function(AuthenticationStatus authenticationStatus)
        authenticationStatusChanged,
  }) {
    return authenticationStatusChanged(authenticationStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isSessionExist,
    TResult? Function()? logout,
    TResult? Function()? deleteAccount,
    TResult? Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
  }) {
    return authenticationStatusChanged?.call(authenticationStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isSessionExist,
    TResult Function()? logout,
    TResult Function()? deleteAccount,
    TResult Function(AuthenticationStatus authenticationStatus)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (authenticationStatusChanged != null) {
      return authenticationStatusChanged(authenticationStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsSessionExist value) isSessionExist,
    required TResult Function(_Logout value) logout,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_AuthenticationStatusChanged value)
        authenticationStatusChanged,
  }) {
    return authenticationStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsSessionExist value)? isSessionExist,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
  }) {
    return authenticationStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsSessionExist value)? isSessionExist,
    TResult Function(_Logout value)? logout,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_AuthenticationStatusChanged value)?
        authenticationStatusChanged,
    required TResult orElse(),
  }) {
    if (authenticationStatusChanged != null) {
      return authenticationStatusChanged(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationStatusChanged implements AuthEvent {
  const factory _AuthenticationStatusChanged(
          {required final AuthenticationStatus authenticationStatus}) =
      _$AuthenticationStatusChangedImpl;

  AuthenticationStatus get authenticationStatus;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationStatusChangedImplCopyWith<_$AuthenticationStatusChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  AuthenticationStatus get authStatus => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthenticationStatus authStatus});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
  }) {
    return _then(_value.copyWith(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthenticationStatus authStatus});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
  }) {
    return _then(_$AuthStateImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({required this.authStatus});

  @override
  final AuthenticationStatus authStatus;

  @override
  String toString() {
    return 'AuthState(authStatus: $authStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authStatus);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({required final AuthenticationStatus authStatus}) =
      _$AuthStateImpl;

  @override
  AuthenticationStatus get authStatus;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
