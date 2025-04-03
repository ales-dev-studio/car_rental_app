import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/utils/check_device_size.dart';
import 'package:car_rental_app/features/home_feature/data/data_source/local/sample_data.dart';
import 'package:car_rental_app/features/home_feature/presentation/bloc/banner_slider_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSliderWidget extends StatelessWidget {
  const BannerSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerSliderCubit>(
      create: (context) => BannerSliderCubit(),
      child: const _BannerSliderWidget(),
    );
  }
}

class _BannerSliderWidget extends StatelessWidget {
  const _BannerSliderWidget();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BannerSliderCubit>();
    final read = context.read<BannerSliderCubit>();
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: checkDesktopSize(context)
            ? Dimens.largeDeviceBreakPoint
            : size.width,
        child: Column(
          children: [
            CarouselSlider(
              carouselController: watch.state.controller,
              items: banners.map((banner) {
                return Image.asset(banner);
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (final int index, reason) {
                  read.onPageChanged(index: index);
                },
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: watch.state.currentIndex,
              count: banners.length,
              effect: const WormEffect(
                activeDotColor: AppColors.primaryColor,
                dotColor: AppColors.lightGrayColor,
                dotHeight: 8,
                dotWidth: 8,
                type: WormType.thin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
