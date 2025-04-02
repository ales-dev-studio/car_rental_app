import 'package:animate_do/animate_do.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_list_tile.dart';
import 'package:car_rental_app/core/widgets/app_scaffold.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/bloc/country_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CountrySelectionCubit countrySelectionCubit =
        BlocProvider.of<CountrySelectionCubit>(context);
    return AppScaffold(
      appBar: AppBarWithSearchSwitch(
        clearOnClose: true,
        onChanged: (final query) {
          countrySelectionCubit.searchCountries(query);
        },
        appBarBuilder: (context) {
          return AppBar(
            title: const Text('Choose a country'),
            actions: [
              IconButton(
                onPressed: () {
                  AppBarWithSearchSwitch.of(context)?.startSearch();
                },
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.padding,
                  ),
                  child: AppSvgViewer(Assets.icons.searchNormal),
                ),
              )
            ],
          );
        },
      ),
      body: FadeInDown(
        child: BlocBuilder<CountrySelectionCubit, CountrySelectionState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (final context, final index) {
                return AppListTile(
                  onTap: () {
                    countrySelectionCubit.selectCountry(index);
                    Navigator.of(context).pop();
                  },
                  leading: AppSvgViewer(
                    state.countries[index]['flag'],
                  ),
                  title: state.countries[index]['name'],
                  trailingWidget: Text(
                    state.countries[index]['code'],
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
