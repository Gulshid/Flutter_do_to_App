import 'package:hive/hive.dart';
part 'TodoModel.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String? task;

  @HiveField(1)
  bool? iscompleted;

  TodoModel({required this.task, this.iscompleted = false});
}
