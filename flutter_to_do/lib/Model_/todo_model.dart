import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? id;

  @HiveField(2)
  bool? incomplete;

  TodoModel({this.title, this.id, this.incomplete = false});
}
