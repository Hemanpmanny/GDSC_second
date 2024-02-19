import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 170, 176, 188),
    elevation: 0,
    unselectedItemColor: Colors.grey[300],
    selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
  ),
  primaryColor: Colors.teal,
  appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.robotoMono(
        letterSpacing: 1,
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: const IconThemeData(size: 30)),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Color.fromARGB(255, 146, 152, 160),
    linearTrackColor: const Color.fromARGB(255, 12, 12, 12),
  ),
  textTheme: TextTheme(
    titleSmall: GoogleFonts.openSans(
      fontSize: 14,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 18,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 22,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.gildaDisplay(fontSize: 22),
    labelMedium: GoogleFonts.gildaDisplay(fontSize: 26),
    labelLarge: GoogleFonts.gildaDisplay(fontSize: 30),
    bodySmall: GoogleFonts.gildaDisplay(fontSize: 22),
    bodyMedium: GoogleFonts.gildaDisplay(fontSize: 26),
    bodyLarge: GoogleFonts.gildaDisplay(fontSize: 30),
    headlineLarge: GoogleFonts.robotoMono(
        fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.robotoMono(
        fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.robotoMono(
        fontSize: 14, color: Colors.black38, fontWeight: FontWeight.w700),
  ),
  iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
  buttonTheme: const ButtonThemeData(buttonColor: Color.fromARGB(255, 0, 0, 0)),
);
