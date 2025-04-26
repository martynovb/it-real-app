// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMetadaModel _$PaymentMetadaModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'stripe':
      return StripePaymentMetadaModel.fromJson(json);
    case 'paddle':
      return PaddlePaymentMetadaModel.fromJson(json);
    case 'paypal':
      return PaypalPaymentMetadaModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PaymentMetadaModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PaymentMetadaModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentLink) stripe,
    required TResult Function(String transactionId) paddle,
    required TResult Function(String paymentLink) paypal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentLink)? stripe,
    TResult? Function(String transactionId)? paddle,
    TResult? Function(String paymentLink)? paypal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentLink)? stripe,
    TResult Function(String transactionId)? paddle,
    TResult Function(String paymentLink)? paypal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StripePaymentMetadaModel value) stripe,
    required TResult Function(PaddlePaymentMetadaModel value) paddle,
    required TResult Function(PaypalPaymentMetadaModel value) paypal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StripePaymentMetadaModel value)? stripe,
    TResult? Function(PaddlePaymentMetadaModel value)? paddle,
    TResult? Function(PaypalPaymentMetadaModel value)? paypal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StripePaymentMetadaModel value)? stripe,
    TResult Function(PaddlePaymentMetadaModel value)? paddle,
    TResult Function(PaypalPaymentMetadaModel value)? paypal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentMetadaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMetadaModelCopyWith<$Res> {
  factory $PaymentMetadaModelCopyWith(
          PaymentMetadaModel value, $Res Function(PaymentMetadaModel) then) =
      _$PaymentMetadaModelCopyWithImpl<$Res, PaymentMetadaModel>;
}

/// @nodoc
class _$PaymentMetadaModelCopyWithImpl<$Res, $Val extends PaymentMetadaModel>
    implements $PaymentMetadaModelCopyWith<$Res> {
  _$PaymentMetadaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StripePaymentMetadaModelImplCopyWith<$Res> {
  factory _$$StripePaymentMetadaModelImplCopyWith(
          _$StripePaymentMetadaModelImpl value,
          $Res Function(_$StripePaymentMetadaModelImpl) then) =
      __$$StripePaymentMetadaModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentLink});
}

/// @nodoc
class __$$StripePaymentMetadaModelImplCopyWithImpl<$Res>
    extends _$PaymentMetadaModelCopyWithImpl<$Res,
        _$StripePaymentMetadaModelImpl>
    implements _$$StripePaymentMetadaModelImplCopyWith<$Res> {
  __$$StripePaymentMetadaModelImplCopyWithImpl(
      _$StripePaymentMetadaModelImpl _value,
      $Res Function(_$StripePaymentMetadaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentLink = null,
  }) {
    return _then(_$StripePaymentMetadaModelImpl(
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StripePaymentMetadaModelImpl extends StripePaymentMetadaModel {
  const _$StripePaymentMetadaModelImpl(
      {required this.paymentLink, final String? $type})
      : $type = $type ?? 'stripe',
        super._();

  factory _$StripePaymentMetadaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StripePaymentMetadaModelImplFromJson(json);

  @override
  final String paymentLink;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PaymentMetadaModel.stripe(paymentLink: $paymentLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StripePaymentMetadaModelImpl &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentLink);

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StripePaymentMetadaModelImplCopyWith<_$StripePaymentMetadaModelImpl>
      get copyWith => __$$StripePaymentMetadaModelImplCopyWithImpl<
          _$StripePaymentMetadaModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentLink) stripe,
    required TResult Function(String transactionId) paddle,
    required TResult Function(String paymentLink) paypal,
  }) {
    return stripe(paymentLink);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentLink)? stripe,
    TResult? Function(String transactionId)? paddle,
    TResult? Function(String paymentLink)? paypal,
  }) {
    return stripe?.call(paymentLink);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentLink)? stripe,
    TResult Function(String transactionId)? paddle,
    TResult Function(String paymentLink)? paypal,
    required TResult orElse(),
  }) {
    if (stripe != null) {
      return stripe(paymentLink);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StripePaymentMetadaModel value) stripe,
    required TResult Function(PaddlePaymentMetadaModel value) paddle,
    required TResult Function(PaypalPaymentMetadaModel value) paypal,
  }) {
    return stripe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StripePaymentMetadaModel value)? stripe,
    TResult? Function(PaddlePaymentMetadaModel value)? paddle,
    TResult? Function(PaypalPaymentMetadaModel value)? paypal,
  }) {
    return stripe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StripePaymentMetadaModel value)? stripe,
    TResult Function(PaddlePaymentMetadaModel value)? paddle,
    TResult Function(PaypalPaymentMetadaModel value)? paypal,
    required TResult orElse(),
  }) {
    if (stripe != null) {
      return stripe(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StripePaymentMetadaModelImplToJson(
      this,
    );
  }
}

abstract class StripePaymentMetadaModel extends PaymentMetadaModel {
  const factory StripePaymentMetadaModel({required final String paymentLink}) =
      _$StripePaymentMetadaModelImpl;
  const StripePaymentMetadaModel._() : super._();

  factory StripePaymentMetadaModel.fromJson(Map<String, dynamic> json) =
      _$StripePaymentMetadaModelImpl.fromJson;

  String get paymentLink;

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StripePaymentMetadaModelImplCopyWith<_$StripePaymentMetadaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaddlePaymentMetadaModelImplCopyWith<$Res> {
  factory _$$PaddlePaymentMetadaModelImplCopyWith(
          _$PaddlePaymentMetadaModelImpl value,
          $Res Function(_$PaddlePaymentMetadaModelImpl) then) =
      __$$PaddlePaymentMetadaModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String transactionId});
}

