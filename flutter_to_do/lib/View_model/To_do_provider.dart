import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Route_name.dart';

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
}
