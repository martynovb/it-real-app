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
  return _PaymentMetadaModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMetadaModel {
  String get paymentLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMetadaModelCopyWith<PaymentMetadaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMetadaModelCopyWith<$Res> {
  factory $PaymentMetadaModelCopyWith(
          PaymentMetadaModel value, $Res Function(PaymentMetadaModel) then) =
      _$PaymentMetadaModelCopyWithImpl<$Res, PaymentMetadaModel>;
  @useResult
  $Res call({String paymentLink});
}

/// @nodoc
class _$PaymentMetadaModelCopyWithImpl<$Res, $Val extends PaymentMetadaModel>
    implements $PaymentMetadaModelCopyWith<$Res> {
  _$PaymentMetadaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentLink = null,
  }) {
    return _then(_value.copyWith(
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMetadaModelImplCopyWith<$Res>
    implements $PaymentMetadaModelCopyWith<$Res> {
  factory _$$PaymentMetadaModelImplCopyWith(_$PaymentMetadaModelImpl value,
          $Res Function(_$PaymentMetadaModelImpl) then) =
      __$$PaymentMetadaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String paymentLink});
}

/// @nodoc
class __$$PaymentMetadaModelImplCopyWithImpl<$Res>
    extends _$PaymentMetadaModelCopyWithImpl<$Res, _$PaymentMetadaModelImpl>
    implements _$$PaymentMetadaModelImplCopyWith<$Res> {
  __$$PaymentMetadaModelImplCopyWithImpl(_$PaymentMetadaModelImpl _value,
      $Res Function(_$PaymentMetadaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentLink = null,
  }) {
    return _then(_$PaymentMetadaModelImpl(
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMetadaModelImpl extends _PaymentMetadaModel {
  const _$PaymentMetadaModelImpl({required this.paymentLink}) : super._();

  factory _$PaymentMetadaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMetadaModelImplFromJson(json);

  @override
  final String paymentLink;

  @override
  String toString() {
    return 'PaymentMetadaModel(paymentLink: $paymentLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMetadaModelImpl &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMetadaModelImplCopyWith<_$PaymentMetadaModelImpl> get copyWith =>
      __$$PaymentMetadaModelImplCopyWithImpl<_$PaymentMetadaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMetadaModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMetadaModel extends PaymentMetadaModel {
  const factory _PaymentMetadaModel({required final String paymentLink}) =
      _$PaymentMetadaModelImpl;
  const _PaymentMetadaModel._() : super._();

  factory _PaymentMetadaModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMetadaModelImpl.fromJson;

  @override
  String get paymentLink;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMetadaModelImplCopyWith<_$PaymentMetadaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
