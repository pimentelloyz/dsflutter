import 'package:flutter/material.dart';
import 'package:design_system/src/ds_theme_data/ds_theme_data.dart';
import 'package:design_system/src/ds_tokens/ds_colors/ds_brand_colors_tokens.dart';
import 'package:design_system/src/ds_tokens/ds_typography_tokens.dart';

class ClassicThemeData extends DSThemeData {
  @override
  ThemeData toThemeData() {
    return super.toThemeData().copyWith(
          scaffoldBackgroundColor: colors.brand.primary.light,
          appBarTheme: AppBarTheme(
            color: colors.brand.secondary.medium,
          ),
        );
  }

  ClassicThemeData.build()
      : super.raw(
          packageName: 'design_system',
          borderRadius: lightBorderRadius,
          borderWidth: lightBorderWidth,
          opacityLevels: lightOpacityLevels,
          colors: lightColors.copyWith(
            brandColors: const DSBrandColorsTokens(
              primary: DSBrandColorsToken(
                pure: Color(0xFF2E5EF4),
                light: Color(0xFF2E5EF4),
                medium: Color(0xFF2E5EF4),
                dark: Color(0xFF2E5EF4),
              ),
              secondary: DSBrandColorsToken(
                  pure: Color(0xFF2E5EF4),
                  light: Color(0xFF2E5EF4),
                  medium: Color(0xFF2E5EF4),
                  dark: Color(0xFF2E5EF4)),
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
        displayLarge: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxxl.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        displayMedium: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxl.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        displaySmall: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xl.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headlineMedium: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.lg.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        headlineSmall: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.md.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        titleLarge: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.sm.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.sm.value,
          package: packageName,
        ),
        titleMedium: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        titleSmall: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.xl.value,
          package: packageName,
        ),
        bodyLarge: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        bodyMedium: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.xl.value,
          package: packageName,
        ),
        labelLarge: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xs.value,
          fontFamily: fontFamily.base.value,
          fontWeight: fontWeight.bold.value,
          height: lineHeight.lg.value,
          package: packageName,
        ),
        bodySmall: TextStyle(
          color: colors.neutral.pure,
          fontSize: fontSize.xxxs.value,
          fontFamily: fontFamily.neutral.value,
          fontWeight: fontWeight.regular.value,
          height: lineHeight.md.value,
          package: packageName,
        ),
      );
}
