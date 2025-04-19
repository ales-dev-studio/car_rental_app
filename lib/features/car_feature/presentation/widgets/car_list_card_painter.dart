import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CarListCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.05714286, 0);
    path_0.cubicTo(
      size.width * 0.02558381,
      0,
      0,
      size.height * 0.06105227,
      0,
      size.height * 0.1363636,
    );
    path_0.lineTo(0, size.height * 0.8636364);
    path_0.cubicTo(
      0,
      size.height * 0.9389489,
      size.width * 0.02558381,
      size.height,
      size.width * 0.05714286,
      size.height,
    );
    path_0.lineTo(size.width * 0.7707286, size.height);
    path_0.cubicTo(
      size.width * 0.7917667,
      size.height,
      size.width * 0.8088238,
      size.height * 0.9593011,
      size.width * 0.8088238,
      size.height * 0.9090909,
    );
    path_0.lineTo(size.width * 0.8088238, size.height * 0.8432727);
    path_0.cubicTo(
      size.width * 0.8088238,
      size.height * 0.7208864,
      size.width * 0.8503976,
      size.height * 0.6216818,
      size.width * 0.9016810,
      size.height * 0.6216818,
    );
    path_0.lineTo(size.width * 0.9619048, size.height * 0.6216818);
    path_0.cubicTo(
      size.width * 0.9829452,
      size.height * 0.6216818,
      size.width,
      size.height * 0.5809773,
      size.width,
      size.height * 0.5307699,
    );
    path_0.lineTo(size.width, size.height * 0.1363636);
    path_0.cubicTo(
      size.width,
      size.height * 0.06105227,
      size.width * 0.9744167,
      0,
      size.width * 0.9428571,
      0,
    );
    path_0.lineTo(size.width * 0.05714286, 0);
    path_0.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.5000000),
        Offset(size.width, size.height * 0.5000000),
        [const Color(0xff434141), const Color(0xff757575)],
        [0.499613, 1]);
    canvas.drawPath(path_0, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
