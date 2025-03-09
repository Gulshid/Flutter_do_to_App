import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Route_name.dart';

class ToDoProvider with ChangeNotifier {
  void splash(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
    Navigator.pushReplacementNamed(context , RouteName.Home_Screen);
    });
  }
}
