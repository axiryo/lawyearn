import 'package:flutter/material.dart';
import 'package:lawyearn/core/theme/app_palette.dart';

class AppTheme {
  static _lightBorder(
          [Color color = AppPallete.lightBorderColor, double weight = 1]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: weight,
        ),
        borderRadius: BorderRadius.circular(8),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.darkScaffoldColor,
    primaryColor: AppPallete.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.darkScaffoldColor,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(
        AppPallete.darkScaffoldColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: AppPallete.darkHintColor),
      contentPadding: const EdgeInsets.all(16),
      border: _lightBorder(),
      enabledBorder: _lightBorder(),
      focusedBorder: _lightBorder(AppPallete.accentColor),
      errorBorder: _lightBorder(AppPallete.errorColor),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Rubik',
        ),
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.lightScaffoldColor,
    primaryColor: AppPallete.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.lightScaffoldColor,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(
        AppPallete.lightScaffoldColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: AppPallete.lightHintColor),
      contentPadding: const EdgeInsets.all(16),
      border: _lightBorder(),
      enabledBorder: _lightBorder(),
      focusedBorder: _lightBorder(AppPallete.accentColor, 2),
      errorBorder: _lightBorder(AppPallete.errorColor),
    ),
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Rubik',
        ),
  );
}
