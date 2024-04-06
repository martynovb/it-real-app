import 'package:formz/formz.dart';

enum PassowordValidationError { empty, invalid }

class PasswordFieldValidation
    extends FormzInput<String, PassowordValidationError> {
  const PasswordFieldValidation.pure() : super.pure('');

  const PasswordFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  PassowordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PassowordValidationError.empty;
    }
    return null;
  }
}
