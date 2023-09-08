class DSLineHeightToken {
  final double value;

  const DSLineHeightToken(this.value);
}

class DSLineHeightTokens {
  final DSLineHeightToken standard;
  final DSLineHeightToken xs;
  final DSLineHeightToken sm;
  final DSLineHeightToken md;
  final DSLineHeightToken lg;
  final DSLineHeightToken xl;
  final DSLineHeightToken xxl;

  const DSLineHeightTokens({
    required this.standard,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });
}
