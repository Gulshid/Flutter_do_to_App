import 'package:flutter/material.dart';
import 'package:flutter_to_do/Data/Utills/Route/RoutesName.dart';
import 'package:flutter_to_do/Model_/Todo_model.dart';
import 'package:hive/hive.dart';

class Todoprovider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set_loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void splash(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routesname.Home);
    });
  }

  void splash_load(BuildContext context) {
    set_loading(true);
    splash(context);
    set_loading(false);
  }

  late Box<TodoModel> _todo;
  Todoprovider() {
    _todo = Hive.box<TodoModel>('Todo');
  }

  List<TodoModel> get todo => _todo.values.toList();

  //function for add the task
  void add_task(String task) {
    _todo.add(TodoModel(task: task));
    notifyListeners();
  }

  //function for toggle update
  void toggle(int index) {
    TodoModel t = _todo.getAt(index)!;
    _todo.putAt(index, TodoModel(task: t.task, IsCompleted: !t.IsCompleted!));
    notifyListeners();
  }

  //function for delete task
  void delete_task(int index) {
    _todo.deleteAt(index);
    notifyListeners();
  }
}
