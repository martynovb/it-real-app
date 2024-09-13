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
  bool isMobile = true,
  double? padding,
}) =>
    Container(
      constraints: BoxConstraints(
        maxHeight: 60,
        minWidth: AppDimensions.btnWidthDesk,
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppButtonStyle.filledBtnStyle(
          context: context,
          textStyle: Theme.of(context).textTheme.displaySmall,
          padding: const EdgeInsets.only(
            left: 16,
            right: 8,
            top: 16,
            bottom: 16,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(text),
              ),
            ),
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
  bool isMobile = true,
  double? padding,
  double maxHeight = 60,
  double minWidth = AppDimensions.btnWidthDesk,
}) =>
    Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minWidth: minWidth,
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
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
  bool isMobile = true,
  double? padding,
  double maxHeight = 60,
  double minWidth = AppDimensions.btnWidthDesk,
}) =>
    Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minWidth: minWidth,
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
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
  double? width,
  bool isMobile = true,
  double? padding,
  double minWidth = AppDimensions.btnWidthDesk,
  double minHeight = 60,
}) =>
    Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: minWidth,
        maxWidth:
            width ?? (isMobile ? double.infinity : AppDimensions.btnWidthDesk),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: isSelected
            ? AppButtonStyle.outlinedBtnWithIconStyleSelected(
                context: context,
                textStyle: Theme.of(context).textTheme.displaySmall,
              )
            : AppButtonStyle.outlinedBtnWithIconStyle(
                context: context,
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 8.0),
          child: postfixWidget != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    postfixWidget,
                    if (textWidget != null || text != null)
                      AppDimensions.sBoxW8,
                    textWidget ??
                        (text != null ? Text(text) : const SizedBox.shrink()),
                  ],
                )
              : textWidget ??
                  (text != null ? Text(text) : const SizedBox.shrink()),
        ),
      ),
    );
