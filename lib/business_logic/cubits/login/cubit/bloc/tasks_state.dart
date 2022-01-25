part of 'tasks_bloc.dart';

enum TodoStatus { initial, loading, success, failure }

class DailyTodoState extends Equatable {
  DailyTodoState({
    this.status = TodoStatus.initial,
    this.daily_tasks = const [],
  });

  final TodoStatus status;
  final List<DailyTasks> daily_tasks;

  DailyTodoState copyWith({
    TodoStatus? status,
    List<DailyTasks>? daily_tasks,
  }) {
    return DailyTodoState(
      status: status ?? this.status,
      daily_tasks: daily_tasks ?? this.daily_tasks,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, daily_tasks];
}
