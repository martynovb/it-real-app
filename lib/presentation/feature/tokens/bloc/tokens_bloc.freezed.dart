// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokensEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProductModel productModel) buyProduct,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProductModel productModel)? buyProduct,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModel productModel)? buyProduct,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyTokens value) buyProduct,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BuyTokens value)? buyProduct,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyTokens value)? buyProduct,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensEventCopyWith<$Res> {
  factory $TokensEventCopyWith(
          TokensEvent value, $Res Function(TokensEvent) then) =
      _$TokensEventCopyWithImpl<$Res, TokensEvent>;
}

/// @nodoc
class _$TokensEventCopyWithImpl<$Res, $Val extends TokensEvent>
    implements $TokensEventCopyWith<$Res> {
  _$TokensEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TokensEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TokensEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProductModel productModel) buyProduct,
    required TResult Function() error,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProductModel productModel)? buyProduct,
    TResult? Function()? error,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModel productModel)? buyProduct,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyTokens value) buyProduct,
    required TResult Function(_Error value) error,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BuyTokens value)? buyProduct,
    TResult? Function(_Error value)? error,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyTokens value)? buyProduct,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TokensEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$BuyTokensImplCopyWith<$Res> {
  factory _$$BuyTokensImplCopyWith(
          _$BuyTokensImpl value, $Res Function(_$BuyTokensImpl) then) =
      __$$BuyTokensImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductModel productModel});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$BuyTokensImplCopyWithImpl<$Res>
    extends _$TokensEventCopyWithImpl<$Res, _$BuyTokensImpl>
    implements _$$BuyTokensImplCopyWith<$Res> {
  __$$BuyTokensImplCopyWithImpl(
      _$BuyTokensImpl _value, $Res Function(_$BuyTokensImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModel = null,
  }) {
    return _then(_$BuyTokensImpl(
      productModel: null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value));
    });
  }
}

/// @nodoc

class _$BuyTokensImpl implements _BuyTokens {
  const _$BuyTokensImpl({required this.productModel});

  @override
  final ProductModel productModel;

  @override
  String toString() {
    return 'TokensEvent.buyProduct(productModel: $productModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyTokensImpl &&
            (identical(other.productModel, productModel) ||
                other.productModel == productModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyTokensImplCopyWith<_$BuyTokensImpl> get copyWith =>
      __$$BuyTokensImplCopyWithImpl<_$BuyTokensImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProductModel productModel) buyProduct,
    required TResult Function() error,
  }) {
    return buyProduct(productModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProductModel productModel)? buyProduct,
    TResult? Function()? error,
  }) {
    return buyProduct?.call(productModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModel productModel)? buyProduct,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (buyProduct != null) {
      return buyProduct(productModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyTokens value) buyProduct,
    required TResult Function(_Error value) error,
  }) {
    return buyProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BuyTokens value)? buyProduct,
    TResult? Function(_Error value)? error,
  }) {
    return buyProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyTokens value)? buyProduct,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (buyProduct != null) {
      return buyProduct(this);
    }
    return orElse();
  }
}

abstract class _BuyTokens implements TokensEvent {
  const factory _BuyTokens({required final ProductModel productModel}) =
      _$BuyTokensImpl;

  ProductModel get productModel;
  @JsonKey(ignore: true)
  _$$BuyTokensImplCopyWith<_$BuyTokensImpl> get copyWith =>
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
    extends _$TokensEventCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'TokensEvent.error()';
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
    required TResult Function() started,
    required TResult Function(ProductModel productModel) buyProduct,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProductModel productModel)? buyProduct,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModel productModel)? buyProduct,
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
    required TResult Function(_Started value) started,
    required TResult Function(_BuyTokens value) buyProduct,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BuyTokens value)? buyProduct,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyTokens value)? buyProduct,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TokensEvent {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
mixin _$TokensState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokensStateCopyWith<TokensState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensStateCopyWith<$Res> {
  factory $TokensStateCopyWith(
          TokensState value, $Res Function(TokensState) then) =
      _$TokensStateCopyWithImpl<$Res, TokensState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      String? errorMessage,
      List<ProductModel> products});
}

/// @nodoc
class _$TokensStateCopyWithImpl<$Res, $Val extends TokensState>
    implements $TokensStateCopyWith<$Res> {
  _$TokensStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? products = null,
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
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokensStateImplCopyWith<$Res>
    implements $TokensStateCopyWith<$Res> {
  factory _$$TokensStateImplCopyWith(
          _$TokensStateImpl value, $Res Function(_$TokensStateImpl) then) =
      __$$TokensStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      String? errorMessage,
      List<ProductModel> products});
}

/// @nodoc
class __$$TokensStateImplCopyWithImpl<$Res>
    extends _$TokensStateCopyWithImpl<$Res, _$TokensStateImpl>
    implements _$$TokensStateImplCopyWith<$Res> {
  __$$TokensStateImplCopyWithImpl(
      _$TokensStateImpl _value, $Res Function(_$TokensStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? products = null,
  }) {
    return _then(_$TokensStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$TokensStateImpl implements _TokensState {
  const _$TokensStateImpl(
      {required this.status,
      required this.errorMessage,
      required final List<ProductModel> products})
      : _products = products;

  @override
  final FormzSubmissionStatus status;
  @override
  final String? errorMessage;
  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'TokensState(status: $status, errorMessage: $errorMessage, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokensStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokensStateImplCopyWith<_$TokensStateImpl> get copyWith =>
      __$$TokensStateImplCopyWithImpl<_$TokensStateImpl>(this, _$identity);
}

abstract class _TokensState implements TokensState {
  const factory _TokensState(
      {required final FormzSubmissionStatus status,
      required final String? errorMessage,
      required final List<ProductModel> products}) = _$TokensStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  String? get errorMessage;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$TokensStateImplCopyWith<_$TokensStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
