import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

bool _rememberme = false;

class LoginRectangle extends StatefulWidget {
  const LoginRectangle({Key? key}) : super(key: key);

  @override
  _LoginRectangleState createState() => _LoginRectangleState();
}

class _LoginRectangleState extends State<LoginRectangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 1),
        margin: EdgeInsets.only(left: 15, right: 15, top: 100, bottom: 20),
        height: 685,
        width: 670,
        child: CustomPaint(
          painter: RectangleBox(),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Image.asset('assets/images/Component 1.png'),
                    margin: EdgeInsets.only(left: 15, top: 20),
                  ),
                  Container(
                    child: Text(
                      "SIGN UP",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    margin: EdgeInsets.only(
                      left: 40,
                      top: 20,
                    ),
                    padding: EdgeInsets.all(20),
                  )
                ],
              ),
              EmailWidget(),
              PasswordWidget(),
              ForgotPassword(),
              RememberMeCheckBox(),
              LoginButton(),
              SignInWithText(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                          height: 45,
                          width: 45,
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
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/apple_icon.png')),
                          )),
                    ),
                    GestureDetector(
                      child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/google_icon.png')),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 25,
            left: 29,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(
            child: Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          height: 60,
          width: 320,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF2D2F41),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.deepPurpleAccent,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
        )),
      ],
    );
  }
}

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 25,
            left: 29,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(
            child: Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          height: 60,
          width: 320,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF2D2F41),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.deepPurpleAccent,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
        )),
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot password"),
        child: Text(
          'Forgot Password ?',
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
    );
  }
}

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({Key? key}) : super(key: key);

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12),
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.red,
            ),
            child: Checkbox(
                value: _rememberme,
                activeColor: Colors.green,
                checkColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _rememberme = value!;
                  });
                }),
          ),
          Text("Remember me",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}

class RectangleBox extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    // final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);

    var outlinebrush = Paint()..color = Colors.white;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, size.width, size.height), Radius.circular(16)));
    var inlinebrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    // var brush = Paint()..color = Colors.pink;
    // final angle = -90 * pi / 180;

    canvas.drawPath(path, outlinebrush);
    // canvas.drawRect(shapeBounds, outlinebrush);
    canvas.drawPath(path, inlinebrush);
    // canvas.drawOval(
    //     Rect.fromLTRB(0, 0, size.width / 4, size.height / 4), brush);
    // canvas.rotate(angle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//Color(0xFF6CA8F1),
class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 210,
      height: 100,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () => print("Login Button"),
        color: Colors.blueGrey[900],
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class SignInWithText extends StatelessWidget {
  const SignInWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '- OR - ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sign in with",
          )
        ],
      ),
    );
  }
}
