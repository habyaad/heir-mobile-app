import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BeneficiaryPaint extends CustomPainter {
  final Color color;
  BeneficiaryPaint({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(
          Offset(0, height / 2),
          Offset(width, height / 2),
          [color,const Color(0xffEEAB97).withOpacity(.5)],);
    Paint paint1 = Paint()
      ..strokeCap = StrokeCap.round
      ..color = color.withOpacity(.3);
    Path path = Path();
    path.moveTo(0, height * .25);
    path.quadraticBezierTo(width * .03, height * .1, width * .1, height * .1);
    path.quadraticBezierTo(width / 2, -20, width - width * .1, height * .1);
    path.quadraticBezierTo(
        width - width * .03, height * .1, width, height * .25);
    path.lineTo(width, height - height * .25);
    path.quadraticBezierTo(width - width * .03, height - height * .1,
        width - width * .1, height - height * .1);
    path.quadraticBezierTo(
        width / 2, height - height * .4, width * .1, height - height * .1);
    path.quadraticBezierTo(
        width * .03, height - height * .1, 0, height - height * 0.25);
    path.close();

    canvas.drawPath(path, paint..color=Colors.white);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint1);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
