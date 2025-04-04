// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drag_and_drop_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DragAndDropEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PerformDropEvent event) performDrop,
    required TResult Function() pickImage,
    required TResult Function(XFile? image) pickImageIosWeb,
    required TResult Function(int progress) updateProgress,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PerformDropEvent event)? performDrop,
    TResult? Function()? pickImage,
    TResult? Function(XFile? image)? pickImageIosWeb,
    TResult? Function(int progress)? updateProgress,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PerformDropEvent event)? performDrop,
    TResult Function()? pickImage,
    TResult Function(XFile? image)? pickImageIosWeb,
    TResult Function(int progress)? updateProgress,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PerformDrop value) performDrop,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_PickImageIosWeb value) pickImageIosWeb,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PerformDrop value)? performDrop,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PerformDrop value)? performDrop,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DragAndDropEventCopyWith<$Res> {
  factory $DragAndDropEventCopyWith(
          DragAndDropEvent value, $Res Function(DragAndDropEvent) then) =
      _$DragAndDropEventCopyWithImpl<$Res, DragAndDropEvent>;
}

/// @nodoc
class _$DragAndDropEventCopyWithImpl<$Res, $Val extends DragAndDropEvent>
    implements $DragAndDropEventCopyWith<$Res> {
  _$DragAndDropEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PerformDropImplCopyWith<$Res> {
  factory _$$PerformDropImplCopyWith(
          _$PerformDropImpl value, $Res Function(_$PerformDropImpl) then) =
      __$$PerformDropImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PerformDropEvent event});
}

/// @nodoc
class __$$PerformDropImplCopyWithImpl<$Res>
    extends _$DragAndDropEventCopyWithImpl<$Res, _$PerformDropImpl>
    implements _$$PerformDropImplCopyWith<$Res> {
  __$$PerformDropImplCopyWithImpl(
      _$PerformDropImpl _value, $Res Function(_$PerformDropImpl) _then)
      : super(_value, _then);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$PerformDropImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as PerformDropEvent,
    ));
  }
}

/// @nodoc

class _$PerformDropImpl implements _PerformDrop {
  const _$PerformDropImpl(this.event);

  @override
  final PerformDropEvent event;

  @override
  String toString() {
    return 'DragAndDropEvent.performDrop(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformDropImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformDropImplCopyWith<_$PerformDropImpl> get copyWith =>
      __$$PerformDropImplCopyWithImpl<_$PerformDropImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PerformDropEvent event) performDrop,
    required TResult Function() pickImage,
    required TResult Function(XFile? image) pickImageIosWeb,
    required TResult Function(int progress) updateProgress,
    required TResult Function() reset,
  }) {
    return performDrop(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PerformDropEvent event)? performDrop,
    TResult? Function()? pickImage,
    TResult? Function(XFile? image)? pickImageIosWeb,
    TResult? Function(int progress)? updateProgress,
    TResult? Function()? reset,
  }) {
    return performDrop?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PerformDropEvent event)? performDrop,
    TResult Function()? pickImage,
    TResult Function(XFile? image)? pickImageIosWeb,
    TResult Function(int progress)? updateProgress,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (performDrop != null) {
      return performDrop(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PerformDrop value) performDrop,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_PickImageIosWeb value) pickImageIosWeb,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_Reset value) reset,
  }) {
    return performDrop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PerformDrop value)? performDrop,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_Reset value)? reset,
  }) {
    return performDrop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PerformDrop value)? performDrop,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (performDrop != null) {
      return performDrop(this);
    }
    return orElse();
  }
}

abstract class _PerformDrop implements DragAndDropEvent {
  const factory _PerformDrop(final PerformDropEvent event) = _$PerformDropImpl;

