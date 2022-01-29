import 'package:flutter/material.dart';
import 'package:the_ultimate_todo/Data/Provider/daily_todo_api_db.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';
import 'package:the_ultimate_todo/presentation/widgets/custom_category_buttons.dart';
import 'package:the_ultimate_todo/services/models/tasks/list_daily_tasks.dart';

class DailyTaskBuilder extends StatefulWidget {
  DailyTaskBuilder({
    required this.dailytaskslist,
    Key? key,
  }) : super(key: key);
  List<DailyTasks> dailytaskslist;

  @override
  State<DailyTaskBuilder> createState() => _DailyTaskBuilderState();
}

class _DailyTaskBuilderState extends State<DailyTaskBuilder> {
  // List<DailyTaskBuilderUI> daily_tasks = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.dailytaskslist.length,
        itemBuilder: (context, index) {
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
                          margin:
                              EdgeInsets.only(left: 14, right: 10, bottom: 20),
                          child: CustomPaint(
                            painter: TaskButtonPainter(color: Colors.green),
                          )),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 20, right: 0, left: 30, bottom: 20),
                          child: Text(
                            widget.dailytaskslist[index].task_title,
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
        });
  }
}

/*


         StreamBuilder(
        stream: widget.dailytaskslist,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return DailyTaskBuilderUI(
              dailyTasks: snapshot.data, color: Colors.green);
        });

*/

// class DailyTaskBuilderUI extends StatefulWidget {
//   final List<DailyTasks> dailyTasks;
//   // final VoidCallback addtasks;
//   final Color color;
//   DailyTaskBuilderUI({
//     required this.dailyTasks,
//     // required this.addtasks,
//     required this.color,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _DailyTaskBuilderUIState createState() => _DailyTaskBuilderUIState();
// }

// class _DailyTaskBuilderUIState extends State<DailyTaskBuilderUI> {
//   @override
//   Widget build(BuildContext context) {
    
//     return Card(
//       color: Color(0xff0A155A),
//       child: Container(
//         margin: EdgeInsets.all(6),
//         width: 270,
//         height: 65,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(left: 14, right: 10, bottom: 20),
//                     child: CustomPaint(
//                       painter: TaskButtonPainter(color: widget.color),
//                     )),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                         top: 20, right: 0, left: 30, bottom: 20),
//                     child: Text(
//                       widget.dailyTasks[0].task_title,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//     );
//   }
// }

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
