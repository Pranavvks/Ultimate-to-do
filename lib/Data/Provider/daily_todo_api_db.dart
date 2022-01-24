import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

import './daily_todo_api.dart';

class DailyTodoApi {
  DailyTodoApi();

  var user;
  var db;
  var ref;
  var listitems;

  final _todoStreamController =
      BehaviorSubject<List<DailyTasks>>.seeded(const []);
  final todonormalStreamController =
      StreamController<List<DailyTasks>>().add(const []);

  BehaviorSubject<List<DailyTasks>> get todoStreamController {
    return _todoStreamController;
  }

  Future<void> init() async {
    user = FirebaseAuth.instance;
    db = FirebaseFirestore.instance;
    var alltasks;
    var singletask;

    var ref = await db
        .collection("Daily_Tasks")
        .where('_id', isEqualTo: user.currentUser!.uid)
        .snapshots();

    var data = ref.map((e) => {
          alltasks = e.docs.get("Tasks"),
          singletask = DailyTasks.fromJson(singletask),
          _todoStreamController.add(singletask),
        });
  }
}

class DailyTodoApiDb extends DailyTodosApi {
  Stream<Future<List<Iterable<DailyTasks>>>> getDailyTasks() async* {
    throw UnimplementedError();
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