  PerformDropEvent get event;

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformDropImplCopyWith<_$PerformDropImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickImageImplCopyWith<$Res> {
  factory _$$PickImageImplCopyWith(
          _$PickImageImpl value, $Res Function(_$PickImageImpl) then) =
      __$$PickImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickImageImplCopyWithImpl<$Res>
    extends _$DragAndDropEventCopyWithImpl<$Res, _$PickImageImpl>
    implements _$$PickImageImplCopyWith<$Res> {
  __$$PickImageImplCopyWithImpl(
      _$PickImageImpl _value, $Res Function(_$PickImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PickImageImpl implements _PickImage {
  const _$PickImageImpl();

  @override
  String toString() {
    return 'DragAndDropEvent.pickImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PickImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PerformDropEvent event) performDrop,
    required TResult Function() pickImage,
    required TResult Function(XFile? image) pickImageIosWeb,
    required TResult Function(int progress) updateProgress,
    required TResult Function() reset,
  }) {
    return pickImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PerformDropEvent event)? performDrop,
    TResult? Function()? pickImage,
    TResult? Function(XFile? image)? pickImageIosWeb,
    TResult? Function(int progress)? updateProgress,
    TResult? Function()? reset,
  }) {
    return pickImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PerformDropEvent event)? performDrop,
    TResult Function()? pickImage,
    TResult Function(XFile? image)? pickImageIosWeb,
    TResult Function(int progress)? updateProgress,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PerformDrop value) performDrop,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_PickImageIosWeb value) pickImageIosWeb,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_Reset value) reset,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PerformDrop value)? performDrop,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_Reset value)? reset,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PerformDrop value)? performDrop,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class _PickImage implements DragAndDropEvent {
  const factory _PickImage() = _$PickImageImpl;
}

/// @nodoc
abstract class _$$PickImageIosWebImplCopyWith<$Res> {
  factory _$$PickImageIosWebImplCopyWith(_$PickImageIosWebImpl value,
          $Res Function(_$PickImageIosWebImpl) then) =
      __$$PickImageIosWebImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile? image});
}

/// @nodoc
class __$$PickImageIosWebImplCopyWithImpl<$Res>
    extends _$DragAndDropEventCopyWithImpl<$Res, _$PickImageIosWebImpl>
    implements _$$PickImageIosWebImplCopyWith<$Res> {
  __$$PickImageIosWebImplCopyWithImpl(
      _$PickImageIosWebImpl _value, $Res Function(_$PickImageIosWebImpl) _then)
      : super(_value, _then);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$PickImageIosWebImpl(
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ));
  }
}

/// @nodoc

class _$PickImageIosWebImpl implements _PickImageIosWeb {
  const _$PickImageIosWebImpl(this.image);

  @override
  final XFile? image;

  @override
  String toString() {
    return 'DragAndDropEvent.pickImageIosWeb(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickImageIosWebImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickImageIosWebImplCopyWith<_$PickImageIosWebImpl> get copyWith =>
      __$$PickImageIosWebImplCopyWithImpl<_$PickImageIosWebImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PerformDropEvent event) performDrop,
    required TResult Function() pickImage,
    required TResult Function(XFile? image) pickImageIosWeb,
    required TResult Function(int progress) updateProgress,
    required TResult Function() reset,
  }) {
    return pickImageIosWeb(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PerformDropEvent event)? performDrop,
    TResult? Function()? pickImage,
    TResult? Function(XFile? image)? pickImageIosWeb,
    TResult? Function(int progress)? updateProgress,
    TResult? Function()? reset,
  }) {
    return pickImageIosWeb?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PerformDropEvent event)? performDrop,
    TResult Function()? pickImage,
    TResult Function(XFile? image)? pickImageIosWeb,
    TResult Function(int progress)? updateProgress,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (pickImageIosWeb != null) {
      return pickImageIosWeb(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PerformDrop value) performDrop,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_PickImageIosWeb value) pickImageIosWeb,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_Reset value) reset,
  }) {
    return pickImageIosWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PerformDrop value)? performDrop,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_Reset value)? reset,
  }) {
    return pickImageIosWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PerformDrop value)? performDrop,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (pickImageIosWeb != null) {
      return pickImageIosWeb(this);
    }
    return orElse();
  }
}

abstract class _PickImageIosWeb implements DragAndDropEvent {
  const factory _PickImageIosWeb(final XFile? image) = _$PickImageIosWebImpl;

