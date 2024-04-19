import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';

class RepeatPasswordValidationErrorModel extends FieldValidationErrorModel {
  RepeatPasswordValidationErrorModel.empty()
      : super.empty(
          errorMessage: LocaleKeys.repeatPasswordCannotBeEmpty.tr(),
        );

  RepeatPasswordValidationErrorModel.invalid()
      : super.invalid(
          errorMessage: LocaleKeys.passwordsDoNotMatch.tr(),
        );
}

class RepeatPasswordFieldValidation
    extends FormzInput<String, FieldValidationErrorModel> {
  final String password;

  const RepeatPasswordFieldValidation.pure(this.password) : super.pure('');
  const RepeatPasswordFieldValidation.dirty(this.password, [String value = ''])
      : super.dirty(value);

  @override
  FieldValidationErrorModel? validator(String value) {
    if (value.isEmpty) {
      return RepeatPasswordValidationErrorModel.empty();
    }

    if (value != password) {
      return RepeatPasswordValidationErrorModel.invalid();
    }

    return null;
  }
}
