import 'package:flutter/material.dart';
import 'package:the_ultimate_todo/presentation/screens/login_screen.dart';

Widget SignInButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 15,
      left: 10,
    ),
    padding: EdgeInsets.symmetric(
      vertical: 25.0,
    ),
    width: 165,
    height: 100,
    child: RaisedButton(
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
      color: Color.fromRGBO(17, 33, 31, 1),
      child: Text(
        "LOGIN",
        style: TextStyle(
          color: Color.fromRGBO(217, 61, 61, 1),
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
