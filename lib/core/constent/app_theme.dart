import 'package:drinkable/core/constent/app_color.dart';
import 'package:drinkable/core/constent/app_theme_text.dart';
import 'package:flutter/material.dart';

class AppTheme {

   static ThemeData light =ThemeData(
     textTheme: AppThemeText.textTheme,
     scaffoldBackgroundColor: Colors.black,
   );
   static ThemeData dark =ThemeData(
     scaffoldBackgroundColor: Colors.white
   );

}