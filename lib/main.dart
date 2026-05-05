import 'package:drinkable/features/home/pages/home_screen.dart';
import 'package:drinkable/features/home/pages/homedetails_page.dart';
import 'package:drinkable/features/splash/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: Size(375, 812),builder: (context, child) {
         return MaterialApp(
             debugShowCheckedModeBanner: false,
           routes: {
               '/':(context)=>SplashScreen(),
                '/home': (context)=>HomeScreen(),
               '/home details' : (context)=>HomedetailsPage(),
           },
         );
       },
    );
  }
}
