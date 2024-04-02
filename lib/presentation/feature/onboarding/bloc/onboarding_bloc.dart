import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_bloc.freezed.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

@Injectable()
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(
          const OnboardingState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        );
}
