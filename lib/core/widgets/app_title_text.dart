import 'package:car_rental_app/core/gen/fonts.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  const AppTitleText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
  });

  final String text;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontFamily.poppinsBold,
        fontSize: fontSize ?? 30.0,
        color: color ?? AppColors.whiteColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
