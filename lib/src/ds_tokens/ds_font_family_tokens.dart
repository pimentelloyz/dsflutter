class DSFontFamilyToken {
  final String value;

  const DSFontFamilyToken(this.value);
}

class DSFontFamilyTokens {
  final DSFontFamilyToken base;
  final DSFontFamilyToken neutral;

  const DSFontFamilyTokens({
    required this.base,
    required this.neutral,
  });
}
