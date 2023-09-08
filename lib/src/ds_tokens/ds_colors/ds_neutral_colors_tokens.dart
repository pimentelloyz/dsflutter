import 'package:flutter/widgets.dart';

class DSNeutralColorsTokens {
  final Color pure;
  final Color dark;
  final Color high;
  final Color medium;
  final Color low;
  final Color light;

  const DSNeutralColorsTokens({
    required this.pure,
    required this.dark,
    required this.high,
    required this.medium,
    required this.low,
    required this.light,
  });

  DSNeutralColorsTokens copyWith({
    Color? pure,
    Color? dark,
    Color? high,
    Color? medium,
    Color? low,
    Color? light,
  }) {
    return DSNeutralColorsTokens(
      pure: pure ?? this.pure,
      dark: dark ?? this.dark,
      high: high ?? this.high,
      medium: medium ?? this.medium,
      low: low ?? this.low,
      light: light ?? this.light,
    );
  }
}
