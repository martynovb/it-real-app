import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';
import 'package:it_real_app/domain/field_validators/password_field_validation.dart';
import 'package:it_real_app/domain/field_validators/repeat_password_field_validation.dart';
import 'package:it_real_app/presentation/shared/error_handling/supabase_auth_error_codes.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reset_password_bloc.freezed.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

@Injectable()
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthDataSource authDataSource;

  ResetPasswordBloc({
    required this.authDataSource,
  }) : super(
          const ResetPasswordState(
            status: FormzSubmissionStatus.initial,
            isExpired: false,
          ),
        ) {
    on<_ResetPassword>(_onResetPassword);
    on<_Init>(_onInit);
  }

  Future<void> _onInit(
    _Init event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(
      state.copyWith(
        isExpired: event.error.isNotEmpty,
        status: event.error.isNotEmpty
            ? FormzSubmissionStatus.failure
            : FormzSubmissionStatus.initial,
      ),
    );

    if (event.error.isNotEmpty) {
      authDataSource.setSessionFromUri(event.resetPasswordUri);
    }
  }

  Future<void> _onResetPassword(
    _ResetPassword event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final passwordError = PasswordFieldValidation.dirty(
      event.password,
    ).validator(event.password);
    final repeatPasswordError = RepeatPasswordFieldValidation.dirty(
      event.password,
      event.repeatPassword,
    ).validator(event.repeatPassword);

    if (passwordError != null || repeatPasswordError != null) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          passwordError: passwordError,
          repeatPasswordError: repeatPasswordError,
          errorMessage: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        passwordError: null,
        repeatPasswordError: null,
        errorMessage: null,
      ),
    );

    try {
      await authDataSource.resetPassword(
        password: event.password,
        confirmPassword: event.repeatPassword,
      );
    } catch (e) {
      var errorMessage = LocaleKeys.somethingWentWrong.tr();

      if (e is AuthException && e.code == SupabaseAuthErrorCodes.samePassword) {
        errorMessage = LocaleKeys.resetPasswordErrorSamePassword.tr();
      }

      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: errorMessage,
        ),
      );
      return;
    }

    emit(
      const ResetPasswordState(
        status: FormzSubmissionStatus.success,
        isExpired: false,
      ),
    );
  }
}
