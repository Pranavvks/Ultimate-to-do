import 'package:flutter/material.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';
import 'package:the_ultimate_todo/presentation/widgets/custom_category_buttons.dart';

class DailyTaskBuilder extends StatefulWidget {
  final String task_title;
  final bool isCompleted;
  final Color color;
  DailyTaskBuilder(
      {Key? key,
      required this.task_title,
      required this.isCompleted,
      required this.color})
      : super(key: key);

  @override
  State<DailyTaskBuilder> createState() => _DailyTaskBuilderState();
}

class _DailyTaskBuilderState extends State<DailyTaskBuilder> {
  // List<DailyTaskBuilderUI> daily_tasks = [];
  void addTaskstoList() {
    daily_tasks.add(DailyTasks(
      task_title: widget.task_title,
      isCompleted: widget.isCompleted,
    ));
  }

  List<DailyTasks> daily_tasks = [];

  @override
  Widget build(BuildContext context) {
    addTaskstoList();
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: daily_tasks.length,
        itemBuilder: (context, index) {
          return DailyTaskBuilderUI(
            dailyTasks: daily_tasks[index],
            addtasks: () => addTaskstoList(),
            color: widget.color,
          );
        });
  }
}

class DailyTaskBuilderUI extends StatefulWidget {
  final DailyTasks dailyTasks;
  final VoidCallback addtasks;
  final Color color;
  DailyTaskBuilderUI({
    required this.dailyTasks,
    required this.addtasks,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  _DailyTaskBuilderUIState createState() => _DailyTaskBuilderUIState();
}

class _DailyTaskBuilderUIState extends State<DailyTaskBuilderUI> {
  @override
  Widget build(BuildContext context) {
    widget.addtasks;
    return Card(
      color: Color(0xff0A155A),
      child: Container(
        margin: EdgeInsets.all(6),
        width: 270,
        height: 65,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 14, right: 10, bottom: 20),
                    child: CustomPaint(
                      painter: TaskButtonPainter(color: widget.color),
                    )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 20, right: 0, left: 30, bottom: 20),
                    child: Text(
                      widget.dailyTasks.task_title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

/*
 InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => setState(() {
                        _value = !_value;
                      }),
                      child: _value
                          ? Container(
                            
                              child: CustomPaint(
                                painter: TaskButtonPainter(color: Colors.white),
                              ),
                            )
                          : Container(
                              child: CustomPaint(
                                painter: TaskButtonPainter(color: Colors.white),
                              ),
                            ),
                    ),




*/
