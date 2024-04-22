// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile photoFile) verifyPhoto,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyPhoto value) verifyPhoto,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoVerificationEventCopyWith<$Res> {
  factory $PhotoVerificationEventCopyWith(PhotoVerificationEvent value,
          $Res Function(PhotoVerificationEvent) then) =
      _$PhotoVerificationEventCopyWithImpl<$Res, PhotoVerificationEvent>;
}

/// @nodoc
class _$PhotoVerificationEventCopyWithImpl<$Res,
        $Val extends PhotoVerificationEvent>
    implements $PhotoVerificationEventCopyWith<$Res> {
  _$PhotoVerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VerifyPhotoImplCopyWith<$Res> {
  factory _$$VerifyPhotoImplCopyWith(
          _$VerifyPhotoImpl value, $Res Function(_$VerifyPhotoImpl) then) =
      __$$VerifyPhotoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile photoFile});
}

/// @nodoc
class __$$VerifyPhotoImplCopyWithImpl<$Res>
    extends _$PhotoVerificationEventCopyWithImpl<$Res, _$VerifyPhotoImpl>
    implements _$$VerifyPhotoImplCopyWith<$Res> {
  __$$VerifyPhotoImplCopyWithImpl(
      _$VerifyPhotoImpl _value, $Res Function(_$VerifyPhotoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoFile = null,
  }) {
    return _then(_$VerifyPhotoImpl(
      photoFile: null == photoFile
          ? _value.photoFile
          : photoFile // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$VerifyPhotoImpl implements _VerifyPhoto {
  const _$VerifyPhotoImpl({required this.photoFile});

  @override
  final XFile photoFile;

  @override
  String toString() {
    return 'PhotoVerificationEvent.verifyPhoto(photoFile: $photoFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPhotoImpl &&
            (identical(other.photoFile, photoFile) ||
                other.photoFile == photoFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photoFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPhotoImplCopyWith<_$VerifyPhotoImpl> get copyWith =>
      __$$VerifyPhotoImplCopyWithImpl<_$VerifyPhotoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile photoFile) verifyPhoto,
    required TResult Function() error,
  }) {
    return verifyPhoto(photoFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? error,
  }) {
    return verifyPhoto?.call(photoFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (verifyPhoto != null) {
      return verifyPhoto(photoFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyPhoto value) verifyPhoto,
    required TResult Function(_Error value) error,
  }) {
    return verifyPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Error value)? error,
  }) {
    return verifyPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verifyPhoto != null) {
      return verifyPhoto(this);
    }
    return orElse();
  }
}

abstract class _VerifyPhoto implements PhotoVerificationEvent {
  const factory _VerifyPhoto({required final XFile photoFile}) =
      _$VerifyPhotoImpl;

  XFile get photoFile;
  @JsonKey(ignore: true)
  _$$VerifyPhotoImplCopyWith<_$VerifyPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PhotoVerificationEventCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'PhotoVerificationEvent.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile photoFile) verifyPhoto,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyPhoto value) verifyPhoto,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PhotoVerificationEvent {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
mixin _$PhotoVerificationState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  PhotoVerificationStatus get photoVerificationStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoVerificationStateCopyWith<PhotoVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoVerificationStateCopyWith<$Res> {
  factory $PhotoVerificationStateCopyWith(PhotoVerificationState value,
          $Res Function(PhotoVerificationState) then) =
      _$PhotoVerificationStateCopyWithImpl<$Res, PhotoVerificationState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      PhotoVerificationStatus photoVerificationStatus});
}

/// @nodoc
class _$PhotoVerificationStateCopyWithImpl<$Res,
        $Val extends PhotoVerificationState>
    implements $PhotoVerificationStateCopyWith<$Res> {
  _$PhotoVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? photoVerificationStatus = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      photoVerificationStatus: null == photoVerificationStatus
          ? _value.photoVerificationStatus
          : photoVerificationStatus // ignore: cast_nullable_to_non_nullable
              as PhotoVerificationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoVerificationStateImplCopyWith<$Res>
    implements $PhotoVerificationStateCopyWith<$Res> {
  factory _$$PhotoVerificationStateImplCopyWith(
          _$PhotoVerificationStateImpl value,
          $Res Function(_$PhotoVerificationStateImpl) then) =
      __$$PhotoVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      PhotoVerificationStatus photoVerificationStatus});
}

/// @nodoc
class __$$PhotoVerificationStateImplCopyWithImpl<$Res>
    extends _$PhotoVerificationStateCopyWithImpl<$Res,
        _$PhotoVerificationStateImpl>
    implements _$$PhotoVerificationStateImplCopyWith<$Res> {
  __$$PhotoVerificationStateImplCopyWithImpl(
      _$PhotoVerificationStateImpl _value,
      $Res Function(_$PhotoVerificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? photoVerificationStatus = null,
  }) {
    return _then(_$PhotoVerificationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      photoVerificationStatus: null == photoVerificationStatus
          ? _value.photoVerificationStatus
          : photoVerificationStatus // ignore: cast_nullable_to_non_nullable
              as PhotoVerificationStatus,
    ));
  }
}

/// @nodoc

class _$PhotoVerificationStateImpl implements _PhotoVerificationState {
  const _$PhotoVerificationStateImpl(
      {required this.status, required this.photoVerificationStatus});

  @override
  final FormzSubmissionStatus status;
  @override
  final PhotoVerificationStatus photoVerificationStatus;

  @override
  String toString() {
    return 'PhotoVerificationState(status: $status, photoVerificationStatus: $photoVerificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoVerificationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(
                    other.photoVerificationStatus, photoVerificationStatus) ||
                other.photoVerificationStatus == photoVerificationStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, photoVerificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoVerificationStateImplCopyWith<_$PhotoVerificationStateImpl>
      get copyWith => __$$PhotoVerificationStateImplCopyWithImpl<
          _$PhotoVerificationStateImpl>(this, _$identity);
}

abstract class _PhotoVerificationState implements PhotoVerificationState {
  const factory _PhotoVerificationState(
          {required final FormzSubmissionStatus status,
          required final PhotoVerificationStatus photoVerificationStatus}) =
      _$PhotoVerificationStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  PhotoVerificationStatus get photoVerificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$PhotoVerificationStateImplCopyWith<_$PhotoVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
