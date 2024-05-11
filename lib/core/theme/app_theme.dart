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
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppPallete.lightTextFieldFillColor,
      filled: true,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        color: AppPallete.lightHintColor,
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      border: _lightBorder(),
      enabledBorder: _lightBorder(),
      focusedBorder: _lightBorder(
        AppPallete.accentColor,
        2,
      ),
      errorBorder: _lightBorder(
        AppPallete.errorColor,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.grey),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    disabledColor: const Color(0xFF676766),
  );

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF070707),
    onPrimary: Color(0xFFF7F7F6),
    primaryContainer: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF070707),
    secondaryContainer: Color(0xFF0384fe),
    onSecondaryContainer: Color(0xFFF7F7F6),
    secondary: Color(0xFF0384fe),
    onSecondary: Color(0xFFF7F7F6),
    error: Colors.redAccent,
    onError: Color(0xFFF7F7F6),
    background: Color(0xFFF7F7F6),
    onBackground: Color(0xFF070707),
    surface: Color(0xFFF7F7F6),
    onSurface: Color(0xFF070707),
    shadow: Color.fromARGB(255, 185, 185, 185),
  );
}
