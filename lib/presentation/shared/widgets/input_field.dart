import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String lable;
  final String hintText;
  final bool showPasswordToggle;
  final int maxLines;
  final String? errorText;

  const AppInputField({
    super.key,
    this.controller,
    required this.lable,
    required this.hintText,
    this.showPasswordToggle = false,
    this.maxLines = 1,
    this.errorText,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool _passwordVisible = false;
  String? errorText;

  @override
  void didChangeDependencies() {
    errorText = widget.errorText;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        AppDimensions.sBoxH8,
        TextFormField(
          controller: widget.controller,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: widget.maxLines,
          obscureText: widget.showPasswordToggle ? !_passwordVisible : false,
          onChanged: (value) => setState(
            () {
              errorText = null;
            },
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 24,
              bottom: 24,
              right: 16,
              left: 16,
            ),
            error: errorText != null ? _errorWidget(errorText!) : null,
            errorMaxLines: 1,
            suffixIcon: _sufixIcon(),
            border: _border(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            focusedBorder: _border(
              color: AppColors.purple,
            ),
            errorBorder: _border(
              color: Theme.of(context).colorScheme.error,
            ),
            focusedErrorBorder: _border(
              color: Theme.of(context).colorScheme.error,
            ),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
          ),
        ),
      ],
    );
  }

  Widget _errorWidget(String error) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          size: 16,
          color: Theme.of(context).colorScheme.error,
        ),
        AppDimensions.sBoxW8,
        Text(
          error,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.red,
              ),
        ),
      ],
    );
  }

  Widget? _sufixIcon() => widget.showPasswordToggle
      ? Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        )
      : null;

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
