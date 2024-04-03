import 'package:flutter/material.dart';

final ThemeData weatherAppThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.blue.shade100,
  useMaterial3: true,
  // Color Scheme
  colorScheme: ColorScheme.light(
    primary: Colors.lightBlue.shade300, // Sky blue
    onPrimary: Colors.blue.shade300, // White text/icons on primary color
    secondary: Colors.yellow.shade600, // Sun color
    onSecondary: Colors.black, // Text/icons on secondary color
    background: Colors.blue.shade100, // Light grey background
    onBackground: Colors.black, // Text/icons on background
    surface: Colors.blue.shade100, // Card surfaces
    onSurface: Colors.black, // Text/icons on card surfaces
  ),

  // AppBar Theme
  appBarTheme: AppBarTheme(
    color: Colors.lightBlue.shade300,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white, // Title color
      fontSize: 20, // Using ScreenUtil for responsive font size
      fontWeight: FontWeight.bold, // Font weight for title
    ),
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.blue.shade300,
    elevation: 2,
  ),

  // Icon Theme
  iconTheme: IconThemeData(
    color: Colors.lightBlue.shade300,
  ),

  // Button Theme
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.lightBlue.shade300,
    textTheme: ButtonTextTheme.primary,
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow.shade600,
  ),

  // Snackbar Theme
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.lightBlue.shade300,
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
);
