import 'package:flutter/material.dart';

import '../ds_tokens/ds_border_radius_tokens.dart';
import '../ds_tokens/ds_border_width_tokens.dart';
import '../ds_tokens/ds_colors/ds_brand_colors_tokens.dart';
import '../ds_tokens/ds_colors/ds_colors_tokens.dart';
import '../ds_tokens/ds_colors/ds_feedback_colors_tokens.dart';
import '../ds_tokens/ds_colors/ds_neutral_colors_tokens.dart';
import '../ds_tokens/ds_font_family_tokens.dart';
import '../ds_tokens/ds_font_size_tokens.dart';
import '../ds_tokens/ds_font_weight_tokens.dart';
import '../ds_tokens/ds_line_height_tokens.dart';
import '../ds_tokens/ds_opacity_level_tokens.dart';
import '../ds_tokens/ds_shadow_tokens.dart';
import '../ds_tokens/ds_spacing_inset_tokens.dart';
import '../ds_tokens/ds_spacing_tokens.dart';
import '../ds_tokens/ds_typography_tokens.dart';

DSColorsTokens lightColors = const DSColorsTokens(
  brand: DSBrandColorsTokens(
    primary: DSBrandColorsToken(
      pure: Color(0xFF212E55),
      light: Color(0xFFDADBE2),
      medium: Color(0xFF535777),
      dark: Color(0xFF000025),
    ),
    secondary: DSBrandColorsToken(
      pure: Color(0xFF2E5EF4),
      light: Color(0xFFDDE5FD),
      medium: Color(0xFF768BFF),
      dark: Color(0xFF0035C0),
    ),
  ),
  feedback: DSFeedbackColorsTokens(
    success: DSFeedbackColorsToken(
      pure: Color(0xFF2E5EF4),
      light: Color(0xFFDDE5FD),
    ),
    informative: DSFeedbackColorsToken(
      pure: Color(0xFF52C4C0),
      light: Color(0xFFDDF5F4),
    ),
    helper: DSFeedbackColorsToken(
      pure: Color(0xFFFFC043),
      light: Color(0xFFFFEED3),
    ),
    positive: DSFeedbackColorsToken(
      pure: Color(0xFF05944F),
      light: Color(0xFFE6F2ED),
    ),
    warning: DSFeedbackColorsToken(
      pure: Color(0xFFE11900),
      light: Color(0xFFFFEFED),
    ),
  ),
  neutral: DSNeutralColorsTokens(
    pure: Color(0xFF181E4C),
    dark: Color(0xFF535777),
    high: Color(0xFF9898A6),
    medium: Color(0xFFDADBE2),
    low: Color(0xFFEDEDF1),
    light: Color(0xFFFFFFFF),
  ),
);

DSBorderRadiusTokens lightBorderRadius = const DSBorderRadiusTokens(
  none: DSBorderRadiusToken(0.0),
  sm: DSBorderRadiusToken(8.0),
  md: DSBorderRadiusToken(16.0),
  lg: DSBorderRadiusToken(24.0),
  pill: DSBorderRadiusPillToken(500.0),
  circular: DSBorderRadiusCircularToken(5000.0),
);

DSBorderWidthTokens lightBorderWidth = const DSBorderWidthTokens(
  none: DSBorderWidthToken(0.0),
  hairline: DSBorderWidthToken(1.0),
  thin: DSBorderWidthToken(2.0),
  thick: DSBorderWidthToken(4.0),
  heavy: DSBorderWidthToken(8.0),
);

DSOpacityLevelsTokens lightOpacityLevels = const DSOpacityLevelsTokens(
  opaque: DSOpacityLevelToken(0.90),
  semiOpaque: DSOpacityLevelToken(0.72),
  intense: DSOpacityLevelToken(0.64),
  medium: DSOpacityLevelToken(0.32),
  light: DSOpacityLevelToken(0.16),
  semiTransparent: DSOpacityLevelToken(0.08),
);

