import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_to_do/View_model/To_do_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_to_do/Model_/todo_model.dart';
// import 'package:flutter_to_do/View_model/To_do_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<ToDoProvider>(context);
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
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add, color: Colors.white, size: 30.sp),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: todoViewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = todoViewModel.todos[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Slidable(
              key: ValueKey(todo.task), // Unique key for animation
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      todoViewModel.deleteTask(index);
                    },
                    borderRadius: BorderRadius.circular(10.r),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Container(
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow.shade300,
                ),
                child: Center(
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.iscompleted,
                      onChanged: (_) => todoViewModel.toggleTask(index),
                    ),
                    title: Text(
                      todo.task.toString(),
                      style: GoogleFonts.agbalumo(fontSize: 18.sp,color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      
      
    );
    
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.purple.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("Enter the task here", textAlign: TextAlign.center),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                Provider.of<ToDoProvider>(context, listen: false)
                    .addTask(_controller.text);
                Navigator.pop(context);
              }
            },
            child: Text("Save", style: TextStyle(color: Colors.black)),
            style: ButtonStyle(
              backgroundColor:
                  // ignore: deprecated_member_use
                  MaterialStateProperty.all(Colors.yellow.shade300),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.black)),
            style: ButtonStyle(
              backgroundColor:
                  // ignore: deprecated_member_use
                  MaterialStateProperty.all(Colors.yellow.shade300),
            ),
          ),
        ],
      ),
    );
  }
}

