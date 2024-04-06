import 'package:formz/formz.dart';

enum UserNameValidationError { empty, invalid }

class UserNameFieldValidation
    extends FormzInput<String, UserNameValidationError> {
  const UserNameFieldValidation.pure() : super.pure('');

  const UserNameFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  UserNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return UserNameValidationError.empty;
    }
    return null;
  }
}
