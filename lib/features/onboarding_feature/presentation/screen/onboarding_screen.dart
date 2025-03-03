import 'package:animate_do/animate_do.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/utils/check_device_size.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:car_rental_app/features/onboarding_feature/data/local/sample_data.dart';
import 'package:car_rental_app/features/onboarding_feature/presentation/bloc/onboarding_cubit.dart';
import 'package:car_rental_app/features/onboarding_feature/presentation/widgets/onboarding_bottom_sheet_widget.dart';
import 'package:car_rental_app/features/onboarding_feature/presentation/widgets/title_and_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(),
      child: const _OnboardingScreen(),
    );
  }
}

class _OnboardingScreen extends StatelessWidget {
  const _OnboardingScreen();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<OnboardingCubit>();
    final read = context.read<OnboardingCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            /// TODO: complete here
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          itemCount: 4,
          controller: watch.state.pageController,
          onPageChanged: (final int position) {
            read.onPageChanged(position);
          },
          itemBuilder: (final context, final position) {
            final size = MediaQuery.of(context).size;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.largePadding,
              ),
              child: Column(
                children: [
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: Container(
                      width: size.width,
                      margin: const EdgeInsets.only(
                        top: Dimens.largePadding,
                      ),
                      child: AppSvgViewer(
                        images[position],
                        width: checkVerySmallDeviceSize(context)
                            ? size.width
                            : Dimens.smallDeviceBreakPoint,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.extraLargePadding,
                  ),
                  const TitleAndDescriptionWidget(),
                ],
              ),
            );
          },
        ),
      ),
      bottomSheet: const OnboardingBottomSheetWidget(),
    );
  }
}
