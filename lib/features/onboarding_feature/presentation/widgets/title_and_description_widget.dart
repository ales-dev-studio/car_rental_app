import 'package:animate_do/animate_do.dart';
import 'package:car_rental_app/core/gen/fonts.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/utils/check_device_size.dart';
import 'package:car_rental_app/features/onboarding_feature/data/local/sample_data.dart';
import 'package:car_rental_app/features/onboarding_feature/presentation/bloc/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  const TitleAndDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<OnboardingCubit>();
    final size = MediaQuery.of(context).size;
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      child: SizedBox(
        width: checkVerySmallDeviceSize(context)
            ? size.width
            : Dimens.smallDeviceBreakPoint,
        child: Column(
          children: [
            Text(
              titles[watch.state.position],
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: FontFamily.poppinsBold,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Dimens.extraLargePadding,
            ),
            Text(
              descriptions[watch.state.position],
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: FontFamily.poppinsRegular,
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
