import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/shared/app_utils.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class PhotoVerificationView extends StatelessWidget {
  final void Function() onShowReport;
  const PhotoVerificationView({
    super.key,
    required this.onShowReport,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: BlocBuilder<PhotoVerificationBloc, PhotoVerificationState>(
        builder: (context, state) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 450),
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.photoVerification.tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  AppDimensions.sBoxH32,
                  _stepView(
                    context: context,
                    status: state.steps[PhotoVerificationStatus.aiCheck] ??
                        FormzSubmissionStatus.initial,
                    step: PhotoVerificationStatus.aiCheck,
                    stepText: LocaleKeys.step1PhotoVerification.tr(),
                  ),
                  AppDimensions.sBoxH16,
                  _stepView(
                    context: context,
                    status:
                        state.steps[PhotoVerificationStatus.databaseCheck] ??
                            FormzSubmissionStatus.initial,
                    step: PhotoVerificationStatus.databaseCheck,
                    stepText: LocaleKeys.step2PhotoVerification.tr(),
                  ),
                  AppDimensions.sBoxH16,
                  _stepView(
                    context: context,
                    status: state
                            .steps[PhotoVerificationStatus.resultPreparation] ??
                        FormzSubmissionStatus.initial,
                    step: PhotoVerificationStatus.resultPreparation,
                    stepText: LocaleKeys.step3PhotoVerification.tr(),
                  ),
                  if (state.steps[PhotoVerificationStatus.resultPreparation] ==
                      FormzSubmissionStatus.success) ...[
                    AppDimensions.sBoxH32,
                    SizedBox(
                      width: 200,
                      child: btnFilled(
                        context: context,
                        text: LocaleKeys.viewReport.tr(),
                        onPressed: onShowReport,
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
    required PhotoVerificationStatus step,
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
          '${PhotoVerificationStatus.values.indexOf(step) + 1} ${LocaleKeys.step.tr()}:',
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
          Icons.close,
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
    } else if (status == FormzSubmissionStatus.initial) {
      return Container(
        width: isMobile ? 40 : 60,
        height: isMobile ? 40 : 60,
        decoration: BoxDecoration(
          color: AppColors.grey4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.question_mark,
          color: AppColors.white,
        ),
      );
    }

    return const SizedBox();
  }
}
