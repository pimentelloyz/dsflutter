import 'package:flutter/cupertino.dart';

class DSShadowProperties {
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;
  final double colorOpacity;

  const DSShadowProperties({
    required this.offset,
    required this.blurRadius,
    required this.spreadRadius,
    required this.colorOpacity,
  });
}

class DSShadowToken {
  final List<DSShadowProperties> shadowProperties;

  const DSShadowToken(this.shadowProperties);

  static const DSShadowToken none = DSShadowToken([]);
}

class DSShadowLevelsTokens {
  final DSShadowToken level1;
  final DSShadowToken level2;
  final DSShadowToken level3;
  final DSShadowToken reverse;

  const DSShadowLevelsTokens({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.reverse,
  });
}
