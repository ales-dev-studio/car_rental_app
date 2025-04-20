import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';

class CarSpecWidget extends StatelessWidget {
  const CarSpecWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.value,
  });

  final String imagePath;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimens.largePadding,
      children: [
        SizedBox(
          width: 78,
          height: 78,
          child: Image.asset(imagePath),
        ),
        const SizedBox.shrink(),
        Text(value),
        Text(title),
      ],
    );
  }
}
