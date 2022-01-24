part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class LoadEverydayTasks extends TasksEvent {
  final String task_title;
  bool isCompleted;
  LoadEverydayTasks({required this.task_title, required this.isCompleted});
}

class EveryDayTaskCompleted extends TasksEvent {}

class UpdateEveryDayTask extends TasksEvent {}

class DeleteEveryDayTask extends TasksEvent {}
