import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';
import '../../ds_tokens/ds_border_radius_tokens.dart';
import '../../ds_tokens/ds_shadow_tokens.dart';
import '../ds_tokens_widgets/ds_shadow_widget.dart';

enum DSCardType { standard, elevation, background }

class DSCard extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final DSCardType type;

  const DSCard({
    Key? key,
    this.child,
    this.onTap,
    this.type = DSCardType.standard,
  }) : super(key: key);

  const DSCard.elevation({
    Key? key,
    this.child,
    this.onTap,
  })  : type = DSCardType.elevation,
        super(key: key);

  const DSCard.background({
    Key? key,
    this.child,
    this.onTap,
  })  : type = DSCardType.background,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    late final Color color;
    late final DSShadowToken shadow;
    final DSBorderRadiusToken borderRadius = dsTheme.borderRadius.sm;

    switch (type) {
      case DSCardType.standard:
        shadow = dsTheme.shadows.level1;
        color = dsTheme.colors.neutral.light;
        break;
      case DSCardType.elevation:
        shadow = dsTheme.shadows.level3;
        color = dsTheme.colors.neutral.light;
        break;
      case DSCardType.background:
        shadow = DSShadowToken.none;
        color = dsTheme.colors.neutral.low;
        break;
    }

    return DSShadow(
      shadow: shadow,
      borderRadius: borderRadius,
      child: Material(
        color: color,
        borderRadius: borderRadius.toBorderRadiusGeometry(),
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          borderRadius: borderRadius.toBorderRadiusGeometry() as BorderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
