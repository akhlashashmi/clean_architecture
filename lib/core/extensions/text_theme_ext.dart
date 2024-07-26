import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  TextTheme applyColor(Color color) {
    return TextTheme(
      bodyMedium: bodyMedium?.copyWith(color: color),
      bodySmall: bodySmall?.copyWith(color: color),
      bodyLarge: bodyLarge?.copyWith(color: color),
      titleLarge: titleLarge?.copyWith(color: color),
      titleSmall: titleSmall?.copyWith(color: color),
      titleMedium: titleMedium?.copyWith(color: color),
      headlineLarge: headlineLarge?.copyWith(color: color),
      headlineMedium: headlineMedium?.copyWith(color: color),
      headlineSmall: headlineSmall?.copyWith(color: color),
      displayLarge: displayLarge?.copyWith(color: color),
      displayMedium: displayMedium?.copyWith(color: color),
      displaySmall: displaySmall?.copyWith(color: color),
      labelLarge: labelLarge?.copyWith(color: color),
      labelMedium: labelMedium?.copyWith(color: color),
      labelSmall: labelSmall?.copyWith(color: color),
    );
  }
}
