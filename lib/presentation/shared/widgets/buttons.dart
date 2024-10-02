import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_button_style.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';

Widget btnFilledWithIcon({
  required BuildContext context,
  required String text,
  required Widget postfixWidget,
  void Function()? onPressed,
  double? minWidth,
  double? minHeight,
  double? maxWidth,
  bool isMobile = true,
  EdgeInsets? padding,
}) =>
    _resize(
      isMobile: isMobile,
      minWidth: minWidth,
      minHeight: minHeight,
      maxWidth: maxWidth,
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
  double? minWidth,
  double? minHeight,
  bool isMobile = true,
  double? padding,
}) =>
    _resize(
      isMobile: isMobile,
      minWidth: minWidth,
      minHeight: minHeight,
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
  double? minWidth,
  double? minHeight,
  bool isMobile = true,
  double? padding,
}) =>
    _resize(
      isMobile: isMobile,
      minWidth: minWidth,
      minHeight: minHeight,
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
  double? minWidth,
  double? minHeight,
  bool isMobile = true,
  EdgeInsets? padding,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
}) {
  return _resize(
    isMobile: isMobile,
    minWidth: minWidth,
    minHeight: minHeight,
    child: ElevatedButton(
      onPressed: onPressed,
      style: isSelected
          ? AppButtonStyle.outlinedBtnWithIconStyleSelected(
              context: context,
              textStyle: Theme.of(context).textTheme.displaySmall,
              padding: padding ?? EdgeInsets.zero,
            )
          : AppButtonStyle.outlinedBtnWithIconStyle(
              context: context,
              textStyle: Theme.of(context).textTheme.displaySmall,
              padding: padding ?? EdgeInsets.zero,
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
}

Widget _resize({
  required bool isMobile,
  double? minWidth,
  double? minHeight,
  double? maxWidth,
  required Widget child,
}) {
  final widgetMinWidth =
      minWidth ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk);
  final widgetMinHeight = minHeight ??
      (isMobile ? AppDimensions.btnHMobile : AppDimensions.btnHDesk);

  return Container(
    constraints: BoxConstraints(
      minWidth: widgetMinWidth,
      minHeight: widgetMinHeight,
      maxWidth: maxWidth ?? double.infinity,
    ),
    child: child,
  );
}
