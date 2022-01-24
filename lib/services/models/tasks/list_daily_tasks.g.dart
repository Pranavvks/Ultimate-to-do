// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_daily_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTasksList _$DailyTasksListFromJson(Map<String, dynamic> json) =>
    DailyTasksList(
      dailytasklist: (json['dailytasklist'] as List<dynamic>)
          .map((e) => DailyTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyTasksListToJson(DailyTasksList instance) =>
    <String, dynamic>{
      'dailytasklist': instance.dailytasklist,
    };
