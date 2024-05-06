

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.white;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.teal;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 24, 154, 1);

  // Theme light/dark

  static final ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    scaffoldBackgroundColor:
    //  Color(0xFFF8F7FA),
    
    Colors.lightBlue.shade50,
    appBarTheme: const AppBarTheme(
      color: _appbarColorLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      // Adjust text styles as needed
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _lightTextColorPrimary,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // useMaterial3: true,
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      // Adjust text styles as needed
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _darkTextColorPrimary,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark),
  );
}

const defaultPadding = 16.0;
const  PrimaryColour = Color.fromRGBO(49,89,249,2);
const SecondaryColour =  Colors.white;