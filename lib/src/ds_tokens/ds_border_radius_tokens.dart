import 'package:flutter/widgets.dart';

class DSBorderRadiusToken {
  const DSBorderRadiusToken(this.value);
  final double value;

  BorderRadiusGeometry toBorderRadiusGeometry() {
    return BorderRadius.all(Radius.circular(value));
  }
}

class DSBorderRadiusPillToken extends DSBorderRadiusToken {
  const DSBorderRadiusPillToken(double value) : super(value);
}

class DSBorderRadiusCircularToken extends DSBorderRadiusToken {
  const DSBorderRadiusCircularToken(double value) : super(value);
}

class DSBorderRadiusTokens {
  final DSBorderRadiusToken none;
  final DSBorderRadiusToken sm;
  final DSBorderRadiusToken md;
  final DSBorderRadiusToken lg;
  final DSBorderRadiusPillToken pill;
  final DSBorderRadiusCircularToken circular;

  const DSBorderRadiusTokens({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
    required this.pill,
    required this.circular,
  });
}
