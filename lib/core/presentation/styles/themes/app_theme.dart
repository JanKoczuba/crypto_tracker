import 'package:flutter/material.dart';
import 'package:crypto_tracker/gen/fonts.gen.dart';
import 'package:crypto_tracker/core/presentation/styles/app_colors.dart';

part 'text_theme.dart';

part 'color_scheme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: _lightScheme,
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: _darkScheme,
  );

  static ThemeData mediumContrastLightTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: _mediumContrastLightColorScheme,
  );

  static ThemeData highContrastLightTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: _highContrastLightColorScheme,
  );

  static ThemeData mediumContrastDarkTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: _mediumContrastDarkColorScheme,
  );

  static ThemeData highContrastDarkTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: _highContrastDarkColorScheme,
  );
}
