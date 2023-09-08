import 'package:flutter/widgets.dart';

class DSBrandColorsTokens {
  final DSBrandColorsToken primary;
  final DSBrandColorsToken secondary;

  const DSBrandColorsTokens({
    required this.primary,
    required this.secondary,
  });

  DSBrandColorsTokens copyWith({
    DSBrandColorsToken? primary,
    DSBrandColorsToken? secondary,
  }) {
    return DSBrandColorsTokens(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }
}

class DSBrandColorsToken {
  final Color pure;
  final Color light;
  final Color medium;
  final Color dark;

  const DSBrandColorsToken({
    required this.pure,
    required this.light,
    required this.medium,
    required this.dark,
  });

  DSBrandColorsToken copyWith({
    Color? pure,
    Color? light,
    Color? medium,
    Color? dark,
  }) {
    return DSBrandColorsToken(
      pure: pure ?? this.pure,
      light: light ?? this.light,
      medium: medium ?? this.medium,
      dark: dark ?? this.dark,
    );
  }
}