  XFile? get image;

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickImageIosWebImplCopyWith<_$PickImageIosWebImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProgressImplCopyWith<$Res> {
  factory _$$UpdateProgressImplCopyWith(_$UpdateProgressImpl value,
          $Res Function(_$UpdateProgressImpl) then) =
      __$$UpdateProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress});
}

/// @nodoc
class __$$UpdateProgressImplCopyWithImpl<$Res>
    extends _$DragAndDropEventCopyWithImpl<$Res, _$UpdateProgressImpl>
    implements _$$UpdateProgressImplCopyWith<$Res> {
  __$$UpdateProgressImplCopyWithImpl(
      _$UpdateProgressImpl _value, $Res Function(_$UpdateProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$UpdateProgressImpl(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateProgressImpl implements _UpdateProgress {
  const _$UpdateProgressImpl(this.progress);

  @override
  final int progress;

  @override
  String toString() {
    return 'DragAndDropEvent.updateProgress(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProgressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProgressImplCopyWith<_$UpdateProgressImpl> get copyWith =>
      __$$UpdateProgressImplCopyWithImpl<_$UpdateProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PerformDropEvent event) performDrop,
    required TResult Function() pickImage,
    required TResult Function(XFile? image) pickImageIosWeb,
    required TResult Function(int progress) updateProgress,
    required TResult Function() reset,
  }) {
    return updateProgress(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PerformDropEvent event)? performDrop,
    TResult? Function()? pickImage,
    TResult? Function(XFile? image)? pickImageIosWeb,
    TResult? Function(int progress)? updateProgress,
    TResult? Function()? reset,
  }) {
    return updateProgress?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PerformDropEvent event)? performDrop,
    TResult Function()? pickImage,
    TResult Function(XFile? image)? pickImageIosWeb,
    TResult Function(int progress)? updateProgress,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PerformDrop value) performDrop,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_PickImageIosWeb value) pickImageIosWeb,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_Reset value) reset,
  }) {
    return updateProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PerformDrop value)? performDrop,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_Reset value)? reset,
  }) {
    return updateProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PerformDrop value)? performDrop,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdateProgress implements DragAndDropEvent {
  const factory _UpdateProgress(final int progress) = _$UpdateProgressImpl;

  int get progress;

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProgressImplCopyWith<_$UpdateProgressImpl> get copyWith =>
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
    extends _$DragAndDropEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of DragAndDropEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'DragAndDropEvent.reset()';
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
    required TResult Function(PerformDropEvent event) performDrop,
    required TResult Function() pickImage,
    required TResult Function(XFile? image) pickImageIosWeb,
    required TResult Function(int progress) updateProgress,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PerformDropEvent event)? performDrop,
    TResult? Function()? pickImage,
    TResult? Function(XFile? image)? pickImageIosWeb,
    TResult? Function(int progress)? updateProgress,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PerformDropEvent event)? performDrop,
    TResult Function()? pickImage,
    TResult Function(XFile? image)? pickImageIosWeb,
    TResult Function(int progress)? updateProgress,
    TResult Function()? reset,
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
    required TResult Function(_PerformDrop value) performDrop,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_PickImageIosWeb value) pickImageIosWeb,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PerformDrop value)? performDrop,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PerformDrop value)? performDrop,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_PickImageIosWeb value)? pickImageIosWeb,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements DragAndDropEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$DragAndDropState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  XFile? get photoFile => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  FileFormat? get fileFormat => throw _privateConstructorUsedError;
  String? get fileSizeInMb => throw _privateConstructorUsedError;

  /// Create a copy of DragAndDropState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DragAndDropStateCopyWith<DragAndDropState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DragAndDropStateCopyWith<$Res> {
  factory $DragAndDropStateCopyWith(
          DragAndDropState value, $Res Function(DragAndDropState) then) =
      _$DragAndDropStateCopyWithImpl<$Res, DragAndDropState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      String? errorMessage,
      XFile? photoFile,
      int? progress,
      String? fileName,
      FileFormat? fileFormat,
      String? fileSizeInMb});
}

