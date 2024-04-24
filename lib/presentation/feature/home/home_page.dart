import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart';
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/photo_verification_success.dart';
import 'package:it_real_app/presentation/feature/photo_verification/photo_verification_view.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/app_utils.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeBloc>(),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            if (isMobile) {
              return BlocConsumer<PhotoVerificationBloc,
                  PhotoVerificationState>(
                listener: _handlePhotoVerificationResult,
                builder: (context, state) {
                  if (state.steps.values.any(
                    (status) => status == FormzSubmissionStatus.inProgress,
                  )) {
                    return Expanded(
                      child: _photoVerificationView(context, state),
                    );
                  }
                  return _content(context, homeState);
                },
              );
            }
            return _content(context, homeState);
          },
        ),
      ),
    );
  }

  Widget _content(BuildContext context, HomeState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Home Page'),
          btnFilled(
            context: context,
            text: 'Start Verification',
            onPressed: () async {
              context.read<PhotoVerificationBloc>().add(
                    PhotoVerificationEvent.verifyPhoto(
                      photoFile: XFile(''),
                    ),
                  );

              if (!isMobile) {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (dialogContext) => PhotoVerificationView(
                    onShowReport: () {
                      Navigator.pop(dialogContext);
                      _handlePhotoVerificationResult(
                        context,
                        context.read<PhotoVerificationBloc>().state,
                      );
                    },
                  ),
                );
              }
            },
          ),
          btnFilled(
            context: context,
            text: 'Logout',
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
        ],
      ),
    );
  }

  void _handlePhotoVerificationResult(
    BuildContext context,
    PhotoVerificationState state,
  ) {
    if (state.status == FormzSubmissionStatus.failure &&
        state.exception != null) {
      DialogsManager.showErrorDialog(
        context: context,
        title: state.exception?.title,
        description: state.exception?.message,
        onTap: () {
          context.read<PhotoVerificationBloc>().add(
                const PhotoVerificationEvent.reset(),
              );
          Navigator.pop(context);
        },
      );
    } else if (state.steps[PhotoVerificationStatus.resultPreparation] ==
        FormzSubmissionStatus.success) {
      final isVerificationFailed = (state.report?.aiGenerated ?? false) ||
          (state.report?.matchInDb ?? false);
      if (isVerificationFailed) {
        DialogsManager.showErrorDialog(
          context: context,
          title: LocaleKeys.photoVerificationDialogFailureTitle.tr(),
          description:
              LocaleKeys.photoVerificationDialogFailureDescription.tr(),
          onTap: () {
            context.read<PhotoVerificationBloc>().add(
                  const PhotoVerificationEvent.reset(),
                );
            context.pop();
          },
        );
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const PhotoVerificationSuccess(),
        );
      }
    }
  }

  Widget _photoVerificationView(
    BuildContext context,
    PhotoVerificationState state,
  ) {
    final currentStep = state.steps.entries
            .firstWhereOrNull(
              (entry) => entry.value == FormzSubmissionStatus.inProgress,
            )
            ?.key ??
        PhotoVerificationStatus.aiCheck;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _stepIcon(
            context,
            _stepIconPath(currentStep),
          ),
          AppDimensions.sBoxH16,
          Text(
            '${PhotoVerificationStatus.values.indexOf(currentStep) + 1} ${LocaleKeys.step.tr()}:',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
            textAlign: TextAlign.center,
          ),
          AppDimensions.sBoxH16,
          SizedBox(
            height: 100,
            child: Center(
              child: Text(
                _stepText(context, currentStep),
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppDimensions.sBoxH16,
          _indicatorContainer(
            context,
            state.steps.length,
            PhotoVerificationStatus.values.indexOf(currentStep),
          ),
        ],
      ),
    );
  }

  String _stepIconPath(PhotoVerificationStatus step) {
    switch (step) {
      case PhotoVerificationStatus.aiCheck:
        return AppIcons.iconInsights;
      case PhotoVerificationStatus.databaseCheck:
        return AppIcons.iconSearch;
      case PhotoVerificationStatus.resultPreparation:
        return AppIcons.iconReport;
    }
  }

  String _stepText(BuildContext context, PhotoVerificationStatus step) {
    switch (step) {
      case PhotoVerificationStatus.aiCheck:
        return LocaleKeys.step1PhotoVerification.tr();
      case PhotoVerificationStatus.databaseCheck:
        return LocaleKeys.step2PhotoVerification.tr();
      case PhotoVerificationStatus.resultPreparation:
        return LocaleKeys.step3PhotoVerification.tr();
    }
  }

  Widget _stepIcon(BuildContext context, String iconPah) {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: [
          const Center(
            child: AppLoadingWidget(
              size: 64,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                child: SvgPicture.asset(
                  iconPah,
                  colorFilter: const ColorFilter.mode(
                    AppColors.purple,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorContainer(
    BuildContext context,
    int length,
    int currentIndex,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => _indicator(
          context,
          index == currentIndex,
        ),
      ),
    );
  }

  Widget _indicator(BuildContext context, bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.purple : AppColors.almostBlack,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
