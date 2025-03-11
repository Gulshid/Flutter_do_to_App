import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Route_name.dart';
import 'package:flutter_to_do/Data/Utills/Routes/Routes.dart';
import 'package:flutter_to_do/Model_/TodoModel.dart';
import 'package:flutter_to_do/View_model/To_do_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

void main() async {
  //Hive local Database
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(TodoModelAdapter());
  // await Hive.openBox<TodoModel>('TODO');
  await Hive.initFlutter();
  var box = await Hive.openBox('TO_DO');
  Hive.init(box.path);
  Hive.registerAdapter(TodoModelAdapter());

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
          providers: [ChangeNotifierProvider(create: (_) => ToDoProvider())],

          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter To do App',
                theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.deepPurple),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),

                // home:hello(),
                initialRoute: RouteName.Home_Screen,
                onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
