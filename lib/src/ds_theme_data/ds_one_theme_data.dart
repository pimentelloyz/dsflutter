import 'package:flutter/material.dart';
import 'package:design_system/src/ds_theme_data/ds_theme_data.dart';
import 'package:design_system/src/ds_tokens/ds_colors/ds_brand_colors_tokens.dart';
import 'package:design_system/src/ds_tokens/ds_typography_tokens.dart';

class OneThemeData extends DSThemeData {
  @override
  ThemeData toThemeData() {
    return super.toThemeData().copyWith(
          scaffoldBackgroundColor: colors.brand.primary.light,
          appBarTheme: AppBarTheme(
            color: colors.brand.secondary.medium,
          ),
        );
  }

  OneThemeData.build()
      : super.raw(
          packageName: 'design_system',
          borderRadius: lightBorderRadius,
          borderWidth: lightBorderWidth,
          opacityLevels: lightOpacityLevels,
          colors: lightColors.copyWith(
            brandColors: const DSBrandColorsTokens(
              primary: DSBrandColorsToken(
                pure: Color(0xFF212E55),
                light: Color(0xFF212E55),
                medium: Color(0xFF212E55),
                dark: Color(0xFF212E55),
              ),
              secondary: DSBrandColorsToken(
                pure: Color(0xFF212E55),
                light: Color(0xFF212E55),
                medium: Color(0xFF212E55),
                dark: Color(0xFF212E55),
              ),
            ),
          ),
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