/// @nodoc
class _$DragAndDropStateCopyWithImpl<$Res, $Val extends DragAndDropState>
    implements $DragAndDropStateCopyWith<$Res> {
  _$DragAndDropStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DragAndDropState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? photoFile = freezed,
    Object? progress = freezed,
    Object? fileName = freezed,
    Object? fileFormat = freezed,
    Object? fileSizeInMb = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      photoFile: freezed == photoFile
          ? _value.photoFile
          : photoFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileFormat: freezed == fileFormat
          ? _value.fileFormat
          : fileFormat // ignore: cast_nullable_to_non_nullable
              as FileFormat?,
      fileSizeInMb: freezed == fileSizeInMb
          ? _value.fileSizeInMb
          : fileSizeInMb // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DragAndDropStateImplCopyWith<$Res>
    implements $DragAndDropStateCopyWith<$Res> {
  factory _$$DragAndDropStateImplCopyWith(_$DragAndDropStateImpl value,
          $Res Function(_$DragAndDropStateImpl) then) =
      __$$DragAndDropStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      String? errorMessage,
      XFile? photoFile,
      int? progress,
      String? fileName,
      FileFormat? fileFormat,
      String? fileSizeInMb});
}

/// @nodoc
class __$$DragAndDropStateImplCopyWithImpl<$Res>
    extends _$DragAndDropStateCopyWithImpl<$Res, _$DragAndDropStateImpl>
    implements _$$DragAndDropStateImplCopyWith<$Res> {
  __$$DragAndDropStateImplCopyWithImpl(_$DragAndDropStateImpl _value,
      $Res Function(_$DragAndDropStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DragAndDropState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? photoFile = freezed,
    Object? progress = freezed,
    Object? fileName = freezed,
    Object? fileFormat = freezed,
    Object? fileSizeInMb = freezed,
  }) {
    return _then(_$DragAndDropStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      photoFile: freezed == photoFile
          ? _value.photoFile
          : photoFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileFormat: freezed == fileFormat
          ? _value.fileFormat
          : fileFormat // ignore: cast_nullable_to_non_nullable
              as FileFormat?,
      fileSizeInMb: freezed == fileSizeInMb
          ? _value.fileSizeInMb
          : fileSizeInMb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DragAndDropStateImpl implements _DragAndDropState {
  const _$DragAndDropStateImpl(
      {required this.status,
      this.errorMessage,
      this.photoFile,
      this.progress,
      this.fileName,
      this.fileFormat,
      this.fileSizeInMb});

  @override
  final FormzSubmissionStatus status;
  @override
  final String? errorMessage;
  @override
  final XFile? photoFile;
  @override
  final int? progress;
  @override
  final String? fileName;
  @override
  final FileFormat? fileFormat;
  @override
  final String? fileSizeInMb;

  @override
  String toString() {
    return 'DragAndDropState(status: $status, errorMessage: $errorMessage, photoFile: $photoFile, progress: $progress, fileName: $fileName, fileFormat: $fileFormat, fileSizeInMb: $fileSizeInMb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragAndDropStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.photoFile, photoFile) ||
                other.photoFile == photoFile) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileFormat, fileFormat) ||
                other.fileFormat == fileFormat) &&
            (identical(other.fileSizeInMb, fileSizeInMb) ||
                other.fileSizeInMb == fileSizeInMb));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, photoFile,
      progress, fileName, fileFormat, fileSizeInMb);

  /// Create a copy of DragAndDropState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DragAndDropStateImplCopyWith<_$DragAndDropStateImpl> get copyWith =>
      __$$DragAndDropStateImplCopyWithImpl<_$DragAndDropStateImpl>(
          this, _$identity);
}

abstract class _DragAndDropState implements DragAndDropState {
  const factory _DragAndDropState(
      {required final FormzSubmissionStatus status,
      final String? errorMessage,
      final XFile? photoFile,
      final int? progress,
      final String? fileName,
      final FileFormat? fileFormat,
      final String? fileSizeInMb}) = _$DragAndDropStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  String? get errorMessage;
  @override
  XFile? get photoFile;
  @override
  int? get progress;
  @override
  String? get fileName;
  @override
  FileFormat? get fileFormat;
  @override
  String? get fileSizeInMb;

  /// Create a copy of DragAndDropState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DragAndDropStateImplCopyWith<_$DragAndDropStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
