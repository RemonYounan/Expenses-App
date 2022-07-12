import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class RPSCustomPainter extends CustomPainter {
//   BuildContext context;
//   RPSCustomPainter(this.context);
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = Theme.of(context).cardColor
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1.0;

//     Path path0 = Path();
//     path0.moveTo(0, size.height);
//     path0.quadraticBezierTo(size.width * 0.0000500, size.height * 0.3145250,
//         size.width * 0.0000500, size.height * 0.1272000);
//     path0.quadraticBezierTo(size.width * -0.0009333, size.height * -0.0314750,
//         size.width * 0.2095833, size.height * 0.0035500);
//     path0.lineTo(size.width * 0.5002167, size.height * 0.0396500);
//     path0.lineTo(size.width * 0.7919833, size.height * 0.0029250);
//     path0.quadraticBezierTo(size.width * 1.0002167, size.height * -0.0321000,
//         size.width, size.height * 0.1285500);
//     path0.quadraticBezierTo(
//         size.width, size.height * 0.3155500, size.width, size.height);
//     path0.lineTo(0, size.height);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class RPSCustomPainter extends CustomPainter {
  BuildContext context;
  RPSCustomPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Theme.of(context).cardColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0000333, size.height * 0.8868750);
    path0.cubicTo(
        size.width * 0.0000333,
        size.height * 0.3241500,
        size.width * 0.0000083,
        size.height * 0.2829000,
        0,
        size.height * 0.0815750);
    path0.quadraticBezierTo(size.width * -0.0017833, size.height * -0.0468250,
        size.width * 0.2089167, 0);
    path0.lineTo(size.width * 0.5000000, size.height * 0.0284500);
    path0.lineTo(size.width * 0.7918833, 0);
    path0.quadraticBezierTo(size.width * 0.9969333, size.height * -0.0386000,
        size.width, size.height * 0.0872000);
    path0.cubicTo(size.width, size.height * 0.2869250, size.width,
        size.height * 0.6995250, size.width, size.height * 0.8861000);
    path0.cubicTo(size.width, size.height * 0.9606250, size.width * 1.0014000,
        size.height * 1.0058250, size.width * 0.9179000, size.height);
    path0.cubicTo(
        size.width * 0.7083833,
        size.height * 1.0069250,
        size.width * 0.2918000,
        size.height * 1.0017000,
        size.width * 0.0822500,
        size.height);
    path0.cubicTo(
        size.width * -0.0008000,
        size.height * 1.0037250,
        size.width * -0.0001000,
        size.height * 0.9617250,
        size.width * 0.0000333,
        size.height * 0.8868750);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
