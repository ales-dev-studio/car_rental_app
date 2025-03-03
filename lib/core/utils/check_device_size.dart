import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';

bool checkDesktopSize(final BuildContext context) {
  return MediaQuery.of(context).size.width > Dimens.largeDeviceBreakPoint;
}

bool checkMediumDeviceSize(final BuildContext context) {
  return MediaQuery.of(context).size.width > Dimens.mediumDeviceBreakPoint;
}

bool checkSmallDeviceSize(final BuildContext context) {
  return MediaQuery.of(context).size.width < Dimens.smallDeviceBreakPoint;
}

bool checkVerySmallDeviceSize(final BuildContext context) {
  return MediaQuery.of(context).size.width < Dimens.verySmallDeviceBreakPoint;
}
