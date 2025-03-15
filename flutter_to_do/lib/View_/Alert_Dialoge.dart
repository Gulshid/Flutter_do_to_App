import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                borderRadius: BorderRadius.circular(8.r),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
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

              child: Center(child: Text('Save Now', style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 15.sp),)),

              style: ButtonStyle(
                // ignore: deprecated_member_use
                backgroundColor:MaterialStateProperty.all(Colors.deepOrange),
              ),
            ),


            //button for Cancel the task
          TextButton(
          onPressed: ()=>Navigator.pop(context),
          child: Center(child: Text('Cancel', style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 15.sp), 
          ),),
          // ignore: deprecated_member_use
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
          )

          
          ],
        ),
  );
}
