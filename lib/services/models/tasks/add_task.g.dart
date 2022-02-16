// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: json['id'] as String?,
      task_title: json['task_title'] as String?,
      category_name: json['category_name'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      time: json['time'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'id': instance.id,
      'task_title': instance.task_title,
      'category_name': instance.category_name,
      'isCompleted': instance.isCompleted,
      'deadline': instance.deadline?.toIso8601String(),
      'time': instance.time,
      'date': instance.date,
    };
