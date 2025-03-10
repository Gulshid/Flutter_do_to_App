import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_to_do/View_model/To_do_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //call the splash load function
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ToDoProvider>(context, listen: false).splash_load(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset('assets/app_icon.png',width: 100.w,height: 100.h,fit: BoxFit.cover,),
            ),

            Center(
              child: Text('To Do App', style:GoogleFonts.agbalumo(color: Colors.blue,fontSize: 30.sp,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30.h,),
            SpinKitFadingCircle(color: Colors.blue,size: 50.sp,)
            
          ],
        ),
    
    );
  }
}
