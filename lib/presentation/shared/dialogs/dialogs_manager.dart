import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/dialogs/simple_dialog.dart'
    as simple_dialog;
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

abstract class DialogsManager {
  static void showErrorDialog({
    required BuildContext context,
    String? title,
    String? description,
    void Function()? onTap,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return simple_dialog.SimpleDialog(
          title: title != null
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.red,
                      ),
                  textAlign: TextAlign.center,
                )
              : null,
          description: description != null
              ? Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                )
              : null,
          actions: [
            btnFilled(
              context: context,
              text: LocaleKeys.ok.tr(),
              onPressed: onTap ?? () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }
}
