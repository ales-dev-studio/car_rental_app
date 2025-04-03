import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:car_rental_app/features/home_feature/data/data_source/local/sample_data.dart';
import 'package:flutter/material.dart';

class TopBrandsWidget extends StatelessWidget {
  const TopBrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimens.largePadding,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
          ),
          child: AppTitleText(
            'Top Brands',
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 34.0,
          child: ListView.builder(
            itemCount: topBrands.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (final context, final index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.largePadding,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  child: Container(
                    decoration: BoxDecoration(
                      color: index == 0
                          ? AppColors.primaryColor
                          : AppColors.cardColor,
                      borderRadius: BorderRadius.circular(Dimens.corners),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.largePadding,
                    ),
                    child: Center(
                      child: Text(
                        topBrands[index],
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
