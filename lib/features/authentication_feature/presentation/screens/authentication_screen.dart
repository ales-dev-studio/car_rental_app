import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/utils/app_navigator.dart';
import 'package:car_rental_app/core/utils/check_device_size.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_outlined_button.dart';
import 'package:car_rental_app/core/widgets/app_scaffold.dart';
import 'package:car_rental_app/core/widgets/app_space.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/screens/mobile_login_screen.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppScaffold(
      backgroundColor: AppColors.blackColor,
      padding: EdgeInsets.zero,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 500,
            width: size.width,
            child: Image.asset(
              Assets.images.ironGround.path,
              fit: BoxFit.none,
            ),
          ),
          Positioned(
            bottom: 180,
            left: checkDesktopSize(context) ? null : 0,
            child: Image.asset(
              Assets.images.maserati.path,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              color: AppColors.blackColor,
              width: size.width,
              child: const Column(
                children: [
                  AppVSpace(
                    space: Dimens.extraLargePadding,
                  ),
                  AppTitleText('Welcome to the '),
                  AppTitleText(
                    'Car rental app',
                    color: AppColors.primaryColor,
                  ),
                  AppVSpace(),
                  AppSubtitleText(
                    'Choose your authentication method to continue',
                  ),
                  AppVSpace(),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppOutlinedButton(
                title: 'Continue with Email',
                onPressed: () {},
                margin: const EdgeInsets.symmetric(
                  horizontal: Dimens.largePadding,
                ),
                iconPath: Assets.icons.mail,
              ),
              AppButton(
                title: 'Continue with Mobile number',
                onPressed: () {
                  push(context, MobileLoginScreen());
                },
                iconPath: Assets.icons.call,
              ),
              const AppVSpace(),
            ],
          )
        ],
      ),
    );
  }
}
