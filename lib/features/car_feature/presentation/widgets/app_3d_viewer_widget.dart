import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class App3dViewerWidget extends StatefulWidget {
  const App3dViewerWidget({super.key, required this.src});

  final String src;

  @override
  State<App3dViewerWidget> createState() => _App3dViewerWidgetState();
}

class _App3dViewerWidgetState extends State<App3dViewerWidget> {
  Flutter3DController controller = Flutter3DController();
  double theta = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 280,
          child: Flutter3DViewer(
            src: widget.src,
            activeGestureInterceptor: true,
            progressBarColor: AppColors.primaryColor,
            enableTouch: true,
            onLoad: (final String model) {
              controller.setCameraOrbit(theta, 87, 70);
            },
            controller: controller,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            spacing: Dimens.largePadding,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  controller.setCameraOrbit(theta += 20, 87, 70);
                },
                icon: AppSvgViewer(Assets.icons.arrowLeft),
              ),
              AppSvgViewer(Assets.icons.a360DegreeRotateIcon),
              IconButton(
                onPressed: () {
                  controller.setCameraOrbit(theta -= 20, 87, 70);
                },
                icon: AppSvgViewer(Assets.icons.arrowRight1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
