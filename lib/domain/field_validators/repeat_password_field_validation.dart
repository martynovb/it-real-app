import 'package:formz/formz.dart';

enum RepeatPasswordValidationError { empty, invalid }

class RepeatPassword extends FormzInput<String, RepeatPasswordValidationError> {
  final String password;

  const RepeatPassword.pure(this.password) : super.pure('');
  const RepeatPassword.dirty(this.password, [String value = ''])
      : super.dirty(value);

  @override
  RepeatPasswordValidationError? validator(String value) {
    return value == password ? null : RepeatPasswordValidationError.invalid;
  }
}
