import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/Data/Provider/daily_todo_api.dart';
import 'package:the_ultimate_todo/Data/Provider/daily_todo_api_db.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';
import 'package:uuid/uuid.dart';

final _db = FirebaseFirestore.instance;

Future<void> createUserInDatabase(FirebaseAuth user) async {
  await _db.collection("USERS_COLLECTION").doc(user.currentUser!.uid).set({
    "NAME_FIELD": user.currentUser?.displayName,
    "EMAIL_FIELD": user.currentUser?.email,
  });
  createDailyTasks(user);
}

Future<void> createDailyTasks(FirebaseAuth user) async {
  List<List<Map>> tasks = [];
  tasks.add([
    {
      "description": "Agenda to complete Flutter project",
      "task_title": "Meeting with Dev team",
      "isCompleted": false,
      "id": Uuid().v4(),
    },
    {
      "description": "Agenda to complete Flutter project",
      "task_title": "Meeting with design team",
      "isCompleted": false,
      "id": Uuid().v4(),
    },
    {
      "description": "Agenda to complete Flutter project",
      "task_title": "Meeting with design team",
      "isCompleted": false,
      "id": Uuid().v4(),
    }
  ]);
  await _db
      .collection("Daily_tasks")
      .doc()
      .set({"_id": user.currentUser!.uid, "Tasks": tasks[0]});

  // getTasks(user);
}
