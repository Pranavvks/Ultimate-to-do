import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:the_ultimate_todo/Data/Repository/tasks_repository.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/bloc/tasks_bloc.dart';

import 'package:the_ultimate_todo/presentation/widgets/custom_bottom_sheet.dart';
import 'package:the_ultimate_todo/presentation/widgets/custom_category_buttons.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';
import 'package:uuid/uuid.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) =>
          TasksBloc(dailytasksrepository: context.read<TasksRepository>()),
      child: Container(
        child: AddTasksScreenHelper(),
      ),
    );
  }
}

class AddTasksScreenHelper extends StatefulWidget {
  const AddTasksScreenHelper({Key? key}) : super(key: key);

  @override
  State<AddTasksScreenHelper> createState() => _AddTasksScreenHelperState();
}

class _AddTasksScreenHelperState extends State<AddTasksScreenHelper> {
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
    String tasktitle = "";
    // String task_description = "";
    // String category = "";
    // String duetime = "";
    // String duedate = "";
    var task;

    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 116, 255, 1),
      floatingActionButton: InkWell(
        onTap: () => {
          BlocProvider.of<TasksBloc>(context).add(CreateEverydayTasks(task)),
        },
        child: SizedBox(
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 36, left: 105),
              child: TextField(
                controller: myController,
                onSubmitted: (value) => {
                  task = createTasks(value),
                },
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
      final date = (match!.group(1));
      final time = (match.group(3));
    }
  }
}

DailyTasks createTasks(
  String tasktitle,
) {
  var id = Uuid().v4();
  return DailyTasks(
    task_title: tasktitle,
    id: id,
  );
}
