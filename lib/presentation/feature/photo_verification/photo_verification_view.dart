import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/shared/app_utils.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class PhotoVerificationView extends StatelessWidget {
  const PhotoVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: BlocBuilder<PhotoVerificationBloc, PhotoVerificationState>(
        builder: (context, state) {
          return Container(
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.all(8
              ),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.photoVerification.tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  AppDimensions.sBoxH32,
                  _stepView(
                    context: context,
                    status: state.photoVerificationStatus ==
                            PhotoVerificationStatus.aiCheck
                        ? state.status
                        : FormzSubmissionStatus.success,
                    step: 1,
                    stepText: LocaleKeys.step1PhotoVerification.tr(),
                  ),
                  AppDimensions.sBoxH16,
                  _stepView(
                    context: context,
                    status: state.photoVerificationStatus ==
                            PhotoVerificationStatus.databaseCheck
                        ? state.status
                        : FormzSubmissionStatus.success,
                    step: 2,
                    stepText: LocaleKeys.step2PhotoVerification.tr(),
                  ),
                  AppDimensions.sBoxH16,
                  _stepView(
                    context: context,
                    status: state.photoVerificationStatus ==
                            PhotoVerificationStatus.resultPreparation
                        ? state.status
                        : FormzSubmissionStatus.success,
                    step: 3,
                    stepText: LocaleKeys.step3PhotoVerification.tr(),
                  ),
                  if (state.status == FormzSubmissionStatus.success ||
                      state.status == FormzSubmissionStatus.failure) ...[
                    AppDimensions.sBoxH32,
                    SizedBox(
                      width: 200,
                      child: btnFilled(
                        context: context,
                        text: LocaleKeys.viewReport.tr(),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _stepView({
    required BuildContext context,
    required FormzSubmissionStatus status,
    required int step,
    required String stepText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _checkLoadingStatus(status),
        AppDimensions.sBoxW16,
        Text(
          '$step ${LocaleKeys.step.tr()}:',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        AppDimensions.sBoxW8,
        Expanded(
          child: Text(
            stepText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget _checkLoadingStatus(FormzSubmissionStatus status) {
    if (status.isInProgress) {
      return Container(
        width: isMobile ? 40 : 60,
        height: isMobile ? 40 : 60,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: AppLoadingWidget(),
        ),
      );
    } else if (status == FormzSubmissionStatus.failure) {
      return Container(
        width: isMobile ? 40 : 60,
        height: isMobile ? 40 : 60,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.error,
          color: AppColors.white,
        ),
      );
    } else if (status == FormzSubmissionStatus.success) {
      return Container(
        width: isMobile ? 40 : 60,
        height: isMobile ? 40 : 60,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.check,
          color: AppColors.white,
        ),
      );
    }

    return const SizedBox();
  }
}
