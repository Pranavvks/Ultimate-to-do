import 'package:flutter/material.dart';
import 'package:the_ultimate_todo/presentation/screens/signup_screen.dart';

Widget SignUpButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15, left: 15),
    padding: EdgeInsets.symmetric(
      vertical: 25.0,
    ),
    width: 165,
    height: 100,
    child: RaisedButton(
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp())),
      color: Color.fromRGBO(17, 33, 31, 1),
      child: Text(
        "SIGN UP",
        style: TextStyle(
          color: Colors.orange,
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
