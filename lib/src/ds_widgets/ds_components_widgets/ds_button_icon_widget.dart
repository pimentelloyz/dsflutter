import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

enum DSButtonIconType { primary, secondary }

enum DSButtonIconSize { lg, md, sm }

class DSButtonIcon extends StatelessWidget {
  final DSButtonIconType type;
  final DSButtonIconSize size;
  final IconData icon;
  final bool onColor;
  final bool showBadge;
  final VoidCallback? onPressed;

  const DSButtonIcon({
    Key? key,
    required this.size,
    required this.type,
    required this.icon,
    this.onPressed,
    this.onColor = false,
    this.showBadge = false,
  }) : super(key: key);

  const DSButtonIcon.primary({
    Key? key,
    required this.icon,
    this.size = DSButtonIconSize.md,
    this.onPressed,
    this.onColor = false,
    this.showBadge = false,
  })  : type = DSButtonIconType.primary,
        super(key: key);

  const DSButtonIcon.secondary({
    Key? key,
    required this.icon,
    this.size = DSButtonIconSize.md,
    this.onPressed,
    this.onColor = false,
    this.showBadge = false,
  })  : type = DSButtonIconType.secondary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    late final Color backgroundColorEnabled;
    late final Color backgroundColorPressed;
    late final Color backgroundColorDisabled;
    late final Color foregroundColorEnabled;
    late final Color foregroundColorDisabled;

    final DSBorderRadiusToken borderRadiusToken = dsTheme.borderRadius.circular;

    switch (type) {
      case DSButtonIconType.primary:
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
        foregroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.64)
            : dsTheme.colors.neutral.high;
        break;
      case DSButtonIconType.secondary:
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
        foregroundColorDisabled = onColor
            ? dsTheme.colors.neutral.light.withOpacity(0.64)
            : dsTheme.colors.neutral.high;
        break;
    }

    late final double diameter;
    late final double diameterBadge;
    late final double positionBadgeTop;
    late final double positionBadgeRight;
    late final DSIconSize dsIconSize;
    late final Widget badge;
    late final Color colorBadge = type == DSButtonIconType.secondary && onColor
        ? dsTheme.colors.neutral.light
        : dsTheme.colors.feedback.informative.pure;

    switch (size) {
      case DSButtonIconSize.lg:
        diameter = 64.0;
        diameterBadge = 8.0;
        dsIconSize = DSIconSize.lg;
        positionBadgeRight = 6.0;
        positionBadgeTop = 6.0;
        break;
      case DSButtonIconSize.md:
        diameter = 48.0;
        diameterBadge = 8.0;
        dsIconSize = DSIconSize.md;
        positionBadgeRight = 3.0;
        positionBadgeTop = 3.0;
        break;
      case DSButtonIconSize.sm:
        diameter = 32.0;
        diameterBadge = 8.0;
        dsIconSize = DSIconSize.sm;
        positionBadgeRight = 1.0;
        positionBadgeTop = 1.0;
        break;
    }

    badge = Positioned(
      top: positionBadgeTop,
      right: positionBadgeRight,
      child: DSBorder(
        borderRadiusToken: dsTheme.borderRadius.circular,
        child: Container(
          color: colorBadge,
          height: diameterBadge,
          width: diameterBadge,
        ),
      ),
    );

    return Stack(
      children: [
        DSBorder(
          borderRadiusToken: borderRadiusToken,
          child: Material(
            color: onPressed != null
                ? backgroundColorEnabled
                : backgroundColorDisabled,
            child: InkWell(
              highlightColor: backgroundColorPressed,
              splashColor: backgroundColorPressed,
              onTap: onPressed,
              child: SizedBox(
                height: diameter,
                width: diameter,
                child: DSIcon(
                  size: dsIconSize,
                  icon: icon,
                  color: onPressed != null
                      ? foregroundColorEnabled
                      : foregroundColorDisabled,
                ),
              ),
            ),
          ),
        ),
        if (showBadge) badge
      ],
    );
  }
}
