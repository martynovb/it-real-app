import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';

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
        );
}
