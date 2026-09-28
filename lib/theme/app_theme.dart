import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ==============================
  // WAYVORA COLORS
  // ==============================

  static const Color background = Color(0xFFFFF9EF);
  static const Color navy = Color(0xFF142235);
  static const Color yellow = Color(0xFFFFBF1F);
  static const Color lightYellow = Color(0xFFFFF2C7);
  static const Color grey = Color(0xFF6F6F6F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFF3C94B);

  // ==============================
  // WAYVORA THEME
  // ==============================

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: background,

      colorScheme: ColorScheme.fromSeed(
        seedColor: yellow,
        primary: yellow,
        secondary: navy,
        surface: white,
      ),

      // ==============================
      // GLOBAL TEXT STYLE
      // ==============================

      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        displayMedium: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        displaySmall: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        headlineLarge: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        headlineMedium: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        headlineSmall: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        titleLarge: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w700,
        ),

        titleMedium: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w600,
        ),

        titleSmall: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w600,
        ),

        bodyLarge: GoogleFonts.poppins(
          color: grey,
          fontWeight: FontWeight.w400,
        ),

        bodyMedium: GoogleFonts.poppins(
          color: grey,
          fontWeight: FontWeight.w400,
        ),

        bodySmall: GoogleFonts.poppins(
          color: grey,
          fontWeight: FontWeight.w400,
        ),

        labelLarge: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w600,
        ),

        labelMedium: GoogleFonts.poppins(
          color: navy,
          fontWeight: FontWeight.w500,
        ),

        labelSmall: GoogleFonts.poppins(
          color: grey,
          fontWeight: FontWeight.w500,
        ),
      ),

      // ==============================
      // APP BAR
      // ==============================

      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: navy,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          color: navy,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),

      // ==============================
      // BUTTONS
      // ==============================

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: yellow,
          foregroundColor: navy,
          elevation: 0,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // ==============================
      // INPUT FIELDS
      // ==============================

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,

        labelStyle: GoogleFonts.poppins(
          color: grey,
        ),

        hintStyle: GoogleFonts.poppins(
          color: grey,
        ),

        prefixIconColor: yellow,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: border,
            width: 1.5,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: border,
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: yellow,
            width: 2,
          ),
        ),
      ),

      // ==============================
      // CARDS
      // ==============================

      cardTheme: CardThemeData(
        color: white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: border,
            width: 1.5,
          ),
        ),
      ),

      // ==============================
      // ICONS
      // ==============================

      iconTheme: const IconThemeData(
        color: navy,
      ),

      // ==============================
      // DIVIDERS
      // ==============================

      dividerTheme: const DividerThemeData(
        color: border,
        thickness: 1,
      ),
    );
  }
}