class DSBorderWidthToken {
  final double value;

  const DSBorderWidthToken(this.value);
}

class DSBorderWidthTokens {
  final DSBorderWidthToken none;
  final DSBorderWidthToken hairline;
  final DSBorderWidthToken thin;
  final DSBorderWidthToken thick;
  final DSBorderWidthToken heavy;

  const DSBorderWidthTokens({
    required this.none,
    required this.hairline,
    required this.thin,
    required this.thick,
    required this.heavy,
  });
}
