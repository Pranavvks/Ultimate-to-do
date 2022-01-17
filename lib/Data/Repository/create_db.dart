import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      "task_title": "Meeting with Dev team",
      "isCompleted": false,
    },
    {
      "task_title": "Meeting with design team",
      "isCompleted": false,
    },
    {
      "task_title": "Meeting with design team",
      "isCompleted": false,
    }
  ]);
  await _db
      .collection("Daily_tasks")
      .doc()
      .set({"_id": user.currentUser!.uid, "Tasks": tasks[0]});
  getTasks(user);
}

Future<void> getTasks(FirebaseAuth user) async {
  var querySnapshot = await _db
      .collection("Daily_tasks")
      .where('_id', isEqualTo: user.currentUser!.uid)
      .get();
  var taskitems = querySnapshot.docs;
  var x = taskitems.map((e) => print(e.get("Tasks")));
}
