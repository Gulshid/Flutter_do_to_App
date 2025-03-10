import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_to_do/Model_/todo_model.dart';
import 'package:flutter_to_do/View_model/To_do_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        onPressed: () {
          final new_todo = TodoModel(
            id: DateTime.now().toString(),
            title: 'New TODO',
          );
          context.read<ToDoProvider>().add_Todo(new_todo);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30.sp),
      ),
      body: Consumer<ToDoProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.ToDoList.length,
            itemBuilder: (context, index) {
              final toDo = value.ToDoList[index];
              return ListTile(
                title: Text(toDo.title.toString()),
                trailing: Checkbox(
                  value: toDo.incomplete,
                  onChanged: (Value) {
                    value.toggle_todo_Completion(index);
                  },
                ),
                onLongPress: () {
                  value.remove_todo(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
