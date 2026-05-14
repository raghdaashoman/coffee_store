import 'package:flutter/material.dart' show ThemeData, TextTheme, Colors, TextStyle;

class AppThemeText {
  static TextTheme textTheme = TextTheme( bodyLarge: TextStyle(
      color: Colors.red,
      fontSize: 50
  ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ));
}