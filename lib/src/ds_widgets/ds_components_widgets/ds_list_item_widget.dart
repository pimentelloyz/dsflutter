import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSListItem extends StatelessWidget {
  const DSListItem({
    Key? key,
    this.showIconTrailing = false,
    this.iconLeading,
    this.labelTrailing,
    this.labelLeading,
    this.paragraphTrailing,
    this.paragraphLeading,
    this.valueSwitch,
    this.onChangedSwitch,
    this.showSeparator = false,
    this.onTap,
  }) : super(key: key);

  const DSListItem.compact({
    Key? key,
    required this.labelLeading,
    this.iconLeading,
    this.labelTrailing,
    this.paragraphTrailing,
    this.onTap,
    this.showIconTrailing = false,
    this.showSeparator = true,
  })  : paragraphLeading = null,
        valueSwitch = null,
        onChangedSwitch = null,
        assert(
          !(paragraphTrailing != null && labelTrailing != null),
          "You can't use labelTrailing and paragraphTrailing at the same time",
        ),
        assert(
          !(iconLeading is DSIcon && iconLeading is DSIconShape),
          'You can only use DSIcon or DSIconShape as iconLeading',
        ),
        super(key: key);

  const DSListItem.standard({
    Key? key,
    required this.labelLeading,
    this.iconLeading,
    this.labelTrailing,
    this.paragraphTrailing,
    this.paragraphLeading,
    this.onTap,
    this.showIconTrailing = false,
    this.showSeparator = true,
  })  : valueSwitch = null,
        onChangedSwitch = null,
        assert(
          !(iconLeading is DSIcon && iconLeading is DSIconShape),
          'You can only use DSIcon or DSIconShape as iconLeading',
        ),
        super(key: key);

  const DSListItem.withSwitch({
    Key? key,
    required this.labelLeading,
    required this.valueSwitch,
    this.onChangedSwitch,
    this.paragraphLeading,
    this.onTap,
    this.showSeparator = true,
  })  : labelTrailing = null,
        paragraphTrailing = null,
        showIconTrailing = false,
        iconLeading = null,
        super(key: key);

  final bool showIconTrailing;
  final Widget? iconLeading;

  final Text? labelTrailing;
  final Text? labelLeading;

  final Text? paragraphTrailing;
  final Text? paragraphLeading;

  final bool? valueSwitch;
  final ValueChanged<bool>? onChangedSwitch;

  final bool showSeparator;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    final Widget gapHorizontal = DSSpacing(spacing: dsTheme.spacing.xxxs);
    const Widget iconTrailing = DSIcon.md(icon: Icons.chevron_right_outlined);
    final bool showSwitch = valueSwitch != null;
    final bool showIconLeading = iconLeading != null;
    final bool showLabelLeading = labelLeading != null;
    final bool showParagraphLeading = paragraphLeading != null;
    final bool showlabelTrailing = labelTrailing != null;
    final bool showParagraphTrailing = paragraphTrailing != null;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showIconLeading)
              DSSpacingInset(
                spacingInsetToken: dsTheme.spacingInsets.xs,
                child: iconLeading,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: showIconLeading && iconLeading is DSIconShape
                          ? 12
                          : 0,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: showIconLeading
                            ? 0
                            : dsTheme.spacingInsets.xs.horizontal,
                        right: dsTheme.spacingInsets.xs.horizontal,
                        top: dsTheme.spacingInsets.xs.vertical,
                        bottom: dsTheme.spacingInsets.xs.vertical,
                      ),
                      child: Row(
                        crossAxisAlignment: showIconTrailing || showSwitch
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (showLabelLeading)
                                DefaultTextStyle(
                                  style: dsTheme.typography.label2,
                                  child:
                                      labelLeading!.centerVertically(context),
                                ),
                              if (showParagraphLeading) ...[
                                DSSpacing(spacing: dsTheme.spacing.quarck),
                                DefaultTextStyle(
                                  style: dsTheme.typography.body2,
                                  child: paragraphLeading!
                                      .centerVertically(context),
                                ),
                              ]
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (showlabelTrailing)
                                    DefaultTextStyle(
                                      style: dsTheme.typography.label2,
                                      child: labelTrailing!
                                          .centerVertically(context),
                                    ),
                                  if (showParagraphTrailing) ...[
                                    if (showlabelTrailing)
                                      DSSpacing(
                                        spacing: dsTheme.spacing.quarck,
                                      ),
                                    DefaultTextStyle(
                                      textAlign: TextAlign.center,
                                      style: dsTheme.typography.body2,
                                      child: paragraphTrailing!
                                          .centerVertically(context),
                                    ),
                                  ]
                                ],
                              ),
                              if (showSwitch) ...[
                                gapHorizontal,
                                DSSwitch(
                                  value: valueSwitch!,
                                  onChanged: onChangedSwitch,
                                ),
                              ],
                              if (showIconTrailing) ...[
                                gapHorizontal,
                                iconTrailing
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (showSeparator)
                    const DSSeparator.full(size: DSSeparatorSize.onePixel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
