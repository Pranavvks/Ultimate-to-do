import 'dart:convert';
import 'package:the_ultimate_todo/Data/Provider/provider.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

class TasksRepository {
  @override
  late final DailyTaskProvider dailyTaskProvider;
  Future<List<DailyTasks>> getdailyTasks() async {
    final data = await dailyTaskProvider.getTasks();
    var tasks = data.docs;
    var jsondata = json.decode(tasks.map((e) => e.get("Tasks")).toString());
    List<DailyTasks> taskitems = [];
    taskitems.add(DailyTasks.fromJson(jsondata));
    return taskitems;
  }
}


//   var taskitems = dailyTaskProvider.docs ;
    // var data = json.decode(taskitems.map((e) => e.get("Tasks")).toString());
    // List<Tasks> tasks = [];
    // tasks.add(Tasks.fromJson(data));
    // return tasks;
