// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['id'] as int,
      category_name: json['category_name'] as String,
      task_list: (json['task_list'] as List<dynamic>)
          .map((e) => Tasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.category_name,
      'task_list': instance.task_list,
    };
