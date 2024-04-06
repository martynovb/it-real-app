import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    required int count,
    required int price,
  }) = _TokenModel;

  const TokenModel._();

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  static const empty = TokenModel(
    count: 0,
    price: 0,
  );
}
