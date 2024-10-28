import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class PhotoVerificationSuccess extends StatelessWidget {
  const PhotoVerificationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        constraints: const BoxConstraints(maxWidth: 350),
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.photoVerificationDialogSuccessTitle.tr(),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.green,
                    ),
                textAlign: TextAlign.center,
              ),
              AppDimensions.sBoxH16,
              Text(
                LocaleKeys.photoVerificationDialogSuccessDescription.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              AppDimensions.sBoxH24,
              btnFilled(
                context: context,
                text: LocaleKeys.ok.tr(),
                onPressed: () {
                  context.read<PhotoVerificationBloc>().add(
                        const PhotoVerificationEvent.reset(),
                      );
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
