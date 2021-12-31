import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:the_ultimate_todo/presentation/widgets/custom_bottom_sheet.dart';

class BuildListItem extends StatefulWidget {
  BuildContext context;
  late Widget title;
  late Widget leading;
  late Widget trailing;
  BuildListItem({
    Key? key,
    required this.context,
    required this.title,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  _BuildListItemState createState() => _BuildListItemState();
}

class _BuildListItemState extends State<BuildListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.leading != Null) widget.leading,
          if (widget.title != Null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: DefaultTextStyle(
                child: widget.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          Spacer(),
          if (widget.trailing != Null) widget.trailing,
        ],
      ),
    );
  }
}

// Widget _buildListItem(
//   BuildContext context, {
//   required Widget title,
//   required Widget leading,
//   required Widget trailing,
// }) {
//   final theme = Theme.of(context);
// }

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  void _handleFABPressed(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        bool isOn = false;
        return Popover(
          child: Column(
            children: [
              BuildListItem(
                context: context,
                title: Text(
                  'Business',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.check_circle_outline),
                trailing: Switch(
                  value: isOn,
                  onChanged: (isOn) {
                    setState(() {
                      !isOn;
                    });
                  },
                ),
              ),
              BuildListItem(
                context: context,
                title: Text(
                  'Study',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.inbox),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      value = !value;
                    });
                  },
                ),
              ),
              BuildListItem(
                context: context,
                title: Text(
                  'Personal',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.check_circle),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      value = !value;
                    });
                  },
                ),
              ),
              BuildListItem(
                context: context,
                title: Text(
                  'Fitness',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.flag),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      value = !value;
                    });
                  },
                ),
              ),
              BuildListItem(
                context: context,
                title: Text(
                  'No list',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.flag),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      value = !value;
                    });
                  },
                ),
              ),
            ],
          ),
        );
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
