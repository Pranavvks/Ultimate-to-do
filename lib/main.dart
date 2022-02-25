import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_ultimate_todo/Data/Provider/daily_todo_api_db.dart';
import 'package:the_ultimate_todo/presentation/screens/home_screen_redesign.dart';
import 'package:the_ultimate_todo/presentation/screens/login_screen.dart';
import 'package:the_ultimate_todo/presentation/screens/signup_screen.dart';
// import 'package:the_ultimate_todo/presentation/screens/login_screen.dart';
import 'Data/Repository/tasks_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    RepositoryProvider(
      create: (context) => TasksRepository(
        dailyTodoApiDb: DailyTodoApiDb(),
      ),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SignUp()),
    ),
  );
}
