import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_to_do/View_model/Todo_Provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).splash_load(context);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/app_icon.png',
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Text(
              'To Do App',
              style: GoogleFonts.agbalumo(
                fontSize: 30.sp,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SpinKitFadingCircle(color: Colors.blue, size: 60.sp),
        ],
      ),
    );
  }
}
