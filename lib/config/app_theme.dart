import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color(0xff575767)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: const Color(0xff24242D),
          onPrimary: const Color(0xff575767),
          side: const BorderSide(width: 1, color: Color(0xff29292F)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xff0E0E11)),
        side: const BorderSide(
          color: Color(0xff0E0E11),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Color(0xffDADADA),
      ),
      backgroundColor: const Color(0xff1E1F25),
      dividerColor: const Color(0xff29292F),
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color(0xff575767)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: const Color(0xffF2F3FF),
          onPrimary: const Color(0xff575767),
          side: const BorderSide(width: 1, color: Color(0xffEBEBEB)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xffDADADA)),
        side: const BorderSide(
          color: Color(0xffDADADA),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Color(0xff575767),
      ),
      backgroundColor: const Color(0xffFFFFFF),
      dividerColor: const Color(0xffEBEBEB),
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
    );
  }
}
