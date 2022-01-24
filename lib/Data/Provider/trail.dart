import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

var user = FirebaseAuth.instance.currentUser;
final _db = FirebaseFirestore.instance;

StreamController<DailyTasks> controller = StreamController<DailyTasks>();
Stream<DailyTasks> stream = controller.stream;
// this is a stream



