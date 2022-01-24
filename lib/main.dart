import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_ultimate_todo/business_logic/cubits/login/cubit/login_cubit.dart';

import 'package:the_ultimate_todo/presentation/screens/home_screen_redesign.dart';
import 'package:the_ultimate_todo/presentation/screens/signup_screen.dart';
import '../presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    ),
  );
}
