import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/domain/field_validators/email_field_validation.dart';
import 'package:it_real_app/domain/field_validators/field_validation_error.dart';

part 'forgot_password_bloc.freezed.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

@Injectable()
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthDataSource authDataSource;

  ForgotPasswordBloc({
    required this.authDataSource,
  }) : super(
          const ForgotPasswordState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        ) {
    on<_ResetPassword>(_onResetPassword);
  }

  Future<void> _onResetPassword(
    _ResetPassword event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final emailError = EmailFieldValidation.dirty(
      event.email,
    ).validator(event.email);

    if (emailError != null) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          emailError: emailError,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        emailError: null,
      ),
    );

    await authDataSource.sendPasswordResetEmail(
      email: event.email,
    );

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
        emailError: null,
      ),
    );
  }
}
