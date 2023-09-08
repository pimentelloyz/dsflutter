import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';

enum DSLoadingSize { sm, md, lg }

/// [DSLoading] is a widget that shows a circular loader.
/// [value] is the progress value. It must be between 0.0 and 1.0.
class DSLoading extends StatelessWidget {
  final DSLoadingSize size;
  final double? value;
  final Color? color;
  final bool onColor;

  const DSLoading({
    Key? key,
    required this.size,
    this.value,
    this.color,
    this.onColor = false,
  }) : super(key: key);

  const DSLoading.sm({
    Key? key,
    this.value,
    this.color,
    this.onColor = false,
  })  : size = DSLoadingSize.sm,
        super(key: key);

  const DSLoading.md({
    Key? key,
    this.value,
    this.color,
    this.onColor = false,
  })  : size = DSLoadingSize.md,
        super(key: key);

  const DSLoading.lg({
    Key? key,
    this.value,
    this.color,
    this.onColor = false,
  })  : size = DSLoadingSize.lg,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(
      value == null || (value! >= 0.0 && value! <= 1.0),
      'It must be between 0.0 and 1.0.',
    );
    final DSThemeData dsTheme = DSTheme.of(context);

    final Color color = onColor
        ? dsTheme.colors.neutral.light
        : dsTheme.colors.brand.secondary.pure;
    final Color backgroundColor = onColor
        ? dsTheme.colors.neutral.light.withOpacity(0.32)
        : dsTheme.colors.brand.primary.pure.withOpacity(0.24);

    late final double diameter;
    late final double strokeWidth;

    switch (size) {
      case DSLoadingSize.sm:
        diameter = 24.0;
        strokeWidth = 3;
        break;
      case DSLoadingSize.md:
        diameter = 32.0;
        strokeWidth = 3.5;
        break;
      case DSLoadingSize.lg:
        diameter = 40.0;
        strokeWidth = 3.5;
        break;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: diameter - strokeWidth,
        maxWidth: diameter - strokeWidth,
      ),
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
