import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';
import 'package:it_real_app/domain/field_validators/email_field_validation.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';
import 'package:it_real_app/domain/field_validators/password_field_validation.dart';

part 'sign_in_bloc.freezed.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

@Injectable()
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthDataSource authDataSource;

  SignInBloc({
    required this.authDataSource,
  }) : super(
          const SignInState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        ) {
    on<_SignIn>(_onSignIn);
    on<_CountinueWithGoogle>(_onCountinueWithGoogle);
  }

  Future<void> _onSignIn(_SignIn event, Emitter<SignInState> emit) async {
    final emailError = EmailFieldValidation.dirty(
      event.email,
    ).validator(event.email);
    final passwordError = PasswordFieldValidation.dirty(
      event.password,
    ).validator(event.password);

    if (emailError != null || passwordError != null) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          emailError: emailError,
          passwordError: passwordError,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        emailError: null,
        passwordError: null,
      ),
    );

    await authDataSource.signInWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
        emailError: null,
        passwordError: null,
      ),
    );
  }

  Future<void> _onCountinueWithGoogle(
    _CountinueWithGoogle event,
    Emitter<SignInState> emit,
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
