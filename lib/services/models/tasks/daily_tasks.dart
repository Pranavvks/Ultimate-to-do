import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class DailyTasks extends Equatable {
  final String id;
  final String task_title;
  final String description;
  final bool isCompleted;

  DailyTasks({
    String? id,
    required this.task_title,
    this.description = '',
    this.isCompleted = false,
  })  : assert(id!.isNotEmpty),
        id = id ?? const Uuid().v4();

  DailyTasks copyWith({
    String? task_title,
    bool? isCompleted,
    String? description,
  }) {
    return DailyTasks(
      id: this.id,
      task_title: task_title ?? this.task_title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory DailyTasks.fromJson(Map<String, dynamic> parsedJson) {
    return DailyTasks(
      id: parsedJson['id'],
      description: parsedJson['description'],
      task_title: parsedJson['task_title'],
      isCompleted: parsedJson['isCompleted'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'task_title': task_title,
        'isCompleted': isCompleted,
      };

  @override
  List<Object> get props => [task_title, isCompleted, description, isCompleted];
}
