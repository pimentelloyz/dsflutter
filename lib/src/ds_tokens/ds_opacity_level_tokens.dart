class DSOpacityLevelToken {
  final double value;

  const DSOpacityLevelToken(this.value);
}

class DSOpacityLevelsTokens {
  final DSOpacityLevelToken opaque;
  final DSOpacityLevelToken semiOpaque;
  final DSOpacityLevelToken intense;
  final DSOpacityLevelToken medium;
  final DSOpacityLevelToken light;
  final DSOpacityLevelToken semiTransparent;

  const DSOpacityLevelsTokens({
    required this.opaque,
    required this.semiOpaque,
    required this.intense,
    required this.medium,
    required this.light,
    required this.semiTransparent,
  });
}
