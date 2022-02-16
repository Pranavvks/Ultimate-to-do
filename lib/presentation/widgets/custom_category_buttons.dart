import 'package:flutter/material.dart';

class CustomCategoryButton extends StatefulWidget {
  CustomCategoryButton({
    Key? key,
  }) : super(key: key);

  @override
  _CustomCategoryButtonState createState() => _CustomCategoryButtonState();
}

class _CustomCategoryButtonState extends State<CustomCategoryButton> {
  late State s;

  @override
  Widget build(BuildContext context) {
    bool isbusiness = false;
    late String category;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: CustomPaint(
                  size: Size(19, 19),
                  painter: CategoryButtonPainter(color: Colors.orange),
                )),
            InkWell(
              focusColor: Colors.grey[300],
              onTap: () {
                setState(() {
                  category = "Business";
                  isbusiness = !isbusiness;
                  print(isbusiness);
                  if (isbusiness) Text("Hi");
                });
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Business",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 17),
                ),
              ),
            ),

            //
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => {
                    category = "Personal",
                    isbusiness = !isbusiness,
                    setState(() {})
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomPaint(
                        size: Size(19, 19),
                        painter: CategoryButtonPainter(
                          color: Colors.green,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Personal",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: CustomPaint(
                      size: Size(19, 19),
                      painter: CategoryButtonPainter(color: Colors.black),
                    )),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Study",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => category = "Fitness",
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomPaint(
                        size: Size(19, 19),
                        painter: CategoryButtonPainter(color: Colors.purple),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Fitness",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => {
                    category = "Other List",
                    setState(() {
                      isbusiness = !isbusiness;
                    })
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomPaint(
                        size: Size(19, 19),
                        painter: CategoryButtonPainter(color: Colors.redAccent),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Other List",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// class _CategoryButtonsBloc <T extends State> extends

class CategoryButtonPainter extends CustomPainter {
  Color color;
  CategoryButtonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final roundedrect =
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(7.34));
    canvas.drawRRect(roundedrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class TaskButtonPainter extends CustomPainter {
  Color color;
  TaskButtonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(10, 10), 15, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