/// @nodoc
class __$$PaddlePaymentMetadaModelImplCopyWithImpl<$Res>
    extends _$PaymentMetadaModelCopyWithImpl<$Res,
        _$PaddlePaymentMetadaModelImpl>
    implements _$$PaddlePaymentMetadaModelImplCopyWith<$Res> {
  __$$PaddlePaymentMetadaModelImplCopyWithImpl(
      _$PaddlePaymentMetadaModelImpl _value,
      $Res Function(_$PaddlePaymentMetadaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
  }) {
    return _then(_$PaddlePaymentMetadaModelImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaddlePaymentMetadaModelImpl extends PaddlePaymentMetadaModel {
  const _$PaddlePaymentMetadaModelImpl(
      {required this.transactionId, final String? $type})
      : $type = $type ?? 'paddle',
        super._();

  factory _$PaddlePaymentMetadaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaddlePaymentMetadaModelImplFromJson(json);

  @override
  final String transactionId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PaymentMetadaModel.paddle(transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaddlePaymentMetadaModelImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId);

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaddlePaymentMetadaModelImplCopyWith<_$PaddlePaymentMetadaModelImpl>
      get copyWith => __$$PaddlePaymentMetadaModelImplCopyWithImpl<
          _$PaddlePaymentMetadaModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentLink) stripe,
    required TResult Function(String transactionId) paddle,
    required TResult Function(String paymentLink) paypal,
  }) {
    return paddle(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentLink)? stripe,
    TResult? Function(String transactionId)? paddle,
    TResult? Function(String paymentLink)? paypal,
  }) {
    return paddle?.call(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentLink)? stripe,
    TResult Function(String transactionId)? paddle,
    TResult Function(String paymentLink)? paypal,
    required TResult orElse(),
  }) {
    if (paddle != null) {
      return paddle(transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StripePaymentMetadaModel value) stripe,
    required TResult Function(PaddlePaymentMetadaModel value) paddle,
    required TResult Function(PaypalPaymentMetadaModel value) paypal,
  }) {
    return paddle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StripePaymentMetadaModel value)? stripe,
    TResult? Function(PaddlePaymentMetadaModel value)? paddle,
    TResult? Function(PaypalPaymentMetadaModel value)? paypal,
  }) {
    return paddle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StripePaymentMetadaModel value)? stripe,
    TResult Function(PaddlePaymentMetadaModel value)? paddle,
    TResult Function(PaypalPaymentMetadaModel value)? paypal,
    required TResult orElse(),
  }) {
    if (paddle != null) {
      return paddle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaddlePaymentMetadaModelImplToJson(
      this,
    );
  }
}

