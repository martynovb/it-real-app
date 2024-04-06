import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class EmailFieldValidation
    extends FormzInput<String, EmailValidationError> {
  const EmailFieldValidation.pure() : super.pure('');

  const EmailFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.empty;
    }
    return null;
  }
}
