import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String stripeCustomerId,
    required int balance,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static const empty = UserModel(
    id: '',
    email: '',
    stripeCustomerId: '',
    balance: 0,
  );

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;
}
