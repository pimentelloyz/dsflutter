import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_tokens/ds_border_radius_tokens.dart';
import '../../ds_tokens/ds_shadow_tokens.dart';

class DSShadow extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final DSShadowToken shadow;
  final DSBorderRadiusToken? borderRadius;

  const DSShadow({
    Key? key,
    this.color,
    required this.shadow,
    this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius?.toBorderRadiusGeometry(),
        color: DSTheme.of(context).colors.neutral.light,
        boxShadow: List.generate(
          shadow.shadowProperties.length,
          (index) => BoxShadow(
            color: (color ?? DSTheme.of(context).colors.neutral.pure)
                .withOpacity(shadow.shadowProperties[index].colorOpacity),
            blurRadius: shadow.shadowProperties[index].blurRadius,
            spreadRadius: shadow.shadowProperties[index].spreadRadius,
            offset: shadow.shadowProperties[index].offset,
          ),
        ),
      ),
      child: child,
    );
  }
}
