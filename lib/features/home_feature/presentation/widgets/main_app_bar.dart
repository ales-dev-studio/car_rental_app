import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_bordered_icon_button.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/user_location_widget.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/user_profile_image_widget.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        UserProfileImageWidget(),
      ],
      title: const Column(
        spacing: Dimens.padding,
        children: [
          AppSubtitleText('Your Location'),
          UserLocationWidget(),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.largePadding,
        ),
        child: AppBorderedIconButton(iconPath: Assets.icons.menu),
      ),
      leadingWidth: 90.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        AppBar().preferredSize.height + 16.0,
      );
}
