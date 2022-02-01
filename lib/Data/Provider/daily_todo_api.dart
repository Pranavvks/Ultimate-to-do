import 'package:rxdart/rxdart.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

abstract class DailyTodosApi {
  Stream<List<DailyTasks>> getDailyTasks();
  Future<void> saveDailytask(DailyTasks dailyTask);
  Future<void> CreateDailyTask(DailyTasks task);
  Future<void> deleteTodo(String id);
  Future<void> updateDailytask();
}
