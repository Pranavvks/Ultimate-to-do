import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_ultimate_todo/presentation/screens/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTasksScreen()));
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 27.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
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
                      color: Colors.grey,
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
                "Welcome Pranav!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800)),
              ),
              margin: EdgeInsets.only(left: 48, top: 10, right: 48)),
          Container(
            margin: EdgeInsets.only(right: 330),
            child: Text(
              "Today,",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 200,
              // bottom: 220,
            ),
            child: Text(
              "27 November 2021",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 270, top: 30),
            child: Text(
              "Tasks",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 21,
                      fontWeight: FontWeight.w700)),
            ),
          )
        ],
      ),
    );
  }
}
