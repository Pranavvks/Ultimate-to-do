import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_ultimate_todo/presentation/screens/home_screen_redesign.dart';
import '../presentation/screens/login_screen.dart';
import 'Data/Repository/tasks_repository.dart';
import 'business_logic/cubits/login/cubit/bloc/tasks_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (buildcontext) {
        return HomePage();
      }),
    ),
  );
}
