import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';

class DSSeparatorSize {
  final double value;

  const DSSeparatorSize._(this.value);

  static const DSSeparatorSize onePixel = DSSeparatorSize._(1.0);
  static const DSSeparatorSize twoPixel = DSSeparatorSize._(2.0);
}

enum DSSeparatorType { full, middle }

class DSSeparator extends StatelessWidget {
  final bool onColor;
  final DSSeparatorSize size;
  final DSSeparatorType type;

  const DSSeparator({
    Key? key,
    this.onColor = false,
    required this.size,
    required this.type,
  }) : super(key: key);

  const DSSeparator.full({
    Key? key,
    this.onColor = false,
    required this.size,
  })  : type = DSSeparatorType.full,
        super(key: key);

  const DSSeparator.middle({
    Key? key,
    this.onColor = false,
    required this.size,
  })  : type = DSSeparatorType.middle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    final Color color = onColor
        ? dsTheme.colors.neutral.light.withOpacity(0.32)
        : dsTheme.colors.neutral.medium;
    final double indent =
        type == DSSeparatorType.full ? 0.0 : dsTheme.spacing.xxxs.value;

    return SizedBox(
      height: size.value,
      child: Center(
        child: Container(
          height: size.value,
          margin: EdgeInsets.symmetric(horizontal: indent),
          color: color,
        ),
      ),
    );
  }
}
