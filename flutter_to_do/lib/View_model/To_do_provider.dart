import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Route_name.dart';
import 'package:flutter_to_do/Model_/todo_model.dart';
import 'package:hive_flutter/adapters.dart';

class ToDoProvider with ChangeNotifier {
  //for loader function
  bool _isloading = false;
  bool get isloading => _isloading;

  //set the loader
  void set_loading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  //for splash screen time
  void splash(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, RouteName.Home_Screen);
    });
  }

  //splash load
  void splash_load(BuildContext context) {
    set_loading(true);
    splash(context);
    set_loading(false);
  }

  late Box<TodoModel> Todo_box;
  ToDoViewModel() {
    Todo_box = Hive.box('TODO');
    loadToDoList();
  }

  List<TodoModel> _ToDoList = [];
  List<TodoModel> get ToDoList => _ToDoList;

  void loadToDoList() {
    _ToDoList = Todo_box.values.toList();
    notifyListeners();
  }

  void add_Todo(TodoModel todo) {
    Todo_box.add(todo);
    loadToDoList();
  }

  void remove_todo(int index) {
    Todo_box.deleteAt(index);
    loadToDoList();
  }

  void toggle_todo_Completion(int index) {
    var todo = Todo_box.getAt(index);
    if (todo == null) {
      todo?.incomplete = !todo.incomplete!;
      todo?.save();
      loadToDoList();
    }
  }
}
