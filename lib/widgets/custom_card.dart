import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom paint Demo'),
      ),
      body: Container(
        child: Center(
          child: CustomPaint(
            size: Size(600, 800),
            painter: RPSCustomPainter(),
            child: Column(children: [
              Row(children: [
                Text('data'),
                TextButton(onPressed: () {}, child: Text('view all'))
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(0, size.height * 0.375, 0, size.height * 0.17);
    path0.quadraticBezierTo(0, size.height * 0.0240833, size.width * 0.125,
        size.height * 0.0323000);
    path0.lineTo(size.width * 0.5, size.height * 0.12);
    path0.lineTo(size.width * 0.875, size.height * 0.03);
    path0.quadraticBezierTo(
        size.width, size.height * 0.02, size.width, size.height * 0.17);
    path0.quadraticBezierTo(
        size.width, size.height * 0.3750500, size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
