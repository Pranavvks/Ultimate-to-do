import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_ultimate_todo/presentation/screens/add_task_screen.dart';
import 'package:the_ultimate_todo/presentation/widgets/category_listitems.dart';
import 'package:the_ultimate_todo/presentation/widgets/daily_task_builder.dart';

class NewHomeScreen extends StatelessWidget {
  NewHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffD103FC),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTasksScreen()));
          },
        ),
        backgroundColor: Color(0xff4F74FF),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.black,
                              size: 27.0,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 27.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.black,
                            size: 27.0,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    child: Text(
                      "What's up, Pranav !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                    margin: EdgeInsets.only(left: 48, top: 10, right: 48)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "CATEGORIES",
                        style: TextStyle(
                            color: Color(0xffBBC2D8),
                            fontWeight: FontWeight.w900),
                      ),
                      margin: EdgeInsets.only(top: 22, right: 260),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: CategoryListItems(),
                        width: 410,
                        height: 230,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "TODAY'S TASKS",
                          style: TextStyle(
                              color: Color(0xffBBC2D8),
                              fontWeight: FontWeight.w900),
                        ),
                        margin: EdgeInsets.only(right: 210, bottom: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
/*
 DailyTaskBuilder(
                  task_title: "Complete DSA Backtracking N-Queens",
                  isCompleted: false,
                  color: Colors.pink,
                ),
                

*/