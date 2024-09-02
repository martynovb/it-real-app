import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthDataSource authRepo;

  HomeBloc({
    required this.authRepo,
  }) : super(
          const HomeState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            userModel: UserModel.empty,
          ),
        ) {
    on<_Started>(_onStarted);
    on<_VerifyPhoto>(_onVerifyPhoto);
  }

  Future<void> _onStarted(event, emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final userModel = await authRepo.getCurrentUser();
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          userModel: userModel,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Failed to load products',
        ),
      );
    }
  }

  Future<void> _onVerifyPhoto(event, emit) async {}
}
