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

  // static final lightThemeMode = ThemeData.light().copyWith(
  //   scaffoldBackgroundColor: AppPallete.lightScaffoldColor,
  //   primaryColor: AppPallete.lightPrimaryColor,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: AppPallete.lightScaffoldColor,
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //       shadowColor:
  //           const MaterialStatePropertyAll(AppPallete.transparentColor),
  //       overlayColor: const MaterialStatePropertyAll(AppPallete.accentColor),
  //       backgroundColor: MaterialStateProperty.resolveWith<Color>(
  //         (Set<MaterialState> states) {
  //           if (states.contains(MaterialState.disabled)) {
  //             return AppPallete.lightDisabledPrimaryButton;
  //           }
  //           return AppPallete.lightPrimaryButton;
  //         },
  //       ),
  //       foregroundColor:
  //           const MaterialStatePropertyAll(AppPallete.lightScaffoldColor),
  //       textStyle: const MaterialStatePropertyAll(
  //         TextStyle(
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   ),
  //   chipTheme: const ChipThemeData(
  //     color: MaterialStatePropertyAll(
  //       AppPallete.lightScaffoldColor,
  //     ),
  //     side: BorderSide.none,
  //   ),
  // inputDecorationTheme: InputDecorationTheme(
  //   fillColor: AppPallete.lightTextFieldFillColor,
  //   filled: true,
  //   hintStyle: const TextStyle(
  //       fontWeight: FontWeight.normal, color: AppPallete.lightHintColor),
  //   contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
  //   border: _lightBorder(),
  //   enabledBorder: _lightBorder(),
  //   focusedBorder: _lightBorder(AppPallete.accentColor, 2),
  //   errorBorder: _lightBorder(AppPallete.errorColor),
  // ),
  //   textTheme: ThemeData.light().textTheme.apply(
  //         fontFamily: 'Rubik',
  //       ),
  // );
  static final lightThemeMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: const Color(0xFFF7F7F6),
    appBarTheme: const AppBarTheme(color: Color(0xFFF7F7F6)),
    primaryColor: const Color(0xFF070707),
    shadowColor: Colors.transparent,
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
    highlightColor: AppPallete.accentColor,
    disabledColor: AppPallete.lightDisabledPrimaryButton,
  );
}
