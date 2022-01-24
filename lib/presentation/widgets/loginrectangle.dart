import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/login_cubit.dart';
import 'package:the_ultimate_todo/presentation/widgets/signin_button.dart';
import 'package:the_ultimate_todo/presentation/widgets/signup_button.dart';

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
        height: 635,
        width: 695,
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
              EmailWidget(),
              PasswordWidget(),
              ForgotPassword(),
              // RememberMeCheckBox(),
              LoginButton(),
              SignInWithText(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                          height: 25,
                          width: 25,
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
                          height: 25,
                          width: 25,
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
          child: BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return TextField(
                onChanged: (email) =>
                    context.read<LoginCubit>().emailChanged(email),
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
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return TextField(
                onChanged: (password) =>
                    context.read<LoginCubit>().passwordChanged(password),
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
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return RaisedButton(
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              context.read<LoginCubit>().logInWithCredentials();
            },
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
          );
        },
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
