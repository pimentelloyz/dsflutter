import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';

enum DSIconSize { sm, md, lg }

class DSIcon extends StatelessWidget {
  final DSIconSize size;
  final IconData icon;
  final Color? color;

  const DSIcon({
    Key? key,
    required this.size,
    required this.icon,
    this.color,
  }) : super(key: key);

  const DSIcon.sm({
    Key? key,
    required this.icon,
    this.color,
  })  : size = DSIconSize.sm,
        super(key: key);

  const DSIcon.md({
    Key? key,
    required this.icon,
    this.color,
  })  : size = DSIconSize.md,
        super(key: key);

  const DSIcon.lg({
    Key? key,
    required this.icon,
    this.color,
  })  : size = DSIconSize.lg,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    final IconThemeData iconTheme = IconTheme.of(context);

    late final double diameter;

    switch (size) {
      case DSIconSize.sm:
        diameter = 16.0;
        break;
      case DSIconSize.md:
        diameter = 24.0;
        break;
      case DSIconSize.lg:
        diameter = 32.0;
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: diameter,
            minHeight: diameter,
            maxHeight: diameter,
            maxWidth: diameter,
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              icon,
              color:
                  color ?? iconTheme.color ?? dsTheme.colors.brand.primary.pure,
            ),
          ),
        ),
      ],
    );
  }
}