abstract class PaddlePaymentMetadaModel extends PaymentMetadaModel {
  const factory PaddlePaymentMetadaModel(
      {required final String transactionId}) = _$PaddlePaymentMetadaModelImpl;
  const PaddlePaymentMetadaModel._() : super._();

  factory PaddlePaymentMetadaModel.fromJson(Map<String, dynamic> json) =
      _$PaddlePaymentMetadaModelImpl.fromJson;

  String get transactionId;

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaddlePaymentMetadaModelImplCopyWith<_$PaddlePaymentMetadaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaypalPaymentMetadaModelImplCopyWith<$Res> {
  factory _$$PaypalPaymentMetadaModelImplCopyWith(
          _$PaypalPaymentMetadaModelImpl value,
          $Res Function(_$PaypalPaymentMetadaModelImpl) then) =
      __$$PaypalPaymentMetadaModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentLink});
}

/// @nodoc
class __$$PaypalPaymentMetadaModelImplCopyWithImpl<$Res>
    extends _$PaymentMetadaModelCopyWithImpl<$Res,
        _$PaypalPaymentMetadaModelImpl>
    implements _$$PaypalPaymentMetadaModelImplCopyWith<$Res> {
  __$$PaypalPaymentMetadaModelImplCopyWithImpl(
      _$PaypalPaymentMetadaModelImpl _value,
      $Res Function(_$PaypalPaymentMetadaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentLink = null,
  }) {
    return _then(_$PaypalPaymentMetadaModelImpl(
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaypalPaymentMetadaModelImpl extends PaypalPaymentMetadaModel {
  const _$PaypalPaymentMetadaModelImpl(
      {required this.paymentLink, final String? $type})
      : $type = $type ?? 'paypal',
        super._();

  factory _$PaypalPaymentMetadaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaypalPaymentMetadaModelImplFromJson(json);

  @override
  final String paymentLink;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PaymentMetadaModel.paypal(paymentLink: $paymentLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaypalPaymentMetadaModelImpl &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentLink);

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaypalPaymentMetadaModelImplCopyWith<_$PaypalPaymentMetadaModelImpl>
      get copyWith => __$$PaypalPaymentMetadaModelImplCopyWithImpl<
          _$PaypalPaymentMetadaModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentLink) stripe,
    required TResult Function(String transactionId) paddle,
    required TResult Function(String paymentLink) paypal,
  }) {
    return paypal(paymentLink);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentLink)? stripe,
    TResult? Function(String transactionId)? paddle,
    TResult? Function(String paymentLink)? paypal,
  }) {
    return paypal?.call(paymentLink);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentLink)? stripe,
    TResult Function(String transactionId)? paddle,
    TResult Function(String paymentLink)? paypal,
    required TResult orElse(),
  }) {
    if (paypal != null) {
      return paypal(paymentLink);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StripePaymentMetadaModel value) stripe,
    required TResult Function(PaddlePaymentMetadaModel value) paddle,
    required TResult Function(PaypalPaymentMetadaModel value) paypal,
  }) {
    return paypal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StripePaymentMetadaModel value)? stripe,
    TResult? Function(PaddlePaymentMetadaModel value)? paddle,
    TResult? Function(PaypalPaymentMetadaModel value)? paypal,
  }) {
    return paypal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StripePaymentMetadaModel value)? stripe,
    TResult Function(PaddlePaymentMetadaModel value)? paddle,
    TResult Function(PaypalPaymentMetadaModel value)? paypal,
    required TResult orElse(),
  }) {
    if (paypal != null) {
      return paypal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaypalPaymentMetadaModelImplToJson(
      this,
    );
  }
}

abstract class PaypalPaymentMetadaModel extends PaymentMetadaModel {
  const factory PaypalPaymentMetadaModel({required final String paymentLink}) =
      _$PaypalPaymentMetadaModelImpl;
  const PaypalPaymentMetadaModel._() : super._();

  factory PaypalPaymentMetadaModel.fromJson(Map<String, dynamic> json) =
      _$PaypalPaymentMetadaModelImpl.fromJson;

  String get paymentLink;

  /// Create a copy of PaymentMetadaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaypalPaymentMetadaModelImplCopyWith<_$PaypalPaymentMetadaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