DSShadowLevelsTokens lightShadowLevels = const DSShadowLevelsTokens(
  level1: DSShadowToken([
    DSShadowProperties(
      blurRadius: 0.0,
      colorOpacity: 0.1,
      offset: Offset.zero,
      spreadRadius: 1.0,
    ),
  ]),
  level2: DSShadowToken([
    DSShadowProperties(
      blurRadius: 6.0,
      colorOpacity: 0.1,
      offset: Offset(0.0, 4.0),
      spreadRadius: -1.0,
    ),
    DSShadowProperties(
      blurRadius: 4.0,
      colorOpacity: 0.06,
      offset: Offset(0.0, 2.0),
      spreadRadius: -1.0,
    ),
    DSShadowProperties(
      blurRadius: 0.0,
      colorOpacity: 0.05,
      offset: Offset.zero,
      spreadRadius: 1.0,
    ),
  ]),
  level3: DSShadowToken([
    DSShadowProperties(
      blurRadius: 12.0,
      colorOpacity: 0.1,
      offset: Offset(0.0, 8.0),
      spreadRadius: -3.0,
    ),
    DSShadowProperties(
      blurRadius: 6.0,
      colorOpacity: 0.06,
      offset: Offset(0.0, 2.0),
      spreadRadius: -2.0,
    ),
    DSShadowProperties(
      blurRadius: 0.0,
      colorOpacity: 0.05,
      offset: Offset.zero,
      spreadRadius: 1.0,
    ),
  ]),
  reverse: DSShadowToken([
    DSShadowProperties(
      blurRadius: 12.0,
      colorOpacity: 0.08,
      offset: Offset(0.0, -8.0),
      spreadRadius: -3.0,
    ),
    DSShadowProperties(
      blurRadius: 6.0,
      colorOpacity: 0.04,
      offset: Offset(0.0, -2.0),
      spreadRadius: -2.0,
    ),
    DSShadowProperties(
      blurRadius: 0.0,
      colorOpacity: 0.05,
      offset: Offset.zero,
      spreadRadius: 1.0,
    ),
  ]),
);

DSSpacingTokens lightSpacing = const DSSpacingTokens(
  quarck: DSSpacingToken(4.0),
  nano: DSSpacingToken(8.0),
  xxxs: DSSpacingToken(16.0),
  xxs: DSSpacingToken(24.0),
  xs: DSSpacingToken(32.0),
  sm: DSSpacingToken(40.0),
  md: DSSpacingToken(48.0),
  lg: DSSpacingToken(56.0),
  xl: DSSpacingToken(64.0),
  xxl: DSSpacingToken(80.0),
  xxxl: DSSpacingToken(120.0),
  huge: DSSpacingToken(160.0),
  giant: DSSpacingToken(200.0),
);

DSSpacingInsetTokens lightSpacingInset = const DSSpacingInsetTokens(
  quarck: DSSpacingInsetToken(
    horizontal: 4.0,
    vertical: 4.0,
  ),
  nano: DSSpacingInsetToken(
    horizontal: 8.0,
    vertical: 8.0,
  ),
  xs: DSSpacingInsetToken(
    horizontal: 16.0,
    vertical: 16.0,
  ),
  sm: DSSpacingInsetToken(
    horizontal: 24.0,
    vertical: 24.0,
  ),
  md: DSSpacingInsetToken(
    horizontal: 32.0,
    vertical: 32.0,
  ),
  lg: DSSpacingInsetToken(
    horizontal: 40.0,
    vertical: 40.0,
  ),
);

DSFontFamilyTokens lightFontFamily = const DSFontFamilyTokens(
  base: DSFontFamilyToken('Montserrat'),
  neutral: DSFontFamilyToken('Roboto'),
);

DSFontWeightTokens lightFontWeight = const DSFontWeightTokens(
  bold: DSFontWeightToken(FontWeight.w500),
  regular: DSFontWeightToken(FontWeight.w400),
);

DSFontSizeTokens lightFontSize = const DSFontSizeTokens(
  xxxs: DSFontSizeToken(12.0),
  xxs: DSFontSizeToken(14.0),
  xs: DSFontSizeToken(16.0),
  sm: DSFontSizeToken(20.0),
  md: DSFontSizeToken(24.0),
  lg: DSFontSizeToken(32.0),
  xl: DSFontSizeToken(40.0),
  xxl: DSFontSizeToken(48.0),
  xxxl: DSFontSizeToken(64.0),
  display: DSFontSizeToken(80.0),
  giant: DSFontSizeToken(96.0),
);

