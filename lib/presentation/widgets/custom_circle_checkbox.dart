import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircle extends CircleBorder {
  late BorderSide side;
  late Color colors;
  CustomCircle({required this.colors, required this.side});
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawCircle(
        rect.center,
        (rect.shortestSide - side.width) / 2.0,
        Paint()
          ..color = colors
          ..strokeWidth = 5.0);
  }
}
