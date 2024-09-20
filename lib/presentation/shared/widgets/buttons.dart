import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_button_style.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';

Widget btnFilledWithIcon({
  required BuildContext context,
  required String text,
  required Widget postfixWidget,
  void Function()? onPressed,
  double? width,
  double? height,
  bool isMobile = true,
  EdgeInsets? padding,
}) =>
    Container(
      constraints: BoxConstraints(
        minWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        minHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
        maxHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppButtonStyle.filledBtnStyle(
          padding: padding,
          context: context,
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            postfixWidget,
          ],
        ),
      ),
    );

Widget btnOutlined({
  required BuildContext context,
  required String text,
  bool loading = false,
  void Function()? onPressed,
  double? width,
  double? height,
  bool isMobile = true,
  double? padding,
  double minWidth = AppDimensions.btnWidthDesk,
}) =>
    Container(
      constraints: BoxConstraints(
        minWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        minHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
        maxHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppButtonStyle.outlinedBtnStyle(
          context: context,
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
        child: Center(
          child: loading
              ? Row(
                  children: [
                    const AppLoadingWidget(),
                    AppDimensions.sBoxW8,
                    Text(text),
                  ],
                )
              : Text(text),
        ),
      ),
    );

Widget btnFilled({
  required BuildContext context,
  required String text,
  bool loading = false,
  void Function()? onPressed,
  double? width,
  double? height,
  bool isMobile = true,
  double? padding,
}) =>
    Container(
      constraints: BoxConstraints(
        minWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        minHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
        maxHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
      ),
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: AppButtonStyle.filledBtnStyle(
          context: context,
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
        child: Center(
          child: loading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLoadingWidget(),
                    AppDimensions.sBoxW8,
                    Text(text),
                  ],
                )
              : Text(text),
        ),
      ),
    );

Widget btnOutlinedWithIcon({
  required BuildContext context,
  bool isSelected = false,
  String? text,
  Widget? textWidget,
  void Function()? onPressed,
  Widget? postfixWidget,
  Widget? prefixWidget,
  double? width,
  double? height,
  bool isMobile = true,
  double? padding,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
}) =>
    Container(
      constraints: BoxConstraints(
        minWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
        minHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
        maxHeight: height ??
            (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: isSelected
            ? AppButtonStyle.outlinedBtnWithIconStyleSelected(
                context: context,
                textStyle: Theme.of(context).textTheme.displaySmall,
                padding: EdgeInsets.all(padding ?? 0),
              )
            : AppButtonStyle.outlinedBtnWithIconStyle(
                context: context,
                textStyle: Theme.of(context).textTheme.displaySmall,
                padding: EdgeInsets.all(padding ?? 0),
              ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (prefixWidget != null) prefixWidget,
            textWidget ?? Text(text ?? ''),
            if (postfixWidget != null) postfixWidget,
          ],
        ),
      ),
    );
