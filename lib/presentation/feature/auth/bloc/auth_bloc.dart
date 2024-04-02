import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDataSource authDataSource;

  AuthBloc({
    required this.authDataSource,
  }) : super(
          const AuthState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            authStatus: AuthenticationStatus.none,
          ),
        );
}
