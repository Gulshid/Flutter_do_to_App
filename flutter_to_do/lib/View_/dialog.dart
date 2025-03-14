import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_to_do/View_model/Todo_Provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void dialoge(BuildContext context) {
  final TextEditingController _controller = TextEditingController();
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadowColor: Colors.grey,
          title: Text(
            'Tasks',
            style: GoogleFonts.agbalumo(color: Colors.indigo, fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),

          content: TextField(
            style: GoogleFonts.agbalumo(color: Colors.black),
            controller: _controller,
            decoration: InputDecoration(
              label: Text('Enter your task here'),
              labelStyle: GoogleFonts.agbalumo(
                color: Colors.black,
                fontSize: 15.sp,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          actions: [
            //Textbutton for save task
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<TodoProvider>(
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
                    fontSize: 15.sp,
                  ),
                ),
              ),

              style: ButtonStyle(
                // ignore: deprecated_member_use
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange)
              ),
            ),

            //Textbutton for cancel task
            TextButton(
              onPressed:()=> Navigator.pop(context),
              child: Center(child: Text('Cancel',style:GoogleFonts.agbalumo(color: Colors.white,fontSize: 15.sp)),
              ),
              // ignore: deprecated_member_use
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink)),)
          ],
        ),
  );
}
