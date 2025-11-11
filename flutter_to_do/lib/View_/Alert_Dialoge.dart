import 'package:flutter/material.dart';
import 'package:flutter_to_do/View_model/TodoProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void Alert_dialoge(BuildContext context) {
  final TextEditingController _controller = TextEditingController();

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Center(
            child: Text(
              'Tasks',
              style: GoogleFonts.agbalumo(color: Colors.indigo),
            ),
          ),

          content: TextField(
            controller: _controller,
            style: GoogleFonts.agbalumo(color: Colors.black),

            decoration: InputDecoration(
              label: Text(
                'Enter your task here',
                style: GoogleFonts.agbalumo(color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          actions: [
            //button for save the task
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<Todoprovider>(
                    context,
                    listen: false,
                  ).add_task(_controller.text);
                  Navigator.pop(context);
                }
              },

              child: Center(
                child: Text(
                  'Save Now',
                  style: GoogleFonts.agbalumo(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),

              style: ButtonStyle(
                // ignore: deprecated_member_use
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              ),
            ),

            SizedBox(height: 10),

            //button for Cancel the task
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Center(
                child: Text(
                  'Cancel',
                  style: GoogleFonts.agbalumo(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.pinkAccent),
              ),
            ),
          ],
        ),
  );
}
