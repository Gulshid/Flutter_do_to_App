import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Route_name.dart';
import 'package:flutter_to_do/View_/Home_Screen.dart';
import 'package:flutter_to_do/View_/Splash_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.Splash_Screen:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen(),
          );
        }
      case RouteName.Home_Screen:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ),
          );
        }
    }
  }
}
