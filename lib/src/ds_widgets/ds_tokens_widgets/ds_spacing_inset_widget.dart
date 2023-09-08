import 'package:flutter/material.dart';

import '../../ds_tokens/ds_spacing_inset_tokens.dart';

class DSSpacingInset extends StatelessWidget {
  final Widget? child;
  final DSSpacingInsetToken spacingInsetToken;

  const DSSpacingInset({
    Key? key,
    this.child,
    required this.spacingInsetToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: spacingInsetToken.horizontal,
        vertical: spacingInsetToken.vertical,
      ),
      child: child,
    );
  }
}
