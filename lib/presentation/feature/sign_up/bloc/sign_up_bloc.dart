import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';

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

  Future<void> _onCountinueWithGoogle(_CountinueWithGoogle event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
      ),
    );
  }

  Future<void> _onSignUp(_SignUp event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
      ),
    );
  }
}
