import 'package:flutter/material.dart';
import 'package:flutter_to_do/Data/Utills/Route/RoutesName.dart';
import 'package:flutter_to_do/View_/Home_Screen.dart';
import 'package:flutter_to_do/View_/Splash_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.Splash:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen(),
          );
        }

      case Routesname.Home:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          );
        }

      default:
        return MaterialPageRoute(
          builder:
              (BuildContext context) =>
                  Scaffold(body: Center(child: Text('No Route Available '))),
        );
    }
  }
}
