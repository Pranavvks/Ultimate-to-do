import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_ultimate_todo/Data/Repository/tasks_repository.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, DailyTodoState> {
  TasksBloc({
    required TasksRepository this.dailytasksrepository,
  }) : super(DailyTodoState()) {
    on<LoadEverydayTasks>((event, emit) async {
      emit(state.copyWith(status: TodoStatus.loading));
      await emit.forEach<List<DailyTasks>>(dailytasksrepository.getDailyTodos(),
          onData: (dailytasks) => state.copyWith(
                status: TodoStatus.success,
                daily_tasks: dailytasks,
              ),
          onError: (_, __) => state.copyWith(
                status: TodoStatus.failure,
              ));
    });
  }
  final TasksRepository dailytasksrepository;
}
