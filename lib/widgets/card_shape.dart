import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CardShape extends CustomPainter {
  BuildContext context;
  CardShape(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final Paint paint0 = Paint()
      ..shader = ui.Gradient.linear(
        Offset(screenWidth * .5, 0),
        Offset(screenWidth * .5, screenHight * .25),
        [
          Theme.of(context).primaryColor,
          Theme.of(context).cardColor,
          // Colors.blue,
          // Colors.red,
        ],
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    final Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(
      0,
      size.height * 0.3625000,
      0,
      size.height * 0.1500000,
    );
    path0.cubicTo(
      size.width * 0.0199500,
      size.height * -0.0862000,
      size.width * 0.1587750,
      size.height * 0.0139500,
      size.width * 0.2150000,
      size.height * 0.0500000,
    );
    path0.quadraticBezierTo(
      size.width * 0.2854250,
      size.height * 0.0799500,
      size.width * 0.5000000,
      size.height * 0.1500000,
    );
    path0.quadraticBezierTo(
      size.width * 0.7137500,
      size.height * 0.0783000,
      size.width * 0.7850000,
      size.height * 0.0500000,
    );
    path0.cubicTo(
      size.width * 0.8362750,
      size.height * 0.0156000,
      size.width * 0.9602750,
      size.height * -0.0845500,
      size.width,
      size.height * 0.1500000,
    );
    path0.quadraticBezierTo(
      size.width,
      size.height * 0.3625000,
      size.width,
      size.height,
    );
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
