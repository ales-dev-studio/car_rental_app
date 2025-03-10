import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/utils/app_navigator.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_list_tile.dart';
import 'package:car_rental_app/core/widgets/app_scaffold.dart';
import 'package:car_rental_app/core/widgets/app_space.dart';
import 'package:car_rental_app/core/widgets/app_subtitle_text.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/core/widgets/app_title_text.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/bloc/country_selection_cubit.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/screens/country_selection_screen.dart';
import 'package:car_rental_app/features/authentication_feature/presentation/screens/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountrySelectionCubit>(
      create: (context) => CountrySelectionCubit(),
      child: _MobileLoginScreen(),
    );
  }
}

class _MobileLoginScreen extends StatelessWidget {
  _MobileLoginScreen();

  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<CountrySelectionCubit>();
    return AppScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppVSpace(
              space: Dimens.extraLargePadding,
            ),
            AppSvgViewer(
              Assets.images.sampleLogo,
            ),
            const AppVSpace(
              space: Dimens.extraLargePadding,
            ),
            const AppTitleText('Login / Register'),
            const AppVSpace(),
            const AppSubtitleText(
              'Please confirm your country code\nand enter your phone number',
            ),
            const AppVSpace(
              space: Dimens.extraLargePadding,
            ),
            AppListTile(
              onTap: () {
                push(
                  context,
                  BlocProvider.value(
                    value: context.read<CountrySelectionCubit>(),
                    child: const CountrySelectionScreen(),
                  ),
                );
              },
              title: watch.state.selectedCountry == null
                  ? 'Country'
                  : watch.state.countries[watch.state.selectedCountry!]['name'],
              leading: watch.state.selectedCountry == null
                  ? null
                  : AppSvgViewer(
                      watch.state.countries[watch.state.selectedCountry!]
                          ['flag'],
                    ),
              hasBorder: true,
              trailingWidget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    watch.state.selectedCountry == null
                        ? ''
                        : watch.state.countries[watch.state.selectedCountry!]
                            ['code'],
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const AppHSpace(
                    space: Dimens.padding,
                  ),
                  AppSvgViewer(Assets.icons.arrowRight1),
                ],
              ),
            ),
            const AppVSpace(
              space: Dimens.extraLargePadding,
            ),
            Form(
              key: _formKey,
              child: AppTextFormField(
                controller: _controller,
                labelText: 'Phone number',
                textInputType: TextInputType.phone,
                maxLength: 10,
                validator: (final phoneNUmber) {
                  if (phoneNUmber!.length != 10) {
                    return 'Mobile number must be 10 digits.';
                  }
                  return null;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: Dimens.largePadding,
                    right: Dimens.padding,
                    top: Dimens.padding,
                    bottom: Dimens.padding,
                  ),
                  child: AppSvgViewer(
                    Assets.icons.call,
                    width: 20,
                  ),
                ),
                prefixText: watch.state.selectedCountry == null
                    ? ''
                    : watch.state.countries[watch.state.selectedCountry!]
                        ['code'],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: Dimens.largePadding,
        ),
        child: AppButton(
          title: 'Next',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (watch.state.selectedCountry == null) {
                return;
              }
              final phoneNumber =
                  watch.state.countries[watch.state.selectedCountry!]['code'] +
                      _controller.text;
              push(
                context,
                OtpVerificationScreen(
                  phoneNumber: phoneNumber,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
