import 'package:flutter/material.dart';

import '../../ds_tokens/ds_border_radius_tokens.dart';
import '../../ds_tokens/ds_border_width_tokens.dart';

class DSBorder extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final DSBorderWidthToken width;
  final DSBorderRadiusToken radius;

  const DSBorder({
    Key? key,
    this.color,
    DSBorderWidthToken? width,
    DSBorderRadiusToken? borderRadiusToken,
    this.child,
  })  : width = width ?? const DSBorderWidthToken(0.0),
        radius = borderRadiusToken ?? const DSBorderRadiusToken(0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(width.value),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: radius is! DSBorderRadiusCircularToken
            ? radius.toBorderRadiusGeometry()
            : null,
        shape: radius is DSBorderRadiusCircularToken
            ? BoxShape.circle
            : BoxShape.rectangle,
        border: Border.all(
          color: color ?? Colors.transparent,
          width: width.value,
          style: width.value > 0.0 ? BorderStyle.solid : BorderStyle.none,
        ),
      ),
      child: child,
    );
  }
}
