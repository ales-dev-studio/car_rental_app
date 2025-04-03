import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';

class UserProfileImageWidget extends StatelessWidget {
  const UserProfileImageWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.padding,
      ),
      child: SizedBox(
        width: width ?? 58.0,
        height: height ?? 58.0,
        child: CircleAvatar(
          child: Image.asset(Assets.images.profile.path),
        ),
      ),
    );
  }
}
