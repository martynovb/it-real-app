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
  static bool showTokensPurchaseDialog = false;

  HomeBloc({
    required this.authRepo,
  }) : super(
          const HomeState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            userModel: UserModel.empty,
            showTokensPurchaseDialog: false,
          ),
        ) {
    on<_Started>(_onStarted);
    on<_VerifyPhoto>(_onVerifyPhoto);
    on<_ShowTokensPurchaseDialog>(_showTokensPurchaseDialog);
  }

  Future<void> _showTokensPurchaseDialog(
    _ShowTokensPurchaseDialog event,
    Emitter<HomeState> emit,
  ) async {
    showTokensPurchaseDialog = true;
  }

  Future<void> _onStarted(event, emit) async {
    if (state.status.isInProgress) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        showTokensPurchaseDialog: showTokensPurchaseDialog,
      ),
    );

    try {
      if (state.userModel.id.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 10));
      }
      final userModel = await authRepo.getCurrentUser();
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          userModel: userModel,
          showTokensPurchaseDialog: showTokensPurchaseDialog,
        ),
      );
      showTokensPurchaseDialog = false;
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
