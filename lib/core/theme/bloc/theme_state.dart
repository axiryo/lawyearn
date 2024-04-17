import 'package:flutter/material.dart';
import 'package:lawyearn/core/theme/app_theme.dart';

class ThemeState {
  final ThemeData themeData;
  final bool isDarkTheme;

  ThemeState({required this.themeData, required this.isDarkTheme});

  static ThemeState get darkTheme =>
      ThemeState(themeData: AppTheme.darkThemeMode, isDarkTheme: true);

  static ThemeState get lightTheme =>
      ThemeState(themeData: AppTheme.lightThemeMode, isDarkTheme: false);
}
