import 'package:flutter/material.dart';
import 'dart:math';

import '../../screens/statistics/statistics_model.dart';

class StatisticsPaint extends CustomPainter {
  final List<Stats> stats;

  StatisticsPaint(this.stats);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 32
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    double width = size.width;
    double height = size.height;
    Offset center = Offset(width / 2, height / 2);
    double startAngle = 1.5708;

    paint.strokeWidth = 30;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    Rect rect = Rect.fromCircle(center: center, radius: width / 2);

    for (var stat in stats) {
      canvas.drawArc(rect, startAngle + (10*pi/180), (stat.degree-20) * pi / 180, false,
          shadowPaint);
      canvas.drawArc(rect, startAngle + (10*pi/180), (stat.degree-20) * pi / 180, false,
          paint..color = stat.color);
      startAngle += stat.degree*pi/180;

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
