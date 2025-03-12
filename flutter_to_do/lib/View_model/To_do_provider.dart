import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Route_name.dart';
import 'package:flutter_to_do/Model_/TodoModel.dart';

import 'package:hive_flutter/adapters.dart';

class ToDoProvider with ChangeNotifier {
  //for loader function
  //define the getter for loading
  bool _isloading = false;
  bool get isloading => _isloading;

  //set the loader
  void set_loading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  //for splash screen time
  void splash(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteName.home);
    });
  }

  //splash load
  void splash_load(BuildContext context) {
    set_loading(true);
    splash(context);
    set_loading(false);
  }

  late Box<TodoModel> _todoBox;

  ToDoProvider() {
    _todoBox = Hive.box<TodoModel>('TODO'); // Ensure box is opened
  }

  List<TodoModel> get todos => _todoBox.values.toList();

  void addTask(String task) {
    _todoBox.add(TodoModel(task: task));
    notifyListeners();
  }

  void toggleTask(int index) {
    TodoModel todo = _todoBox.getAt(index)!;
    _todoBox.putAt(
      index,
      TodoModel(task: todo.task, iscompleted: !todo.iscompleted!),
    );
    notifyListeners();
  }

  void deleteTask(int index) {
    _todoBox.deleteAt(index);
    notifyListeners();
  }
}
