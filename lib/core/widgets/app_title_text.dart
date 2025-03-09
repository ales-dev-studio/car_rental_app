import 'package:car_rental_app/core/gen/fonts.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  const AppTitleText(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontFamily.poppinsBold,
        fontSize: 30.0,
        color: color ?? AppColors.whiteColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
