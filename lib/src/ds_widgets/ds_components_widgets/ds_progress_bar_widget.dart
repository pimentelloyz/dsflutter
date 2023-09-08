import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';
import '../ds_tokens_widgets/ds_spacing_widget.dart';

enum DSProgressBarSize { sm, md, lg }

/// [DSProgressBar] is a widget that shows a progress bar.
/// [value] is the progress value. It must be between 0.0 and 1.0.
class DSProgressBar extends StatelessWidget {
  final DSProgressBarSize size;
  final double value;
  final Color? color;
  final bool showLabel;
  final bool onColor;

  const DSProgressBar({
    Key? key,
    required this.size,
    required this.value,
    this.color,
    this.showLabel = false,
    this.onColor = false,
  }) : super(key: key);

  const DSProgressBar.sm({
    Key? key,
    required this.value,
    this.color,
    this.showLabel = false,
    this.onColor = false,
  })  : size = DSProgressBarSize.sm,
        super(key: key);

  const DSProgressBar.md({
    Key? key,
    required this.value,
    this.color,
    this.showLabel = false,
    this.onColor = false,
  })  : size = DSProgressBarSize.md,
        super(key: key);

  const DSProgressBar.lg({
    Key? key,
    required this.value,
    this.color,
    this.showLabel = false,
    this.onColor = false,
  })  : size = DSProgressBarSize.lg,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(value >= 0.0 && value <= 1.0, 'It must be between 0.0 and 1.0.');
    final DSThemeData dsTheme = DSTheme.of(context);

    final Color color = onColor
        ? dsTheme.colors.neutral.light
        : dsTheme.colors.brand.secondary.pure;
    final Color backgroundColor = onColor
        ? dsTheme.colors.neutral.light.withOpacity(0.16)
        : dsTheme.colors.neutral.low;
    final Color labelColor =
        onColor ? dsTheme.colors.neutral.light : dsTheme.colors.neutral.pure;

    late final double height;
    late final TextStyle textStyle;

    switch (size) {
      case DSProgressBarSize.sm:
        height = 2.0;
        textStyle = dsTheme.typography.caption.copyWith(color: labelColor);
        break;
      case DSProgressBarSize.md:
        height = 4.0;
        textStyle = dsTheme.typography.body2.copyWith(color: labelColor);
        break;
      case DSProgressBarSize.lg:
        height = 8.0;
        textStyle = dsTheme.typography.body1.copyWith(color: labelColor);
        break;
    }

    return Column(
      children: [
        LinearProgressIndicator(
          value: value,
          minHeight: height,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        if (showLabel) ...[
          DSSpacing(spacing: dsTheme.spacing.nano),
          Text(
            '${(value * 100).round()}% completo',
            style: textStyle,
          ),
        ]
      ],
    );
  }
}
