import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_to_do/View_/Alert_Dialoge.dart';
import 'package:flutter_to_do/Model_/Todo_model.dart';
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
          'To-Do App',
          style: GoogleFonts.agbalumo(color: Colors.white),
        ),
        centerTitle: true,
      ),

      backgroundColor: Colors.deepPurple[200],
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use a GridView for wider screens (tablets, web)
          if (constraints.maxWidth > 600) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: Todo.todo.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400, // Max width for each item
                childAspectRatio: 4 / 1, // Adjust for desired item height
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final todo = Todo.todo[index];
                return _TodoItem(todo: todo, index: index);
              },
            );
          } else {
            // Use a ListView for narrower screens (mobile)
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: Todo.todo.length,
              itemBuilder: (context, index) {
                final todo = Todo.todo[index];
                return _TodoItem(todo: todo, index: index);
              },
            );
          }
        },
      ),

      //floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        onPressed: () => Alert_dialoge(context),
        child: const Icon(Icons.add, color: Colors.white, size: 20),
      ),
    );
  }
}

class _TodoItem extends StatelessWidget {
  const _TodoItem({required this.todo, required this.index});

  final TodoModel todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<Todoprovider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Slidable(
        key: ValueKey(todo.task),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => Alert_dialoge(context),
              icon: Icons.add,
              backgroundColor: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(8),
              label: 'Add Task',
              foregroundColor: Colors.white,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                todoProvider.delete_task(index);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              foregroundColor: Colors.white,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple,
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 6.0, spreadRadius: 3),
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
                  todoProvider.toggle(index);
                },
              ),
              title: Text(
                todo.task.toString(),
                style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
