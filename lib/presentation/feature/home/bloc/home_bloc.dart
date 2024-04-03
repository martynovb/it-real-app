import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          const HomeState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        ) {
    on<_Started>(_onStarted);
    on<_VerifyPhoto>(_onVerifyPhoto);
  }

  Future<void> _onStarted(event, emit) async {}

  Future<void> _onVerifyPhoto(event, emit) async {}
}
