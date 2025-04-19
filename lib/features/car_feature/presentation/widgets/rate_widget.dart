import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.rate, this.textColor});

  final double rate;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Dimens.smallPadding,
      children: [
        AppSvgViewer(
          Assets.icons.starFilled,
          color: AppColors.primaryColor,
        ),
        AppSubtitleText(
          rate.toString(),
          color: textColor,
        ),
      ],
    );
  }
}
