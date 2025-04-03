import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';

class UserLocationWidget extends StatelessWidget {
  const UserLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: Dimens.padding,
      children: [
        AppSvgViewer(Assets.icons.location),
        const Text('Liverpool, UK'),
      ],
    );
  }
}
