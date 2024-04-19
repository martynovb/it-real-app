import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';

class PasswordValidationErrorModel extends FieldValidationErrorModel {
  PasswordValidationErrorModel.empty()
      : super.empty(
          errorMessage: LocaleKeys.passwordCannotBeEmpty.tr(),
        );

  PasswordValidationErrorModel.invalid()
      : super.invalid(
          errorMessage: LocaleKeys.passwordIsNotValid.tr(),
        );

  PasswordValidationErrorModel.length()
      : super.length(
          errorMessage: LocaleKeys.passwordLengthIsNotValid.tr(),
        );
}

class PasswordFieldValidation
    extends FormzInput<String, FieldValidationErrorModel> {
  final _pattern = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');

  PasswordFieldValidation.pure() : super.pure('');

  PasswordFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  FieldValidationErrorModel? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationErrorModel.empty();
    }

    if (value.length < 6 && value.length > 20) {
      return PasswordValidationErrorModel.length();
    }

    if (!_pattern.hasMatch(value)) {
      return PasswordValidationErrorModel.invalid();
    }

    return null;
  }
}
