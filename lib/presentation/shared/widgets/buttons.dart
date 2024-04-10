import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_styles.dart';

Widget btnWithRightArrow({
  required Brightness brightness,
  required String text,
  void Function()? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.filledBtnStyle(
        brightness: brightness,
        padding: const EdgeInsets.only(
          left: 16,
          right: 8,
          top: 14,
          bottom: 14,
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: AppTextStyle.h3Semibold_18,
          ),
          const Spacer(),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: brightness == Brightness.dark
                  ? AppColors.almostBlack
                  : AppColors.white,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.iconArrowRight,
                colorFilter: ColorFilter.mode(
                  brightness == Brightness.dark
                      ? AppColors.white
                      : AppColors.almostBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget btnOutlined({
  required Brightness brightness,
  required String text,
  void Function()? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.outlinedBtnStyle(
        brightness,
      ),
      child: Text(
        text,
        style: AppTextStyle.h3Semibold_18,
      ),
    );

Widget btnFilled({
  required Brightness brightness,
  required String text,
  void Function()? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.filledBtnStyle(
        brightness: brightness,
      ),
      child: Text(
        text,
        style: AppTextStyle.h3Semibold_18,
      ),
    );
