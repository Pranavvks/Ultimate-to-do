import 'package:json_annotation/json_annotation.dart';
import 'package:the_ultimate_todo/services/models/tasks/add_task.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  int id;
  String category_name;
  List<Tasks> task_list;

  Categories({
    required this.id,
    required this.category_name,
    required this.task_list,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

List<Categories> categories = [
  Categories(id: 1, category_name: "Business", task_list: []),
  Categories(id: 2, category_name: "Academics", task_list: []),
  Categories(id: 3, category_name: "Personal", task_list: []),
  Categories(id: 4, category_name: "Fitness", task_list: []),
  Categories(id: 5, category_name: "No category", task_list: []),
];
