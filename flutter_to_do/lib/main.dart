import 'package:flutter/material.dart';
import 'package:flutter_to_do/Data/Utills/Route/Routes.dart';
import 'package:flutter_to_do/Data/Utills/Route/RoutesName.dart';
import 'package:flutter_to_do/Model_/Todo_model.dart';
import 'package:flutter_to_do/View_model/TodoProvider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  // Hive local Database
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('TODO');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Todoprovider())],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'To do App',
            theme: ThemeData(
              applyElevationOverlayColor: true,
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(color: Colors.deepPurple),
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(),
            ),
            initialRoute: Routesname.Splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
