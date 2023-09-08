class DSFontSizeToken {
  final double value;

  const DSFontSizeToken(this.value);
}

class DSFontSizeTokens {
  final DSFontSizeToken xxxs;
  final DSFontSizeToken xxs;
  final DSFontSizeToken xs;
  final DSFontSizeToken sm;
  final DSFontSizeToken md;
  final DSFontSizeToken lg;
  final DSFontSizeToken xl;
  final DSFontSizeToken xxl;
  final DSFontSizeToken xxxl;
  final DSFontSizeToken display;
  final DSFontSizeToken giant;

  const DSFontSizeTokens({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.display,
    required this.giant,
  });
}
