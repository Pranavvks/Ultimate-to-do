import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

abstract class DailyTodosApi {
  Stream<Future<List<Iterable<DailyTasks>>>> getDailyTasks();
  Future<void> saveDailytask(DailyTasks dailyTask);
  Future<void> deleteTodo(String id);
  Future<void> updateDailytask();
}
