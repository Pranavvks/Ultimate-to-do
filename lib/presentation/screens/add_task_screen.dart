import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:the_ultimate_todo/presentation/widgets/custom_bottom_sheet.dart';
import 'package:the_ultimate_todo/presentation/widgets/custom_category_buttons.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _handleFABPressed(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(child: CustomCategoryButton());
      },
    );
  }

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
            ],
          ),
          height: 60,
          width: 220,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20.0),
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
                controller: myController,
                onSubmitted: (value) => print(value),
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
          GestureDetector(
            onTap: () => {_handleFABPressed(context)},
            child: Container(
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
                    child: InkWell(
                      onTap: () {
                        _selectdatetime(context);
                      },
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectdatetime(BuildContext context) async {
    final DateTime? picked = await DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
    );
    if (picked != Null) {
      final data = picked.toString();
      // print(date);
      final regex = RegExp(
          r'^([0-9]{4}-[0-9]{2}-[0-9]{2})(\s)([0-9]{2}:[0-9]{2})(.*)$',
          caseSensitive: false);

      final match = regex.firstMatch(data);
      final date = print(match!.group(1));
      final time = print(match.group(3));
    }
  }
}
