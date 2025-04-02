import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/utils/app_navigator.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/screens/authentication_screen.dart';
import 'package:car_rental_app/features/onboarding_feature/presentation/bloc/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBottomSheetWidget extends StatelessWidget {
  const OnboardingBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<OnboardingCubit>();
    final read = context.read<OnboardingCubit>();
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.padding,
        vertical: Dimens.largePadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (watch.state.position == 0)
            const SizedBox(width: 90)
          else
            SizedBox(
              width: 90,
              child: TextButton(
                onPressed: () {
                  read.onPreviousPressed();
                },
                child: const Text('Previous'),
              ),
            ),
          SizedBox(
            height: 12.0,
            child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (final context, final index) {
                return InkWell(
                  onTap: () {
                    read.goToSpecificPosition(index);
                  },
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  child: Container(
                    margin: const EdgeInsets.all(Dimens.smallPadding),
                    child: Ink(
                      width: 24.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: index <= watch.state.position
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(Dimens.corners),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              if (watch.state.position == 3) {
                push(context, const AuthenticationScreen());
                return;
              }
              read.onNextPressed();
            },
            child: Text(
              watch.state.position == 3 ? 'Enter' : 'Next',
            ),
          ),
        ],
      ),
    );
  }
}
