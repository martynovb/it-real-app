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
    required TResult Function() reset,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? reset,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? reset,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyPhoto value) verifyPhoto,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Reset value)? reset,
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
    required TResult Function() reset,
    required TResult Function() error,
  }) {
    return verifyPhoto(photoFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? reset,
    TResult? Function()? error,
  }) {
    return verifyPhoto?.call(photoFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? reset,
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
    required TResult Function(_Reset value) reset,
    required TResult Function(_Error value) error,
  }) {
    return verifyPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Error value)? error,
  }) {
    return verifyPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Reset value)? reset,
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
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$PhotoVerificationEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'PhotoVerificationEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile photoFile) verifyPhoto,
    required TResult Function() reset,
    required TResult Function() error,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? reset,
    TResult? Function()? error,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? reset,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyPhoto value) verifyPhoto,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Error value) error,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Error value)? error,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Reset value)? reset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements PhotoVerificationEvent {
  const factory _Reset() = _$ResetImpl;
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
    required TResult Function() reset,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(XFile photoFile)? verifyPhoto,
    TResult? Function()? reset,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile photoFile)? verifyPhoto,
    TResult Function()? reset,
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
    required TResult Function(_Reset value) reset,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VerifyPhoto value)? verifyPhoto,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyPhoto value)? verifyPhoto,
    TResult Function(_Reset value)? reset,
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
  Map<PhotoVerificationStatus, FormzSubmissionStatus> get steps =>
      throw _privateConstructorUsedError;
  ReportModel? get report => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  BaseException? get exception => throw _privateConstructorUsedError;

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
      {Map<PhotoVerificationStatus, FormzSubmissionStatus> steps,
      ReportModel? report,
      FormzSubmissionStatus status,
      BaseException? exception});

  $ReportModelCopyWith<$Res>? get report;
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
    Object? steps = null,
    Object? report = freezed,
    Object? status = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as Map<PhotoVerificationStatus, FormzSubmissionStatus>,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as ReportModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportModelCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $ReportModelCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value) as $Val);
    });
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
      {Map<PhotoVerificationStatus, FormzSubmissionStatus> steps,
      ReportModel? report,
      FormzSubmissionStatus status,
      BaseException? exception});

  @override
  $ReportModelCopyWith<$Res>? get report;
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
    Object? steps = null,
    Object? report = freezed,
    Object? status = null,
    Object? exception = freezed,
  }) {
    return _then(_$PhotoVerificationStateImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as Map<PhotoVerificationStatus, FormzSubmissionStatus>,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as ReportModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$PhotoVerificationStateImpl implements _PhotoVerificationState {
  const _$PhotoVerificationStateImpl(
      {required final Map<PhotoVerificationStatus, FormzSubmissionStatus> steps,
      this.report,
      required this.status,
      this.exception})
      : _steps = steps;

  final Map<PhotoVerificationStatus, FormzSubmissionStatus> _steps;
  @override
  Map<PhotoVerificationStatus, FormzSubmissionStatus> get steps {
    if (_steps is EqualUnmodifiableMapView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_steps);
  }

  @override
  final ReportModel? report;
  @override
  final FormzSubmissionStatus status;
  @override
  final BaseException? exception;

  @override
  String toString() {
    return 'PhotoVerificationState(steps: $steps, report: $report, status: $status, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoVerificationStateImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_steps), report, status, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoVerificationStateImplCopyWith<_$PhotoVerificationStateImpl>
      get copyWith => __$$PhotoVerificationStateImplCopyWithImpl<
          _$PhotoVerificationStateImpl>(this, _$identity);
}

abstract class _PhotoVerificationState implements PhotoVerificationState {
  const factory _PhotoVerificationState(
      {required final Map<PhotoVerificationStatus, FormzSubmissionStatus> steps,
      final ReportModel? report,
      required final FormzSubmissionStatus status,
      final BaseException? exception}) = _$PhotoVerificationStateImpl;

  @override
  Map<PhotoVerificationStatus, FormzSubmissionStatus> get steps;
  @override
  ReportModel? get report;
  @override
  FormzSubmissionStatus get status;
  @override
  BaseException? get exception;
  @override
  @JsonKey(ignore: true)
  _$$PhotoVerificationStateImplCopyWith<_$PhotoVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
