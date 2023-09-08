import 'package:flutter/material.dart';

extension TextExtension on Text {
  /// This method is used to center vertically the text.
  ///
  /// [See more - Stackoverflow](https://stackoverflow.com/questions/69573547/flutter-is-it-possible-to-set-vertical-alignment-in-text-lines-at-height-1-0)
  Widget centerVertically(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final TextStyle effectiveTextStyle = defaultTextStyle.style.merge(style);

    final double height = effectiveTextStyle.height ?? 1.0;
    final double textSize = effectiveTextStyle.fontSize ?? 14.0;
    final double baseline = height * textSize - height * textSize / 4;

    return Baseline(
      baselineType: TextBaseline.alphabetic,
      baseline: baseline,
      child: this,
    );
  }
}
