import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RecentTxPainter extends CustomPainter {
  BuildContext context;
  RecentTxPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final Paint paint0 = Paint()
      ..shader = ui.Gradient.linear(
        Offset(screenWidth * .5, 0),
        Offset(screenWidth * .5, screenHight * .6),
        [
          Theme.of(context).primaryColor,
          Theme.of(context).cardColor,
        ],
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    final Path path0 = Path();
    path0.moveTo(size.width * 0.0000333, size.height * 0.8868750);
    path0.cubicTo(
      size.width * 0.0000333,
      size.height * 0.3241500,
      size.width * 0.0000083,
      size.height * 0.2829000,
      0,
      size.height * 0.0815750,
    );
    path0.quadraticBezierTo(
      size.width * -0.0017833,
      size.height * -0.0468250,
      size.width * 0.2089167,
      0,
    );
    path0.lineTo(size.width * 0.5000000, size.height * 0.0284500);
    path0.lineTo(size.width * 0.7918833, 0);
    path0.quadraticBezierTo(
      size.width * 0.9969333,
      size.height * -0.0386000,
      size.width,
      size.height * 0.0872000,
    );
    path0.cubicTo(
      size.width,
      size.height * 0.2869250,
      size.width,
      size.height * 0.6995250,
      size.width,
      size.height * 0.8861000,
    );
    path0.cubicTo(
      size.width,
      size.height * 0.9606250,
      size.width * 1.0014000,
      size.height * 1.0058250,
      size.width * 0.9179000,
      size.height,
    );
    path0.cubicTo(
      size.width * 0.7083833,
      size.height * 1.0069250,
      size.width * 0.2918000,
      size.height * 1.0017000,
      size.width * 0.0822500,
      size.height,
    );
    path0.cubicTo(
      size.width * -0.0008000,
      size.height * 1.0037250,
      size.width * -0.0001000,
      size.height * 0.9617250,
      size.width * 0.0000333,
      size.height * 0.8868750,
    );
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
