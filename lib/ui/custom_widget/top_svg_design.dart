import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recrutment_help_app/core/constant/color.dart';

import 'dart:ui' as ui;

class TopDesignForStartScreen extends StatelessWidget {
  const TopDesignForStartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          1.sw,
          (1.sw * 0.3925233644859813)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = kprimaryColor //const ui.Color(0xff01579B)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6517857, size.width,
        size.height * 0.8690476);
    path0.cubicTo(
        size.width * 0.6732009,
        size.height * 0.5014881,
        size.width * 0.2675935,
        size.height * 0.6579762,
        0,
        size.height * 0.2380952);
    path0.quadraticBezierTo(0, size.height * 0.1785714, 0, 0);
    path0.lineTo(size.width, 0);
    canvas.drawPath(path0, paint0);
    canvas.drawShadow(path0, Color(0xff000000).withOpacity(0.20), 0.7, true);
    Paint paint1 = Paint()
      ..color = kprimaryColor //ui.Color(0xff01579B)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    Path path1 = Path();
    path1.moveTo(size.width * 1.0003972, size.height * -0.0002976);
    path1.quadraticBezierTo(size.width * 1.0003972, size.height * 0.5626190,
        size.width * 1.0003972, size.height * 0.7502976);
    path1.cubicTo(
        size.width * 0.7911449,
        size.height * 0.4607738,
        size.width * 0.2056075,
        size.height * 0.5127976,
        size.width * -0.0003972,
        size.height * 0.1188690);
    path1.quadraticBezierTo(size.width * -0.0003972, size.height * 0.0904762,
        size.width * -0.0003972, size.height * 0.0056548);
    path1.lineTo(size.width * 1.0003972, size.height * -0.0002976);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
