import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSLink extends StatelessWidget {
  final bool showIcon;
  final bool onColor;
  final String text;
  final VoidCallback? onTap;

  const DSLink({
    Key? key,
    required this.text,
    this.onTap,
    this.showIcon = false,
    this.onColor = false,
  }) : super(key: key);

  const DSLink.icon({
    Key? key,
    required this.text,
    this.onTap,
    this.onColor = false,
  })  : showIcon = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);

    final bool isDisabled = onTap == null;
    const double borderWidth = 2.0;
    final Color textColor =
        onColor ? dsTheme.colors.neutral.light : dsTheme.colors.neutral.pure;
    final Color underlineColor = onColor
        ? dsTheme.colors.neutral.light
        : dsTheme.colors.brand.secondary.pure;
    final Color disableTextColor = onColor
        ? dsTheme.colors.neutral.light.withOpacity(0.32)
        : dsTheme.colors.neutral.high;
    final Color disableUnderlineColor = onColor
        ? dsTheme.colors.neutral.light.withOpacity(0.32)
        : dsTheme.colors.neutral.low;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          bottom: dsTheme.spacingInsets.quarck.vertical,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isDisabled ? disableUnderlineColor : underlineColor,
              width: borderWidth,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: dsTheme.typography.label1.copyWith(
                color: isDisabled ? disableTextColor : textColor,
              ),
            ),
            if (showIcon) ...[
              DSSpacing(spacing: dsTheme.spacing.quarck),
              DSIcon.md(
                icon: DSIcons.arrow.chevron_right,
                color: isDisabled ? disableTextColor : textColor,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
