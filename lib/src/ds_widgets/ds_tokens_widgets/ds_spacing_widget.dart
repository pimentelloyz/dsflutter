import 'package:flutter/material.dart';

import '../../ds_tokens/ds_spacing_tokens.dart';

class DSSpacing extends StatelessWidget {
  final Widget? child;
  final DSSpacingToken spacing;

  const DSSpacing({
    Key? key,
    required this.spacing,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing.value,
      width: spacing.value,
      child: child,
    );
  }
}
