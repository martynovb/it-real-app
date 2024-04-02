import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';

part 'tokens_bloc.freezed.dart';

part 'tokens_event.dart';

part 'tokens_state.dart';

@Injectable()
class TokensBloc extends Bloc<TokensEvent, TokensState> {
  final AuthDataSource authDataSource;

  TokensBloc({
    required this.authDataSource,
  }) : super(
          const TokensState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        );
}
