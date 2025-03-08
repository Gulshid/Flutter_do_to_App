import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


void main() async {
  //Hive database initialization
  await Hive.initFlutter();
  var box = await Hive.openBox('TO_DO');
  Hive.init(box.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
      return MultiProvider(
          providers: [
            // ChangeNotifierProvider(create: (_) => ()),

          ],

          child: Builder(
            builder: (BuildContext context) {
          
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter To do App',
                theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.blue),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),

                
                // home:HomeScreen(),
                // initialRoute:RouteName.login,
                // onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}