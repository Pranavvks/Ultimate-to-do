import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

import './daily_todo_api.dart';

class DailyTodoApiDb extends DailyTodosApi {
  final todoStreamController =
      BehaviorSubject<DocumentSnapshot<Map<String, dynamic>>>();

  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;
  List<DailyTasks> x = [];
  // late StreamController<QuerySnapshot<Map<String, dynamic>>>
  //     todostreamcontroller;

  @override
  BehaviorSubject<DocumentSnapshot<Map<String, dynamic>>> getDailyTasks() {
    var stream = db.collection("Daily_tasks").doc(user!.uid).snapshots();

    (stream.listen((event) {
      print(event.data());
    }));

    todoStreamController.sink.addStream(stream);

    return todoStreamController;
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

  @override
  Future<void> CreateDailyTask(DailyTasks task) async {
    var increment = await db
        .collection("Daily_tasks")
        .doc(user!.uid)
        .collection("Todo-count")
        .doc(user!.uid)
        .update({"count": FieldValue.increment(1)}).onError((_, __) async =>
            await db
                .collection("Daily_tasks")
                .doc(user!.uid)
                .collection("Todo-count")
                .doc(user!.uid)
                .set({"count": FieldValue.increment(1)}));

    var response;

    var doc = await db
        .collection("Daily_tasks")
        .doc(user!.uid)
        .collection("Todo-count")
        .where("count", isGreaterThanOrEqualTo: 1)
        .get()
        .then((value) => value.docs.forEach((element) {
              response = element.data();
            }));

    int count = response["count"];

    if (count == 1) {
      await db.collection("Daily_tasks").doc(user!.uid).set({
        "_id": user!.uid,
        "Tasks": [
          {
            "id": task.id,
            "task_title": task.task_title,
            "description": "",
            "isCompleted": false,
          }
        ]
      });
    } else {
      var x = [
        {
          "id": task.id,
          "task_title": task.task_title,
          "description": "",
          "isCompleted": false,
        }
      ];

      await db
          .collection("Daily_tasks")
          .doc(user!.uid)
          .update({"Tasks": FieldValue.arrayUnion(x)});
    }
  }
}



  //   Stream<QuerySnapshot> stream = db.collection('Daily_tasks').snapshots();

  //   var y = [];

  //   var x = stream.map((data) => data.docs.map((doc) => DailyTasks(
  //       task_title: doc.get("task_title"),
  //       description: doc.get("description"),
  //       id: doc.get("id"),
  //       isCompleted: doc.get("isCompleted"))));