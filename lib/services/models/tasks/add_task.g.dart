// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      daydate: json['daydate'] == null
          ? null
          : DateTime.parse(json['daydate'] as String),
      id: json['id'] as String,
      task_title: json['task_title'] as String,
      category: Categories.fromJson(json['category'] as Map<String, dynamic>),
      isCompleted: json['isCompleted'] as bool,
      deadline: DateTime.parse(json['deadline'] as String),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'daydate': instance.daydate?.toIso8601String(),
      'id': instance.id,
      'task_title': instance.task_title,
      'category': instance.category,
      'isCompleted': instance.isCompleted,
      'deadline': instance.deadline.toIso8601String(),
      'time': instance.time.toIso8601String(),
    };
