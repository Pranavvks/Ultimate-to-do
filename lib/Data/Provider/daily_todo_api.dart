import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

abstract class DailyTodosApi {
  BehaviorSubject<DocumentSnapshot<Map<String, dynamic>>> getDailyTasks();
  Future<void> saveDailytask(DailyTasks dailyTask);
  Future<void> CreateDailyTask(DailyTasks task);
  Future<void> deleteTodo(String id);
  Future<void> updateDailytask();
}
