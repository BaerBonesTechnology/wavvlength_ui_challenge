import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color surfaceColor = Colors.white;
const Color primaryTextColor = Color(0xFF4E4E4E);
const Color primaryLabelColor = Color(0xFF5D5163);
const Color secondaryLabelColor = Color(0xFFFFFFFF);
const Color primaryStroke = Color(0xFF34AEB1);
const Color buttonStroke = Color(0x659C9C9C);
const Color secondary = Color(0xFF5C3ED4);
const Color primary = Color(0xFFF5FBFB);
const Color secondaryStroke = Color(0xFFEDE9DE);

ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: primaryStroke,
    surface: surfaceColor,
    onSurface: primaryTextColor,
    secondary: secondary,
    onSecondary: primaryTextColor,
    error: Colors.red,
    onError: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: surfaceColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: primaryStroke,
      fontSize: 24,
      fontFamily: 'Zain',
    ),
  ),
  cardTheme: const CardTheme(
    color: primary,
    elevation: 0,
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(
        color: primaryStroke,
        width: 1,
      ),
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(surfaceColor),
      foregroundColor: WidgetStatePropertyAll(primaryTextColor),
      elevation: WidgetStatePropertyAll(0),
      iconSize: WidgetStatePropertyAll(25),
      iconColor: WidgetStatePropertyAll(secondary),
      shape: WidgetStatePropertyAll(CircleBorder(
        side: BorderSide(
          color: buttonStroke,
          width: .63,
        ),
      )),
    )
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.interTextTheme().bodyLarge?.copyWith(
      color: primaryTextColor,
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.interTextTheme().bodyMedium?.copyWith(
      color: primaryTextColor,
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.interTextTheme().bodySmall?.copyWith(
      color: primaryTextColor,
      fontSize: 12,
    ),
    titleLarge: const TextStyle(
      color: primaryStroke,
      fontSize: 36,
      fontWeight: FontWeight.bold,
      fontFamily: 'Zain',
    ),
    labelLarge: GoogleFonts.interTextTheme().labelLarge?.copyWith(
      color: secondaryLabelColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: GoogleFonts.interTextTheme().labelMedium?.copyWith(
      color: primaryLabelColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    labelSmall: GoogleFonts.interTextTheme().titleSmall?.copyWith(
      color: primaryLabelColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: primaryStroke,
    unselectedItemColor: primaryTextColor,
  )
  );