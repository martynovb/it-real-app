import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';

part 'settings_bloc.freezed.dart';

part 'settings_event.dart';

part 'settings_state.dart';

@Injectable()
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthDataSource authDataSource;

  SettingsBloc({
    required this.authDataSource,
  }) : super(
          const SettingsState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        );
}
