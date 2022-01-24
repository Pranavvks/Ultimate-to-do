import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

var user = FirebaseAuth.instance.currentUser;
final _db = FirebaseFirestore.instance;

class DailyTaskProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getTasks() async {
    var querySnapshot = await _db
        .collection("Daily_tasks")
        .where('_id', isEqualTo: user!.uid)
        .get();

    return querySnapshot;
  }
}
