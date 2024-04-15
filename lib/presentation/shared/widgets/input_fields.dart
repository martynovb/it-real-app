import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

class AppInputField extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool showPasswordToggle;
  final int maxLines;

  const AppInputField({
    super.key,
    required this.lable,
    required this.hintText,
    this.showPasswordToggle = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        AppDimensions.sBoxH8,
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.almostBlack,
                ),
          ),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: _border(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              focusedBorder: _border(
                color: AppColors.purple,
              ),
              errorBorder: _border(
                color: Theme.of(context).colorScheme.error,
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _border({
    required Color color,
  }) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
      );
}
