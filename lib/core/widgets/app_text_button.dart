import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.title,
    this.child,
    required this.onPressed,
    this.textStyle,
    this.margin,
    this.color,
  });

  final String? title;
  final Widget? child;
  final TextStyle? textStyle;
  final GestureTapCallback? onPressed;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 40.0,
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: Dimens.padding,
          ),
      child: TextButton(
        onPressed: onPressed,
        child: child ??
            Text(
              title ?? '',
              style: textStyle ??
                  TextStyle(
                    color: color ?? AppColors.primaryColor,
                  ),
            ),
      ),
    );
  }
}
