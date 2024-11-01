import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/domain/field_validators/email_field_validation.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';
import 'package:it_real_app/domain/field_validators/password_field_validation.dart';
import 'package:it_real_app/domain/field_validators/repeat_password_field_validation.dart';
import 'package:it_real_app/presentation/shared/error_handling/supabase_auth_error_codes.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_bloc.freezed.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

@Injectable()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthDataSource authDataSource;

  SignUpBloc({
    required this.authDataSource,
  }) : super(
          const SignUpState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        ) {
    on<_SignUp>(_onSignUp);
    on<_CountinueWithGoogle>(_onCountinueWithGoogle);
  }

  Future<void> _onSignUp(_SignUp event, Emitter<SignUpState> emit) async {
    final emailError = EmailFieldValidation.dirty(
      event.email,
    ).validator(event.email);
    final passwordError = PasswordFieldValidation.dirty(
      event.password,
    ).validator(event.password);
    final repeatPasswordError = RepeatPasswordFieldValidation.dirty(
      event.password,
      event.repeatPassword,
    ).validator(event.repeatPassword);

    if (emailError != null ||
        passwordError != null ||
        repeatPasswordError != null) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          emailError: emailError,
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
        emailError: null,
        passwordError: null,
        repeatPasswordError: null,
        errorMessage: null,
      ),
    );

    try {
      await authDataSource.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          emailError: null,
          passwordError: null,
          repeatPasswordError: null,
          errorMessage: null,
        ),
      );
    } catch (e) {
      await Sentry.captureException(e);
      var errorMessage = LocaleKeys.somethingWentWrong.tr();

      if (e is AuthApiException &&
          e.code == SupabaseAuthErrorCodes.userAlreadyExists) {
        errorMessage = LocaleKeys.signUpErrorEmailExists.tr();
      }

      emit(
        SignUpState(
          status: FormzSubmissionStatus.failure,
          errorMessage: errorMessage,
        ),
      );
    }
  }

  Future<void> _onCountinueWithGoogle(
    _CountinueWithGoogle event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.status == FormzSubmissionStatus.inProgress) {
      return;
    }
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );

    await authDataSource.signInWithGoogle();
  }
}
