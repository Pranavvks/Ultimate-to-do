part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksInitialState extends TasksState {}

class TasksLoadingState extends TasksState {}

class TasksLoadedState extends TasksState {
  List<Tasks> tasks;
  TasksLoadedState({required this.tasks});
}

class TasksErrorState extends TasksState {
  String message;
  TasksErrorState({required this.message});
}
