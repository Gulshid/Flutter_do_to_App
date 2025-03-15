import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_to_do/View_/Alert_Dialoge.dart';
import 'package:flutter_to_do/View_model/TodoProvider.dart';
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
    final Todo = Provider.of<Todoprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: GoogleFonts.agbalumo(color: Colors.white),
        ),
        centerTitle: true,
      ),

      backgroundColor: Colors.deepPurple[200],
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: Todo.todo.length,
        itemBuilder: (context, index) {
          final todo = Todo.todo[index];
          return Padding(
            padding: EdgeInsets.all(8),
            child: Slidable(
              key: ValueKey(todo.task),

              startActionPane: ActionPane(motion:StretchMotion(),
              children: [
                SlidableAction(onPressed: (context) => Alert_dialoge(context),
                icon: Icons.add,
                backgroundColor: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(8.r),
                label: 'Add Task',
                foregroundColor: Colors.white,
                )
              ]),
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      Todo.delete_task(index);
                    },
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    borderRadius: BorderRadius.circular(8.r),
                    foregroundColor: Colors.white,
                    label: 'Delete',
                  ),
                ],
              ),

              child: Container(
                height: 75.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.deepPurple,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6.0,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: Checkbox(
                      focusColor: Colors.deepOrange,
                      hoverColor: Colors.indigo,
                      checkColor: Colors.blue,
                      activeColor: Colors.black,
                      mouseCursor: SystemMouseCursors.grab,
                      value: todo.IsCompleted,
                      onChanged: (bool? value) {
                        print('the checkbox is changed$value');
                        Todo.toggle(index);
                      },
                    ),
                    title: Text(
                      todo.task.toString(),
                      style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),

      //floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),

        onPressed: () => Alert_dialoge(context),
        child: Icon(Icons.add, color: Colors.white, size: 20.sp),
      ),
    );
  }
}
