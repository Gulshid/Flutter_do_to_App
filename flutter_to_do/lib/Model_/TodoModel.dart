import 'package:hive/hive.dart';
part 'TodoModel.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String? Task;

  @HiveField(1)
  bool? iscomplete;

  TodoModel({required this.Task, this.iscomplete = false});
}
