import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/login_cubit.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/sign_up/cubit/sign_up_cubit.dart';
import 'package:the_ultimate_todo/presentation/widgets/signin_button.dart';
import 'package:the_ultimate_todo/presentation/widgets/signup_button.dart';

bool _rememberme = false;

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 1),
        margin: EdgeInsets.only(left: 15, right: 15, top: 100, bottom: 20),
        height: 670,
        width: 625,
        child: CustomPaint(
          painter: RectangleBox(),
          child: Column(
            children: [
              Row(
                children: [
                  SignInButton(context),
                  SignUpButton(context),
                ],
              ),
              NameWidget(),
              EmailWidget(),
              PasswordWidget(),
              SignupButton(),
              SignUpWithText(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                          height: 35,
                          width: 35,
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
                      onTap: () =>
                          context.read<LoginCubit>().signInWithGoogle(),
                      child: Container(
                          height: 35,
                          width: 35,
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

class NameWidget extends StatelessWidget {
  const NameWidget({
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
            'Username',
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
          child: BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) => previous.name != current.name,
            builder: (context, state) {
              return TextField(
                onChanged: (name) =>
                    context.read<SignUpCubit>().nameChanged(name),
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepPurpleAccent,
                  ),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              );
            },
          ),
        )),
      ],
    );
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
          child: BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return TextField(
                onChanged: (email) =>
                    context.read<SignUpCubit>().emailChanged(email),
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
              );
            },
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
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return TextField(
                onChanged: (password) =>
                    context.read<SignUpCubit>().passwordChanged(password),
                keyboardType: TextInputType.text,
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
              );
            },
          ),
        )),
      ],
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
    return false;
  }
}

//Color(0xFF6CA8F1),
class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 210,
      height: 100,
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.snackbarmessage != "") {
            final snackbar = SnackBar(content: Text(state.snackbarmessage));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (context, state) {
          return BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return RaisedButton(
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () => {
                  context.read<SignUpCubit>().signUpWithCredentials(),
                },
                color: Colors.blueGrey[900],
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SignUpWithText extends StatelessWidget {
  const SignUpWithText({Key? key}) : super(key: key);

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
            "Sign up with",
          )
        ],
      ),
    );
  }
}
