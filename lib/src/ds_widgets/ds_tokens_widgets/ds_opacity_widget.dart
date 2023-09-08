import 'package:flutter/material.dart';

import '../../ds_tokens/ds_opacity_level_tokens.dart';

class DSOpacity extends StatelessWidget {
  final Widget? child;
  final DSOpacityLevelToken opacityLevel;

  const DSOpacity({
    Key? key,
    required this.opacityLevel,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityLevel.value,
      child: child,
    );
  }
}
