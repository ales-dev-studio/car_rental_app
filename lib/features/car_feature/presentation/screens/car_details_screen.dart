import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_scaffold.dart';
import 'package:car_rental_app/core/widgets/app_space.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/app_3d_viewer_widget.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/car_spec_widget.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/cars_details_app_bar.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/price_widget.dart';
import 'package:car_rental_app/features/car_feature/presentation/widgets/rate_widget.dart';
import 'package:car_rental_app/features/home_feature/data/data_source/local/sample_data.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CarsDetailsAppBar(),
      padding: EdgeInsets.zero,
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          children: [
            App3dViewerWidget(
              src: Assets.a3dModels.porsche911CarreraGts,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.largePadding,
              ),
              child: Column(
                spacing: Dimens.largePadding,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTitleText(
                        'Technical specifications',
                        fontSize: 16.0,
                      ),
                      RateWidget(
                        rate: 4.5,
                        textColor: AppColors.whiteColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarSpecWidget(
                        imagePath: Assets.images.speedIndicator.path,
                        title: 'Top speed',
                        value: '296 km/h',
                      ),
                      CarSpecWidget(
                        imagePath: Assets.images.engineIndicator.path,
                        title: 'Engine',
                        value: '4.0 l six-cylinder',
                      ),
                      CarSpecWidget(
                        imagePath: Assets.images.chairIndicator.path,
                        title: 'Chairs',
                        value: '2',
                      ),
                    ],
                  ),
                  const AppVSpace(
                    space: 150.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 145,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(
            Dimens.corners * 2,
          ),
        ),
        margin: const EdgeInsets.all(Dimens.largePadding),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(
                Dimens.largePadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rent price'),
                  PriceWidget(price: 528),
                ],
              ),
            ),
            AppButton(title: 'Book now', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
