import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.initialValue,
    this.labelText,
    this.errorText,
    this.focusNode,
    this.nextFocusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputType,
    this.maxLines,
    this.obSecure,
    this.maxLength,
    this.hinText,
    this.textInputAction,
    this.textStyle,
    this.suffixTextStyle,
    this.textDirection,
    this.inputFormatters,
    this.autoValidate = false,
    this.displayErrorState = true,
    this.onTap,
    this.suffixTextBackgroundColor,
    this.suffixText,
    this.prefixText,
    this.centerText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus = false,
    this.hintStyle,
    this.displayCounterText = false,
    this.showBorder = true,
    this.borderRadius,
    this.contentPadding,
    this.fillColor,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? initialValue;
  final String? labelText;
  final String? errorText;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool? obSecure;
  final int? maxLength;
  final String? hinText;
  final TextStyle? textStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool displayErrorState;
  final bool autoValidate;
  final Color? suffixTextBackgroundColor;
  final String? suffixText;
  final String? prefixText;
  final TextDirection? textDirection;
  final bool centerText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool autoFocus;
  final bool displayCounterText;
  final bool showBorder;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      textDirection: textDirection,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      keyboardType: textInputType,
      inputFormatters: (textInputType == TextInputType.number ||
              textInputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              if (inputFormatters != null) ...inputFormatters!,
            ]
          : null),
      autocorrect: false,
      autofocus: autoFocus,
      maxLength: maxLength,
      obscureText: obSecure ?? false,
      maxLines: maxLines,
      textInputAction: textInputAction ??
          (nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
      style: textStyle,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: contentPadding,
        counterText: displayCounterText ? null : '',
        hintText: hinText,
        hintStyle: hintStyle,
        hintTextDirection: textDirection,
        fillColor: fillColor,
        filled: fillColor != null,
        prefixIcon: prefixIcon,
        prefix: prefixText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding,
                ),
                child: Text(
                  prefixText!,
                ),
              )
            : null,
        labelText: labelText,
        errorText: errorText,
        errorStyle: TextStyle(fontSize: displayErrorState ? 13 : 0.0),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 200,
        ),
        suffix: suffixText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding,
                ),
                child: Text(
                  suffixText!,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? AppColors.primaryColor : Colors.transparent,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                Dimens.corners,
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? AppColors.borderColor : Colors.transparent,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                Dimens.corners,
              ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                Dimens.corners,
              ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.red : Colors.transparent,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                Dimens.corners,
              ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.red : Colors.transparent,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                Dimens.corners,
              ),
        ),
      ),
    );
  }
}
