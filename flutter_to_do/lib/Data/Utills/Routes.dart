import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Data/Utills/Route_name.dart';
import 'package:flutter_to_do/View_/Home_Screen.dart';
import 'package:flutter_to_do/View_/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Route_name.splash:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => Splash_Screen(),
          );
        }

      case Route_name.home:
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
                  body: Center(child: Text('No Route Available...')),
                ),
          );
        }
    }
  }
}