DSLineHeightTokens lightLineHeight = const DSLineHeightTokens(
  standard: DSLineHeightToken(1.0),
  xs: DSLineHeightToken(1.1),
  sm: DSLineHeightToken(1.2),
  md: DSLineHeightToken(1.3),
  lg: DSLineHeightToken(1.5),
  xl: DSLineHeightToken(1.7),
  xxl: DSLineHeightToken(2.0),
);

class DSThemeData {
  final String packageName;
  final DSBorderRadiusTokens borderRadius;
  final DSBorderWidthTokens borderWidth;
  final DSColorsTokens colors;
  final DSOpacityLevelsTokens opacityLevels;
  final DSShadowLevelsTokens shadows;
  final DSSpacingInsetTokens spacingInsets;
  final DSSpacingTokens spacing;
  final DSFontFamilyTokens fontFamily;
  final DSFontWeightTokens fontWeight;
  final DSFontSizeTokens fontSize;
  final DSLineHeightTokens lineHeight;

  const DSThemeData.raw({
    required this.packageName,
    required this.borderRadius,
    required this.borderWidth,
    required this.colors,
    required this.opacityLevels,
    required this.shadows,
    required this.spacingInsets,
    required this.spacing,
    required this.fontFamily,
    required this.fontWeight,
    required this.fontSize,
    required this.lineHeight,
  });

  factory DSThemeData.fallback() => DrakmaThemeData.light();

  ThemeData toThemeData() => ThemeData().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: colors.brand.primary.pure,
          onPrimary: colors.neutral.light,
          secondary: colors.brand.secondary.pure,
          onSecondary: colors.neutral.light,
          background: colors.neutral.light,
          onBackground: colors.neutral.pure,
          surface: colors.neutral.light,
          onSurface: colors.neutral.pure,
          error: colors.feedback.warning.pure,
          onError: colors.neutral.light,
        ),
        textTheme: typography.toTextTheme(),
      );

  DSTypographyTokens get typography =>
      DSTypographyTokens.fromTextTheme(const TextTheme());

  DSThemeData copyWith({
    DSBorderRadiusTokens? borderRadius,
    DSBorderWidthTokens? borderWidth,
    DSColorsTokens? colors,
    DSOpacityLevelsTokens? opacityLevels,
    DSShadowLevelsTokens? shadows,
    DSSpacingInsetTokens? spacingInsets,
    DSSpacingTokens? spacing,
    DSFontFamilyTokens? fontFamily,
    DSFontWeightTokens? fontWeight,
    DSFontSizeTokens? fontSize,
    DSLineHeightTokens? lineHeight,
  }) {
    return DSThemeData.raw(
      packageName: packageName,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      colors: colors ?? this.colors,
      opacityLevels: opacityLevels ?? this.opacityLevels,
      shadows: shadows ?? this.shadows,
      spacingInsets: spacingInsets ?? this.spacingInsets,
      spacing: spacing ?? this.spacing,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
    );
  }
}

class DrakmaThemeData extends DSThemeData {
  @override
  ThemeData toThemeData() {
    return super.toThemeData().copyWith(
          scaffoldBackgroundColor: colors.brand.primary.light,
          appBarTheme: AppBarTheme(
            color: colors.brand.secondary.medium,
          ),
        );
  }

  DrakmaThemeData.light()
      : super.raw(
          packageName: 'design_system',
          borderRadius: lightBorderRadius,
          borderWidth: lightBorderWidth,
          opacityLevels: lightOpacityLevels,
          colors: lightColors,
          shadows: lightShadowLevels,
          spacing: lightSpacing,
          spacingInsets: lightSpacingInset,
          fontFamily: lightFontFamily,
          fontWeight: lightFontWeight,
          fontSize: lightFontSize,
          lineHeight: lightLineHeight,
        );

  @override
  DSTypographyTokens get typography => DSTypographyTokens(
        headline1: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxxl.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headline2: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxl.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headline3: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xl.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headline4: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.lg.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headline5: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.md.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headline6: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.sm.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        subtitle1: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        subtitle2: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.xl.value,
          package: packageName,
        ),
        label1: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        label2: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.xl.value,
          package: packageName,
        ),
        body1: TextStyle(
          color: colors.neutral.dark,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.neutral.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        body2: TextStyle(
          color: colors.neutral.dark,
          fontSize: fontSize.xxs.value,
          fontFamily: fontFamily.neutral.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        button: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        caption: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxxs.value,
          fontFamily: fontFamily.neutral.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.md.value,
          package: packageName,
        ),
      );
}
