import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/app_utils.dart';
import 'package:it_real_app/presentation/shared/styles/app_button_style.dart';

Widget btnWithRightArrow({
  required BuildContext context,
  required String text,
  void Function()? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.filledBtnStyle(
        context: context,
        textStyle: isMobile
            ? Theme.of(context).textTheme.displayLarge
            : Theme.of(context).textTheme.displaySmall,
        padding: const EdgeInsets.only(
          left: 16,
          right: 8,
          top: 16,
          bottom: 16,
        ),
      ),
      child: Row(
        children: [
          Text(text),
          const Spacer(),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.iconArrowRight,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget btnOutlined({
  required BuildContext context,
  required String text,
  void Function()? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.outlinedBtnStyle(
        context: context,
        textStyle: isMobile
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displaySmall,
      ),
      child: Text(text),
    );

Widget btnFilled({
  required BuildContext context,
  required String text,
  void Function()? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.filledBtnStyle(
        context: context,
        textStyle: Theme.of(context).textTheme.displaySmall,
      ),
      child: Text(text),
    );
