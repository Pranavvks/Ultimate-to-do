import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/Data/Provider/daily_todo_api_db.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

class TasksRepository {
  const TasksRepository({
    required DailyTodoApiDb dailyTodoApiDb,
  }) : dailyTodosApiDb = dailyTodoApiDb;

  final DailyTodoApiDb dailyTodosApiDb;

  BehaviorSubject<DocumentSnapshot<Map<String, dynamic>>> getDailyTodos() =>
      dailyTodosApiDb.getDailyTasks();
  Future<void> createdDailyTodo(DailyTasks task) =>
      dailyTodosApiDb.CreateDailyTask(task);
}
