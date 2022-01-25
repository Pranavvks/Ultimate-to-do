import 'package:the_ultimate_todo/Data/Provider/daily_todo_api_db.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

class TasksRepository {
  const TasksRepository({
    required DailyTodoApiDb dailyTodoApiDb,
  }) : dailyTodosApiDb = dailyTodoApiDb;

  final DailyTodoApiDb dailyTodosApiDb;

  Stream<List<DailyTasks>> getDailyTodos() => dailyTodosApiDb.getDailyTasks();
}
