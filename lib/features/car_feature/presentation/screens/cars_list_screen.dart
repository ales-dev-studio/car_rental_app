import 'package:animate_do/animate_do.dart';
import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_scaffold.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/car_list_card_painter.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/cars_list_app_bar.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/price_widget.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/rate_widget.dart';
import 'package:car_rental_app/features/home_feature/data/data_source/local/sample_data.dart';
import 'package:flutter/material.dart';

class CarsListScreen extends StatelessWidget {
  const CarsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CarsListAppBar(),
      body: FadeInDown(
        child: ListView.builder(
          itemCount: brandAndNameOfCars.length,
          itemBuilder: (final context, final index) {
            return Padding(
              padding: const EdgeInsets.only(top: Dimens.largePadding),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: CarListCardPainter(),
                    child: SizedBox(
                      height: 176.0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimens.largePadding,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: Dimens.padding,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimens.largePadding,
                                      ),
                                      child: RateWidget(rate: 4.5),
                                    ),
                                    AppTitleText(
                                      brandAndNameOfCars[index]['brand'] ?? '',
                                      fontSize: 14.0,
                                      color: AppColors.primaryColor,
                                    ),
                                    AppSubtitleText(
                                      brandAndNameOfCars[index]['name'] ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: Dimens.smallPadding,
                                ),
                                child: SizedBox(
                                  height: 105,
                                  child: Image.asset(
                                    imagesOfCars[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Dimens.largePadding),
                            child: PriceWidget(
                              price: prices[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 1,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.primaryColor,
                      child: AppSvgViewer(
                        Assets.icons.arrowRight,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
