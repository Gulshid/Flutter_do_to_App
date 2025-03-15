import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_to_do/View_model/TodoProvider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Todoprovider>(context, listen: false).splash_load(context);
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
            child: Image.asset('assets/app_icon.png',width: 100.w, height: 100.h, fit: BoxFit.fill,),
          ),


          
          Center(
            child: Text('To Do App',
              style: GoogleFonts.agbalumo(fontSize: 30.sp, color: Colors.blue,  fontWeight: FontWeight.bold),),
          ),

          SpinKitCircle(color: Colors.blue, size: 60.sp,),

        ],
      ),
    );
  }
}
