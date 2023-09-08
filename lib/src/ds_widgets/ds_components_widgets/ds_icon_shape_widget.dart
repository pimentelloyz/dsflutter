import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

enum DSIconShapeType { sm, md, lg }

class DSIconShape extends StatelessWidget {
  final DSIconShapeType type;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;

  const DSIconShape({
    Key? key,
    required this.type,
    required this.icon,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  const DSIconShape.sm({
    Key? key,
    required this.icon,
    this.color,
    this.backgroundColor,
  })  : type = DSIconShapeType.sm,
        super(key: key);

  const DSIconShape.md({
    Key? key,
    required this.icon,
    this.color,
    this.backgroundColor,
  })  : type = DSIconShapeType.md,
        super(key: key);

  const DSIconShape.lg({
    Key? key,
    required this.icon,
    this.color,
    this.backgroundColor,
  })  : type = DSIconShapeType.lg,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    late final double size;
    late final DSIconSize iconSize;

    switch (type) {
      case DSIconShapeType.sm:
        iconSize = DSIconSize.sm;
        size = 32.0;
        break;
      case DSIconShapeType.md:
        iconSize = DSIconSize.md;
        size = 48.0;
        break;
      case DSIconShapeType.lg:
        iconSize = DSIconSize.lg;
        size = 64.0;
        break;
    }

    return DSBorder(
      borderRadiusToken: dsTheme.borderRadius.circular,
      child: Container(
        height: size,
        width: size,
        color: backgroundColor ?? dsTheme.colors.neutral.low,
        child: DSIcon(
          size: iconSize,
          icon: icon,
          color: color,
        ),
      ),
    );
  }
}
