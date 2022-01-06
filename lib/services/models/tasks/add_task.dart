import 'package:flutter/foundation.dart';
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

/*
id : 1 ,
task_title : Fluttering ,
time : 09 : 00 ,
date : 23/09/21
category : 
{
  id : 10xxf
  type : Productivity,
}
[{id : 1 , }] // I need to create a new list for each of the separate 

Set<Category>.add(category).if(category.id != set.contains(categoryid))
{id : 10xxf , type : Productivity} // This must also hold all the details 
of the class task , for that maybe we could store the 
task_id 
*/