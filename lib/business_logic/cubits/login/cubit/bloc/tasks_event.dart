part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {}

class LoadEverydayTasks extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class EveryDayTaskCompleted extends TasksEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateEveryDayTask extends TasksEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteEveryDayTask extends TasksEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
