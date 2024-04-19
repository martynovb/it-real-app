enum FieldValidationError {
  empty,
  invalid,
  length,
}

class FieldValidationErrorModel {
  final FieldValidationError error;
  final String message;

  FieldValidationErrorModel.empty({required String errorMessage})
      : error = FieldValidationError.empty,
        message = errorMessage;

  FieldValidationErrorModel.invalid({required String errorMessage})
      : error = FieldValidationError.invalid,
        message = errorMessage;

  FieldValidationErrorModel.length({required String errorMessage})
      : error = FieldValidationError.length,
        message = errorMessage;
}
