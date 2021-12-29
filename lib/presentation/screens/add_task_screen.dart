import 'package:flutter/material.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 116, 255, 1),
      floatingActionButton: SizedBox(
        child: Container(
          margin: EdgeInsets.only(right: 60, left: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 17, right: 4, left: 4),
                child: Text(
                  "New Task",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              // Container(
              //   child: Icon(Icons.arrow_circle_up),
              //   margin: EdgeInsets.all(12),
              // ),
            ],
          ),
          // margin: EdgeInsets.only(top: 84, bottom: 84, right: 18, left: 84),
          height: 60,
          width: 220,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20.0),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 6.0,
            //     offset: Offset(4, 4),
            //   ),
            // ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 36, left: 105),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(187, 196, 217, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                  hintText: "Enter new task",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              )),
          // CategoriesDropDownButton(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Text(
          //       "Hi",
          //       style: TextStyle(
          //           color: Colors.white70,
          //           fontSize: 22,
          //           fontWeight: FontWeight.w600),
          //     )
          //   ],
          // )
          // Column(
          //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black, // border color
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                        decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    )),
                  ),
                  margin: EdgeInsets.only(left: 130, bottom: 10),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, right: 20, bottom: 22),
                  height: 51,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 27),
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                              margin: EdgeInsets.only(left: 8),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [],
          // ),

          // Row(
          //   children: [
          //     Container(
          //       child: Text("Hi"),
          //       margin: EdgeInsets.all(90.0),
          //     ),
          //   ],
        ],
      ),
    );
  }
}

class CategoriesDropDownButton extends StatefulWidget {
  const CategoriesDropDownButton({Key? key}) : super(key: key);

  @override
  _CategoriesDropDownButtonState createState() =>
      _CategoriesDropDownButtonState();
}

class _CategoriesDropDownButtonState extends State<CategoriesDropDownButton> {
  @override
  String dropdownValue = 'No list';
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Business',
          'Personal',
          'Academics',
          'Fitness',
          'No list'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  Widget build(BuildContext context) {
    return TextButton(
        child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[900],
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            )),
        onPressed: () {
          TimeOfDay initialTime = TimeOfDay.now();
          var pickedTime = showTimePicker(
            context: context,
            initialTime: initialTime,
            builder: (BuildContext context, Widget? child) {
              return Directionality(
                  textDirection: TextDirection.rtl, child: child!);
            },
          );
        });
  }
}
/*
 height: 60,
          width: 220,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20.0),*
*/
