import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_ultimate_todo/Data/Repository/tasks_repository.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, DisplayTodoState> {
  final TasksRepository dailytasksrepository;

  TasksBloc({
    required TasksRepository this.dailytasksrepository,
  }) : super(DisplayTodoState()) {
    // on<LoadEverydayTasks>((event, emit) async {
    //   emit(state.copyWith(status: TodoStatus.loading));
    //   await emit.forEach<List<DailyTasks>>(dailytasksrepository.getDailyTodos(),
    //       onData: (dailytasks) => state.copyWith(
    //             status: TodoStatus.success,
    //             daily_tasks: dailytasks,
    //           ),
    //       onError: (_, __) => state.copyWith(
    //             status: TodoStatus.failure,
    //           ));
    // });
    on<LoadEverydayTasks>((event, emit) async {
      emit(state.copyWith(status: TodoStatus.loading));
      var x = await dailytasksrepository.getDailyTodos();
      emit(state.copyWith(daily_tasks: x));
    });

    on<CreateEverydayTasks>(_CreateTodo);
  }
  Future<void> _CreateTodo(
    CreateEverydayTasks event,
    Emitter<DisplayTodoState> emit,
  ) async {
    var x = await dailytasksrepository.createdDailyTodo(event.task);
    if (state.status == TodoStatus.success) {
      // add(LoadEverydayTasks());
    }
  }
}       
  

  




/*
 emit.forEach<List<DailyTasks>>(_dailytasksrepository.getDailyTodos(),
          onData: (dailytasks) => state.copyWith(
                status: TodoStatus.success,
                daily_tasks: dailytasks,
              ),
          onError: (_, __) => state.copyWith(
                status: TodoStatus.failure,
              ));
    }
*/