import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

part 'list_daily_tasks.g.dart';

@JsonSerializable()
class DailyTasksList extends Equatable {
  List<DailyTasks> dailytasklist;
  DailyTasksList({required this.dailytasklist});

  factory DailyTasksList.fromJson(Map<String, dynamic> json) =>
      _$DailyTasksListFromJson(json);
  Map<String, dynamic> toJson() => _$DailyTasksListToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [dailytasklist];
}
