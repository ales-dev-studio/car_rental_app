import 'package:car_rental_app/core/gen/fonts.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class AppPinInput extends StatelessWidget {
  const AppPinInput({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.0,
      height: 57.0,
      margin: const EdgeInsets.symmetric(horizontal: Dimens.padding),
      textStyle: const TextStyle(
        fontSize: 24.0,
        color: AppColors.whiteColor,
        fontFamily: FontFamily.poppinsBold,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.corners,
        ),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 3,
        ),
        color: AppColors.veryLightPrimaryColor,
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        focusNode: focusNode,
        length: 5,
        defaultPinTheme: defaultPinTheme,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onChanged: onChanged,
        autofocus: true,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursor: Center(
          child: Container(
            width: 3.0,
            height: 22.0,
            color: AppColors.primaryColor,
          ),
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(Dimens.corners),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 3.0,
            ),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: AppColors.primaryColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
