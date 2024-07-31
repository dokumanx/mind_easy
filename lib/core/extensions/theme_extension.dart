import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  ThemeData get theme => Theme.of(this);

  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
