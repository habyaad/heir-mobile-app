import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CalendarPaint extends CustomPainter {
  final List<Color> gradientColors;

  CalendarPaint({required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Paint paint = Paint();
    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(width, height),
      gradientColors
    );

    Path path = Path();

    path.lineTo(width - width / 4, 0);
    path.lineTo(width, height / 4);
    path.lineTo(width, height);
    path.lineTo(width / 4, height);
    path.lineTo(0, height - height / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
