import 'package:json_annotation/json_annotation.dart';
import 'package:the_ultimate_todo/services/models/tasks/add_task.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  int id;
  String category_name;
  // for displaying all the tasks

  Categories({
    required this.id,
    required this.category_name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

List<Categories> categories = [
  Categories(
    id: 1,
    category_name: "Business",
  ),
  Categories(
    id: 2,
    category_name: "Academics",
  ),
  Categories(
    id: 3,
    category_name: "Personal",
  ),
  Categories(
    id: 4,
    category_name: "Fitness",
  ),
  Categories(
    id: 5,
    category_name: "No category",
  ),
];
