import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  //light Theme
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        cardColor: Colors.teal.shade100,
        canvasColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.teal,
          ),
          titleTextStyle: TextStyle(
            color: Colors.teal,
          ),
        ),
      );

  //dark Theme
  static ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        cardColor: Colors.grey.shade700,
        canvasColor: Colors.grey.shade800,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade700,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      );
}
