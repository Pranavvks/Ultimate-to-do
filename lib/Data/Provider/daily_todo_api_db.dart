import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

import './daily_todo_api.dart';

class DailyTodoApiDb extends DailyTodosApi {
  final todoStreamController =
      BehaviorSubject<List<DailyTasks>>.seeded(const []);

  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;

  @override
  Stream<List<DailyTasks>> getDailyTasks() {
    List<DailyTasks> x = [];

    final todoStreamController =
        BehaviorSubject<List<DailyTasks>>.seeded(const []);

    var querySnapshot = Future.delayed(Duration(milliseconds: 500));
    db
        .collection("Daily_tasks")
        .where('_id', isEqualTo: user!.uid)
        .snapshots()
        .listen((snapshot) {
      snapshot.docs.forEach((doc) {
        var data = doc.get("Tasks");
        for (var individual_tasks in data) {
          DailyTasks object = DailyTasks.fromJson(individual_tasks);
          x.add(object);
        }
      });
      todoStreamController.add(x);
      print(todoStreamController.value);
    });
    return todoStreamController.asBroadcastStream();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<void> saveDailytask(DailyTasks dailyTask) {
    // TODO: implement saveDailytask
    throw UnimplementedError();
  }

  @override
  Future<void> updateDailytask() {
    // TODO: implement updateDailytask
    throw UnimplementedError();
  }
}



  //   Stream<QuerySnapshot> stream = db.collection('Daily_tasks').snapshots();

  //   var y = [];

  //   var x = stream.map((data) => data.docs.map((doc) => DailyTasks(
  //       task_title: doc.get("task_title"),
  //       description: doc.get("description"),
  //       id: doc.get("id"),
  //       isCompleted: doc.get("isCompleted"))));