import 'package:flutter/material.dart';

class CardShape extends CustomPainter {
  BuildContext context;
  CardShape(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Theme.of(context).cardColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(
        0, size.height * 0.4750000, 0, size.height * 0.3000000);
    path0.cubicTo(
        size.width * -0.0005250,
        size.height * -0.0800000,
        size.width * 0.0483500,
        size.height * -0.0093000,
        size.width * 0.1250000,
        size.height * 0.0200000);
    path0.quadraticBezierTo(size.width * 0.2187500, size.height * 0.0525000,
        size.width * 0.5000000, size.height * 0.1500000);
    path0.quadraticBezierTo(size.width * 0.7812500, size.height * 0.0525000,
        size.width * 0.8750000, size.height * 0.0200000);
    path0.cubicTo(
        size.width * 0.9411250,
        size.height * -0.0123000,
        size.width * 1.0020750,
        size.height * -0.0831000,
        size.width,
        size.height * 0.3000000);
    path0.quadraticBezierTo(
        size.width, size.height * 0.4750000, size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
