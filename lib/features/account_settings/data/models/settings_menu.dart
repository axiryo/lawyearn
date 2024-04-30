import 'package:flutter/material.dart';

class SettingsMenuItem {
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;
  final TextStyle? leadingTextStyle;

  SettingsMenuItem({
    required this.title,
    required this.onTap,
    this.trailing,
    this.leadingTextStyle,
  });
}
