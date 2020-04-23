import 'dart:ui';

import 'package:celebrateandstar/Star.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  Star star;
  MyPainter(this.star);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.src);
    star.paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }

}