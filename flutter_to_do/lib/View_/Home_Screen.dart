import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_to_do/View_/dialog.dart';
import 'package:flutter_to_do/View_model/Todo_Provider.dart';
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
    final Todo = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 25.sp),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: Todo.todo.length,
        itemBuilder: (context, index) {
          final val = Todo.todo[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Slidable(
              key: ValueKey(val.task),
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
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: Checkbox(
                      checkColor: Colors.blue,
                      activeColor: Colors.black,
                      value: val.IsCompleted,
                      onChanged: (_) => Todo.toggle(index),
                    ),
                    title: Text(
                      val.task.toString(),
                      style: GoogleFonts.agbalumo(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        onPressed: () => dialoge(context),
        child: Icon(Icons.add, color: Colors.white, size: 20.sp),
      ),
    );
  }
}
