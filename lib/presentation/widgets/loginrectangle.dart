import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginRectangle extends StatefulWidget {
  const LoginRectangle({Key? key}) : super(key: key);

  @override
  _LoginRectangleState createState() => _LoginRectangleState();
}

class _LoginRectangleState extends State<LoginRectangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70),
      margin: EdgeInsets.only(left: 15, right: 15, top: 85, bottom: 20),
      height: 655,
      width: 670,
      child: CustomPaint(
          painter: RectangleBox(),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Image.asset('assets/images/Component 1.png'),
                    margin: EdgeInsets.only(left: 15, top: 20),
                  ),
                  Container(
                    child: Text(
                      "SIGN UP",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    margin: EdgeInsets.only(left: 40, top: 20),
                    padding: EdgeInsets.all(20),
                  )
                ],
              )
            ],
          )),
      //  child: Container(
      //       padding: EdgeInsets.only(top: 0),
      //       child: Image.asset('assets/images/Component 1.png')
      //       // child: SvgPicture.asset('assets/images/Component 1.svg'),
      //       ),
    );
  }
}

class RectangleBox extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    // final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);

    var outlinebrush = Paint()..color = Colors.white;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, size.width, size.height), Radius.circular(16)));
    var inlinebrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    // var brush = Paint()..color = Colors.pink;
    // final angle = -90 * pi / 180;

    canvas.drawPath(path, outlinebrush);
    // canvas.drawRect(shapeBounds, outlinebrush);
    canvas.drawPath(path, inlinebrush);
    // canvas.drawOval(
    //     Rect.fromLTRB(0, 0, size.width / 4, size.height / 4), brush);
    // canvas.rotate(angle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class CustomButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var brush = Paint()..color = Colors.pink;
    final angle = -90 * pi / 180;
    canvas.drawOval(
        Rect.fromLTRB(0, 0, size.width / 4, size.height / 4), brush);
    canvas.rotate(angle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
