import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_ultimate_todo/services/models/tasks/categories.dart';

part 'add_task.g.dart';

@JsonSerializable()
class Tasks {
  final DateTime? daydate;
  final String id;
  final String task_title;
  final Categories category;
  final bool isCompleted;
  final DateTime deadline;
  final DateTime time;
  Tasks(
      {this.daydate,
      required this.id,
      required this.task_title,
      required this.category,
      required this.isCompleted,
      required this.deadline,
      required this.time});

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
  Map<String, dynamic> toJson() => _$TasksToJson(this);
}
