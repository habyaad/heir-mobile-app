import 'package:flutter/material.dart';
import 'dart:math';

import '../../../utils/app_colors.dart';

class TransactionStatisticsPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double degToRad(double deg) {
      return deg * pi / 180;
    }

    Paint paint = Paint();
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 32
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    double width = size.width;
    double height = size.height;
    double radius = width / 2;
    Offset center = Offset(width / 2, height / 2);
    double expenseDegree = 98;
    double startAngle = 125;

    paint.strokeWidth = 30;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;
    paint.color = AppColors.primaryColor1;

    Rect rect = Rect.fromCircle(center: center, radius: width / 2);

    double xCordinate = radius * cos(degToRad(startAngle + expenseDegree + 5));
    double yCordinate = radius * sin(degToRad(startAngle + expenseDegree + 5));
    canvas.drawArc(
        rect, degToRad(startAngle), degToRad(290), false, shadowPaint);
    canvas.drawArc(rect, degToRad(startAngle), degToRad(290), false, paint);
    canvas.drawArc(
        rect,
        degToRad(startAngle),
        degToRad(expenseDegree),
        false,
        paint
          ..color = Colors.white
          ..strokeWidth = 5.5);
    canvas.drawCircle(
        Offset(radius + xCordinate, radius + yCordinate),
        6,
        paint
          ..style = PaintingStyle.fill
          ..strokeWidth = 0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
