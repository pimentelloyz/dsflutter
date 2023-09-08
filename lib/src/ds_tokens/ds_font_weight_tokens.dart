import 'package:flutter/material.dart';

class DSFontWeightToken {
  final FontWeight value;

  const DSFontWeightToken(this.value);
}

class DSFontWeightTokens {
  final DSFontWeightToken bold;
  final DSFontWeightToken regular;

  const DSFontWeightTokens({
    required this.bold,
    required this.regular,
  });
}
