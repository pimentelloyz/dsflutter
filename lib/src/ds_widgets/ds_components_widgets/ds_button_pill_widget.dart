import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

enum DSButtonPillType { primary, secondary, ghost }

enum DSButtonPillSize { lg, sm }

class DSButtonPill extends StatelessWidget {
  final DSButtonPillType type;
  final DSButtonPillSize size;
  final Text label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool onColor;
  final VoidCallback? onPressed;

  const DSButtonPill({
    Key? key,
    required this.size,
    required this.type,
    required this.label,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  }) : super(key: key);

  const DSButtonPill.primary({
    Key? key,
    required this.label,
    this.size = DSButtonPillSize.sm,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  })  : type = DSButtonPillType.primary,
        super(key: key);

  const DSButtonPill.secondary({
    Key? key,
    required this.label,
    this.size = DSButtonPillSize.sm,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  })  : type = DSButtonPillType.secondary,
        super(key: key);

  const DSButtonPill.ghost({
    Key? key,
    required this.label,
    this.size = DSButtonPillSize.sm,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  })  : type = DSButtonPillType.ghost,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    late final Color backgroundColorEnabled;
    late final Color backgroundColorPressed;
    late final Color backgroundColorDisabled;
    late final Color foregroundColorEnabled;
    late final Color foregroundColorPressed;
    late final Color foregroundColorDisabled;
    late final bool onColorLoading;

    final bool hasIcon = leadingIcon != null || trailingIcon != null;
    final DSBorderRadiusToken borderRadius = dsTheme.borderRadius.pill;
    final double height = size == DSButtonPillSize.lg ? 40.0 : 32.0;
    final double paddingVertical = size == DSButtonPillSize.lg
        ? dsTheme.spacingInsets.nano.vertical
        : dsTheme.spacingInsets.quarck.vertical;
    final double paddingHorizontal = size == DSButtonPillSize.lg
        ? dsTheme.spacingInsets.sm.horizontal
        : dsTheme.spacingInsets.xs.horizontal;
    final DSSpacingToken spacingBetweenLabelIcon = size == DSButtonPillSize.lg
        ? dsTheme.spacing.nano
        : dsTheme.spacing.quarck;
    final TextStyle textStyleButton = size == DSButtonPillSize.lg
        ? dsTheme.typography.button.copyWith(height: 1)
        : dsTheme.typography.label2.copyWith(height: 1);
    final DSIconSize iconSize =
        size == DSButtonPillSize.lg ? DSIconSize.md : DSIconSize.sm;

    const MainAxisSize mainAxisSize = MainAxisSize.min;
    final EdgeInsets padding = EdgeInsets.symmetric(
      vertical: paddingVertical,
      horizontal: paddingHorizontal,
    );

    switch (type) {
      case DSButtonPillType.primary:
        backgroundColorEnabled = onColor
            ? dsTheme.colors.neutral.light
            : dsTheme.colors.brand.secondary.pure;
        backgroundColorPressed = onColor
            ? dsTheme.colors.neutral.low
            : dsTheme.colors.brand.secondary.dark;
        backgroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.08)
            : dsTheme.colors.neutral.low;
        foregroundColorEnabled = onColor
            ? dsTheme.colors.neutral.pure
            : dsTheme.colors.neutral.light;
        foregroundColorPressed = onColor
            ? dsTheme.colors.neutral.pure
            : dsTheme.colors.neutral.light;
        foregroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.64)
            : dsTheme.colors.neutral.high;
        onColorLoading = !onColor;
        break;
      case DSButtonPillType.secondary:
        backgroundColorEnabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.16)
            : dsTheme.colors.neutral.low;
        backgroundColorPressed = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.24)
            : dsTheme.colors.neutral.medium;
        backgroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.08)
            : dsTheme.colors.neutral.low;
        foregroundColorEnabled = onColor
            ? dsTheme.colors.neutral.light
            : dsTheme.colors.neutral.pure;
        foregroundColorPressed = onColor
            ? dsTheme.colors.neutral.light
            : dsTheme.colors.neutral.pure;
        foregroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.64)
            : dsTheme.colors.neutral.high;
        onColorLoading = onColor;
        break;
      case DSButtonPillType.ghost:
        backgroundColorEnabled = Colors.transparent;
        backgroundColorPressed = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.08)
            : dsTheme.colors.neutral.low.withOpacity(0.32);
        backgroundColorDisabled =
            onColor ? Colors.transparent : Colors.transparent;
        foregroundColorEnabled = onColor
            ? dsTheme.colors.neutral.light
            : dsTheme.colors.neutral.pure;
        foregroundColorPressed = onColor
            ? dsTheme.colors.neutral.light
            : dsTheme.colors.neutral.pure;
        foregroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.64)
            : dsTheme.colors.neutral.high;
        onColorLoading = onColor;
        break;
    }

    return SizedBox(
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return textStyleButton.apply(color: foregroundColorDisabled);
            }
            if (states.contains(MaterialState.pressed)) {
              return textStyleButton.apply(color: foregroundColorPressed);
            }
            return textStyleButton.apply(color: foregroundColorEnabled);
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return backgroundColorDisabled;
            }
            if (states.contains(MaterialState.pressed)) {
              return backgroundColorPressed;
            }
            return backgroundColorEnabled;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return foregroundColorDisabled;
            }
            if (states.contains(MaterialState.pressed)) {
              return foregroundColorPressed;
            }
            return foregroundColorEnabled;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return backgroundColorDisabled;
            }
            if (states.contains(MaterialState.pressed)) {
              return backgroundColorPressed;
            }
            return backgroundColorEnabled;
          }),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius.toBorderRadiusGeometry(),
            ),
          ),
          padding: MaterialStateProperty.all(padding),
          alignment: Alignment.center,
        ),
        child: isLoading
            ? DSLoading.sm(onColor: onColorLoading)
            : Row(
                mainAxisSize: mainAxisSize,
                children: [
                  if (leadingIcon != null) ...[
                    DSIcon(icon: leadingIcon!, size: iconSize),
                    DSSpacing(spacing: spacingBetweenLabelIcon),
                  ],
                  Align(
                    alignment:
                        hasIcon ? Alignment.centerLeft : Alignment.center,
                    child: label.centerVertically(context),
                  ),
                  if (trailingIcon != null) ...[
                    DSSpacing(spacing: spacingBetweenLabelIcon),
                    DSIcon(icon: trailingIcon!, size: iconSize),
                  ],
                ],
              ),
      ),
    );
  }
}
