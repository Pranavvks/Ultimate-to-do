import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_task.g.dart';

@JsonSerializable()
class Tasks extends Equatable {
  final String? id;
  final String? task_title;
  final String? category_name;
  final bool? isCompleted;
  final String? deadline;
  final String? time;
  Tasks(
      {this.id,
      this.task_title,
      this.category_name,
      this.isCompleted = false,
      this.deadline,
      this.time});

  Tasks copyWith(
          {String? id,
          String? task_tile,
          bool? isCompleted,
          String? deadline,
          String? time}) =>
      Tasks(
          id: id ?? this.id,
          task_title: task_tile ?? this.task_title,
          category_name: category_name ?? this.category_name,
          isCompleted: isCompleted ?? this.isCompleted,
          deadline: deadline ?? this.deadline,
          time: time ?? this.time);

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
  Map<String, dynamic> toJson() => _$TasksToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, task_title, category_name, isCompleted, deadline, time];
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