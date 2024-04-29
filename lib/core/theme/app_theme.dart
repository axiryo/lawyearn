import 'package:flutter/material.dart';
import 'package:lawyearn/core/theme/app_palette.dart';

class AppTheme {
  static _lightBorder(
          [Color color = AppPallete.transparentColor, double weight = 1]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: weight,
        ),
        borderRadius: BorderRadius.circular(8),
      );

  static final darkThemeMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Rubik',
  );

  static final lightThemeMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: const Color(0xFFF7F7F6),
    appBarTheme: const AppBarTheme(color: Color(0xFFF7F7F6)),
    primaryColor: const Color(0xFF070707),
    shadowColor: Colors.transparent,
    cardColor: AppPallete.whiteColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppPallete.lightTextFieldFillColor,
      filled: true,
      hintStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: AppPallete.lightHintColor),
      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      border: _lightBorder(),
      enabledBorder: _lightBorder(),
      focusedBorder: _lightBorder(AppPallete.accentColor, 2),
      errorBorder: _lightBorder(AppPallete.errorColor),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      overlayColor: MaterialStatePropertyAll(AppPallete.accentColor),
    )),
    listTileTheme: const ListTileThemeData(
      tileColor: AppPallete.whiteColor,
    ),
    highlightColor: AppPallete.accentColor,
    disabledColor: AppPallete.lightDisabledPrimaryButton,
  );
}
