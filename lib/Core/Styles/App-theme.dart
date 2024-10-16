import 'package:flutter/material.dart';
import 'package:newsapp/Core/Utiels/Constant_colors.dart';

class Apptheme {
  static final ThemeData themelight = ThemeData(
    primaryColor: lightCardColor,
    scaffoldBackgroundColor: lightScaffoldColor,
    textSelectionTheme:const TextSelectionThemeData(
      selectionColor: Colors.blue,
      cursorColor: Colors.black,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
      secondary: lightIconsColor,
      brightness: Brightness.light,
    ),
    appBarTheme:const AppBarTheme(
    backgroundColor: Colors.white, // خلفية AppBar
    iconTheme: IconThemeData(color: Colors.black), // لون الأيقونات
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // لون النص
    elevation: 4, // ظل AppBar
  ),
   iconTheme: const IconThemeData(color: Colors.black),
  textTheme:const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),  // Text color for main body text
      bodyMedium: TextStyle(color: Colors.black87), // Slightly different shade
      displayLarge: TextStyle(color: Colors.black),  // Headline color
      titleLarge: TextStyle(color: Colors.black54), // Subtitle or smaller headlines
    ),
    brightness: Brightness.light,
    cardColor: lightCardColor,
    hintColor: Colors.grey.shade700,
  );

  static final ThemeData themedark = ThemeData(
    primaryColor: darkCardColor,
    scaffoldBackgroundColor: darkScaffoldColor,
    textSelectionTheme:const TextSelectionThemeData(
      selectionColor: Colors.blue,
      cursorColor: Colors.white,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
      secondary: darkIconsColor,
      brightness: Brightness.dark,
    ),
      iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
    backgroundColor: darkScaffoldColor, // خلفية AppBar للوضع المظلم
    iconTheme: IconThemeData(color:darkIconsColor ), // لون الأيقونات
    titleTextStyle:const TextStyle(color: Colors.white, fontSize: 20), // لون النص
    elevation: 4, // ظل AppBar
  ),
  textTheme:const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),  // Text color for main body text
      bodyMedium: TextStyle(color: Colors.white70), // Slightly different shade
      displayLarge: TextStyle(color: Colors.white),  // Headline color
      titleLarge: TextStyle(color: Colors.white60), // Subtitle or smaller headlines
    ),
    brightness: Brightness.dark,
    cardColor: darkCardColor,
    hintColor: Colors.grey.shade400,
  );
}

