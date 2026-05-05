import 'package:drinkable/core/constent/app_color.dart';
import 'package:drinkable/core/constent/app_image.dart';
import 'package:drinkable/core/constent/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
       goNext();
  }
  void goNext()async{
   await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
       children: [
         Image.asset('assets/images/splash/splash.png',fit: BoxFit.cover,),
         Positioned(
           left: 104.w,
           top: 184.h,
             child:
         Column(
           children: [
             Text(AppStrings.drinkable,style: TextStyle(
               fontFamily: 'Poppins',
                 fontSize:32.sp,
               fontWeight: FontWeight.bold,
               color: AppColor.secondary,
             ),),
             Text(AppStrings.second,style: TextStyle(
               fontFamily: 'Poppins',
               fontSize:24.sp,
               color: AppColor.secondary,
             ),),
           ],

         ))
       ],
      ),
    );
  }
}
