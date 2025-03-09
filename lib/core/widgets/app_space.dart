import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:flutter/material.dart';

/// Generate vertical space
class AppVSpace extends StatelessWidget {
  const AppVSpace({super.key, this.space});

  final double? space;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(height: space ?? Dimens.largePadding);
  }
}

/// Generate Horizontal space
class AppHSpace extends StatelessWidget {
  const AppHSpace({super.key, this.space});

  final double? space;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(width: space ?? Dimens.largePadding);
  }
}
