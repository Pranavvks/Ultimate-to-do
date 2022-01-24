import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_task.g.dart';

@JsonSerializable()
class Tasks extends Equatable {
  final String? id;
  final String? task_title;
  final String? category_name;
  final bool? isCompleted;
  final DateTime? deadline;
  final String? time;
  final String? date;
  Tasks({
    this.id,
    this.task_title,
    this.category_name,
    this.isCompleted = false,
    this.deadline,
    this.time,
    this.date,
  });

  Tasks copyWith(
          {String? id,
          String? task_tile,
          bool? isCompleted,
          DateTime? deadline,
          String? time}) =>
      Tasks(
          id: id ?? this.id,
          task_title: task_title ?? this.task_title,
          category_name: category_name ?? this.category_name,
          isCompleted: isCompleted ?? this.isCompleted,
          deadline: deadline ?? this.deadline,
          time: time ?? this.time,
          date: date ?? this.date);

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
  Map<String, dynamic> toJson() => _$TasksToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, task_title, category_name, isCompleted, deadline, time, date];
}
