import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_scaffold.dart';
import 'package:car_rental_app/core/widgets/app_space.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:car_rental_app/core/widgets/app_text_button.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/widgets/app_pin_input.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSvgViewer(Assets.images.otpIllustration),
            const AppVSpace(),
            const AppTitleText('Enter code'),
            const AppVSpace(
              space: Dimens.padding,
            ),
            AppSubtitleText(
              "We've sent an SMS with an code to your phone\n$phoneNumber",
            ),
            const AppVSpace(
              space: Dimens.extraLargePadding,
            ),
            Center(
              child: AppPinInput(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                onChanged: (final code) {},
              ),
            ),
            const AppVSpace(
              space: Dimens.extraLargePadding,
            ),
            const AppSubtitleText("Didn't receive code?"),
            AppTextButton(title: 'Resend', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
