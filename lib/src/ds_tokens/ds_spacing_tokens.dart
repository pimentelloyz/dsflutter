class DSSpacingToken {
  final double value;

  const DSSpacingToken(this.value);
}

class DSSpacingTokens {
  final DSSpacingToken quarck;
  final DSSpacingToken nano;
  final DSSpacingToken xxxs;
  final DSSpacingToken xxs;
  final DSSpacingToken xs;
  final DSSpacingToken sm;
  final DSSpacingToken md;
  final DSSpacingToken lg;
  final DSSpacingToken xl;
  final DSSpacingToken xxl;
  final DSSpacingToken xxxl;
  final DSSpacingToken huge;
  final DSSpacingToken giant;

  const DSSpacingTokens({
    required this.quarck,
    required this.nano,
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.huge,
    required this.giant,
  });
}
