import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/sign_up/cubit/sign_up_cubit.dart';

import 'package:the_ultimate_todo/presentation/screens/home_screen_redesign.dart';
import 'package:the_ultimate_todo/presentation/widgets/signup_widget.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            print('submission failure');
          } else if (state.status.isSubmissionSuccess) {
            var snackBar = SnackBar(
              content: Text('Authenticated as ' + state.email.toString()),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                      // userName: state.name.toString(),
                      )),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFF2D2F41),
            body: Stack(
              children: [
                Container(
                  height: 320,
                  width: 420,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Ellipse 2.png'))),
                ),
                Positioned(
                  child: Column(
                    children: [
                      Container(
                        child: SignUpWidget(),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   child: Container(
                //     child: LoginButton(),
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
