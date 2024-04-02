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
        );
}
