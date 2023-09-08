import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

enum DSButtonType { primary, secondary, ghost }

enum DSButtonSize { md, lg }

class DSButton extends StatelessWidget {
  final DSButtonType type;
  final DSButtonSize size;
  final Text label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool onColor;
  final VoidCallback? onPressed;

  const DSButton({
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

  const DSButton.primary({
    Key? key,
    required this.label,
    this.size = DSButtonSize.md,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  })  : type = DSButtonType.primary,
        super(key: key);

  const DSButton.secondary({
    Key? key,
    required this.label,
    this.size = DSButtonSize.md,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  })  : type = DSButtonType.secondary,
        super(key: key);

  const DSButton.ghost({
    Key? key,
    required this.label,
    this.size = DSButtonSize.md,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.onColor = false,
  })  : type = DSButtonType.ghost,
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

    final bool hasIcon = leadingIcon != null || trailingIcon != null;
    final DSBorderRadiusToken borderRadius = dsTheme.borderRadius.sm;
    final double paddingVertical = size == DSButtonSize.lg
        ? dsTheme.spacingInsets.xs.vertical
        : dsTheme.spacingInsets.nano.vertical;
    final double paddingHorizontal = size == DSButtonSize.lg
        ? dsTheme.spacingInsets.md.horizontal
        : dsTheme.spacingInsets.sm.horizontal;
    final EdgeInsets padding = EdgeInsets.symmetric(
      vertical: paddingVertical,
      horizontal: paddingHorizontal,
    );
    final MainAxisSize mainAxisSize =
        size == DSButtonSize.lg ? MainAxisSize.max : MainAxisSize.min;
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;

    if (hasIcon) {
      if (trailingIcon != null) {
        mainAxisAlignment = MainAxisAlignment.spaceBetween;
      } else {
        mainAxisAlignment = MainAxisAlignment.start;
      }
    }

    switch (type) {
      case DSButtonType.primary:
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
        break;
      case DSButtonType.secondary:
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
        break;
      case DSButtonType.ghost:
        backgroundColorEnabled =
            onColor ? Colors.transparent : Colors.transparent;
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
        break;
    }

    return SizedBox(
      width: size == DSButtonSize.lg ? double.infinity : null,
      height: size == DSButtonSize.lg ? 56 : 40,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
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
        child: Row(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (leadingIcon != null) ...[
              DSIcon.md(icon: leadingIcon!),
              DSSpacing(spacing: dsTheme.spacing.nano),
            ],
            Align(
              alignment: hasIcon ? Alignment.centerLeft : Alignment.center,
              child: label.centerVertically(context),
            ),
            if (trailingIcon != null) ...[
              DSSpacing(spacing: dsTheme.spacing.nano),
              DSIcon.md(icon: trailingIcon!),
            ],
          ],
        ),
      ),
    );
  }
}
