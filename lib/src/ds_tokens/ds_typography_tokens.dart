import 'package:flutter/material.dart';

class DSTypographyTokens {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle labelLarge;
  final TextStyle bodySmall;

  const DSTypographyTokens({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.labelLarge,
    required this.bodySmall,
  });

  factory DSTypographyTokens.fromTextTheme(TextTheme textTheme) {
    return DSTypographyTokens(
      displayLarge: textTheme.displayLarge!,
      displayMedium: textTheme.displayMedium!,
      displaySmall: textTheme.displaySmall!,
      headlineMedium: textTheme.headlineMedium!,
      headlineSmall: textTheme.headlineSmall!,
      titleLarge: textTheme.titleLarge!,
      titleMedium: textTheme.titleMedium!,
      titleSmall: textTheme.titleSmall!,
      bodyLarge: textTheme.bodyLarge!,
      bodyMedium: textTheme.bodyMedium!,
      labelLarge: textTheme.labelLarge!,
      bodySmall: textTheme.bodySmall!,
    );
  }

  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      labelLarge: labelLarge,
      bodySmall: bodySmall,
    );
  }
}
