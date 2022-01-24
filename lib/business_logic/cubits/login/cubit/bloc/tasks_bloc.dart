import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_ultimate_todo/services/models/tasks/add_task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksLoadingState()) {
    on<TasksEvent>((event, emit) {
      @override
      Stream<TasksState> mapEventToState(TasksEvent event) async* {}
    });
  }
}
