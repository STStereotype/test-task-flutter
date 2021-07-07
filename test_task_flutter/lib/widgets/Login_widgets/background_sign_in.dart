import 'package:test_task_flutter/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(width, 0),
        <Color>[
          Color(0xFFD04961),
          Color(0xFFE5434B),
        ],
      );
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    canvas.drawPath(mainBackground, paint);
    //blue
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromCenter(
              center: Offset(width / 2, height / 2),
              width: width * 0.9,
              height: height * 0.57),
          topLeft: Radius.circular(60),
          bottomRight: Radius.circular(60)))
      ..close();
    var paint2 = Paint();
    paint2.color = Colors.white;
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
