import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_bordered_icon_button.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/user_location_widget.dart';
import 'package:flutter/material.dart';

class CarsDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CarsDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
          ),
          child: SizedBox(
            width: 40,
            height: 40,
            child: AppBorderedIconButton(
              iconPath: Assets.icons.starFilled,
              onPressed: () {},
            ),
          ),
        ),
      ],
      title: const UserLocationWidget(),
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.largePadding,
        ),
        child: AppBorderedIconButton(
          iconPath: Assets.icons.arrowLeft1,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      leadingWidth: 90.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        AppBar().preferredSize.height + 16.0,
      );
}
