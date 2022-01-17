import 'package:flutter/material.dart';

class DailyTaskBuilder extends StatelessWidget {
  const DailyTaskBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Card(
          color: Color(0xff0A155A),
          child: Container(
            width: 360,
            height: 65,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ],
    ));
  }
}
