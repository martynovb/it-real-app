import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';

class EmailValidationErrorModel extends FieldValidationErrorModel {
  EmailValidationErrorModel.empty()
      : super.empty(
          errorMessage: LocaleKeys.emailCannotBeEmpty.tr(),
        );

  EmailValidationErrorModel.invalid()
      : super.invalid(
          errorMessage: LocaleKeys.emailIsNotValid.tr(),
        );

  EmailValidationErrorModel.length()
      : super.length(
          errorMessage: LocaleKeys.emailLengthIsNotValid.tr(),
        );
}

class EmailFieldValidation
    extends FormzInput<String, FieldValidationErrorModel> with FormzInputErrorCacheMixin{
  final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
    multiLine: false,
  );

  EmailFieldValidation.pure() : super.pure('');

  EmailFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  FieldValidationErrorModel? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationErrorModel.empty();
    }

    if (value.length < 6) {
      return EmailValidationErrorModel.length();
    }

    if (!_emailRegExp.hasMatch(value)) {
      return EmailValidationErrorModel.invalid();
    }

    return null;
  }
}
