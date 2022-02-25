import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/sign_up/cubit/sign_up_cubit.dart';
import 'package:the_ultimate_todo/presentation/widgets/signin_button.dart';
import 'package:the_ultimate_todo/presentation/widgets/signup_button.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 1),
        margin:
            const EdgeInsets.only(left: 15, right: 15, top: 100, bottom: 20),
        height: 625,
        width: 645,
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
              const EmailWidget(),
              const PasswordWidget(),
              const Username(),
              const SignupButton(),
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
          margin: const EdgeInsets.only(
            top: 25,
            left: 29,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(
            child: Container(
          margin: const EdgeInsets.only(top: 10, left: 5),
          height: 60,
          width: 320,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFF2D2F41),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              const BoxShadow(
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
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 14.0),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.deepPurpleAccent,
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: const TextStyle(color: Colors.white54),
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
          margin: const EdgeInsets.only(
            top: 25,
            left: 29,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(
            child: Container(
          margin: const EdgeInsets.only(top: 10, left: 5),
          height: 60,
          width: 320,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFF2D2F41),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              const BoxShadow(
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
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: const Icon(
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

class Username extends StatelessWidget {
  const Username({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 25,
            left: 29,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            'Username',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(
            child: Container(
                margin: const EdgeInsets.only(top: 10, left: 5),
                height: 60,
                width: 320,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2F41),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (Username) =>
                      context.read<SignUpCubit>().nameChanged(Username),
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.deepPurpleAccent,
                    ),
                    hintText: 'Enter your Username',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                ))),
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
        Rect.fromLTRB(0, 0, size.width, size.height),
        const Radius.circular(16)));
    var inlinebrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    canvas.drawPath(path, outlinebrush);
    canvas.drawPath(path, inlinebrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: 210,
      height: 100,
      child: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return RaisedButton(
            padding: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () =>
                context.read<SignUpCubit>().signUpWithCredentials(),
            color: Colors.blueGrey[900],
            child: const Text(
              "SIGN UP",
              style: const TextStyle(
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
