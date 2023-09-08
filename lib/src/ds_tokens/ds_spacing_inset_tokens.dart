import 'package:flutter/material.dart';

class DSSpacingInsetToken {
  final double vertical;
  final double horizontal;

  const DSSpacingInsetToken({
    required this.vertical,
    required this.horizontal,
  });

  EdgeInsetsGeometry toEdgeInsetsGeometry() => EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      );
}

class DSSpacingInsetTokens {
  final DSSpacingInsetToken quarck;
  final DSSpacingInsetToken nano;
  final DSSpacingInsetToken xs;
  final DSSpacingInsetToken sm;
  final DSSpacingInsetToken md;
  final DSSpacingInsetToken lg;

  const DSSpacingInsetTokens({
    required this.quarck,
    required this.nano,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });
}
