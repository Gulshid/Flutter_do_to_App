import 'package:hive_flutter/adapters.dart';
part 'Todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String? task;

  @HiveField(1)
  bool? IsCompleted;

  TodoModel({required this.task, this.IsCompleted = false});
}
