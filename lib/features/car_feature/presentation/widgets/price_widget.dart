import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Dimens.smallPadding,
      children: [
        AppTitleText(
          '\$$price',
          fontSize: 16.0,
        ),
        const AppSubtitleText('per day')
      ],
    );
  }
}
