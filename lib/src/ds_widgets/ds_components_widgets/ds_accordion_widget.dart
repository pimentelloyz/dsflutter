import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';
import '../../ds_tokens/ds_icons.dart';
import '../ds_tokens_widgets/ds_spacing_inset_widget.dart';
import '../ds_tokens_widgets/ds_spacing_widget.dart';
import 'ds_icon_widget.dart';
import 'ds_separator_widget.dart';

const Duration _kExpand = Duration(milliseconds: 200);

enum DSAccordionType { standard, collapsed, expanded, nonLine }

class DSAccordion extends StatefulWidget {
  final DSAccordionType type;
  final String title;
  final String content;
  final String? collapsedContent;

  final bool onColor;
  final ValueChanged<bool>? onExpansionChanged;

  const DSAccordion({
    Key? key,
    required this.type,
    required this.title,
    required this.content,
    this.collapsedContent,
    this.onColor = false,
    this.onExpansionChanged,
  }) : super(key: key);

  const DSAccordion.standard({
    Key? key,
    required this.title,
    required this.content,
    this.onColor = false,
    this.onExpansionChanged,
  })  : type = DSAccordionType.standard,
        collapsedContent = null,
        super(key: key);

  const DSAccordion.collapsed({
    Key? key,
    required this.title,
    required this.content,
    required this.collapsedContent,
    this.onColor = false,
    this.onExpansionChanged,
  })  : type = DSAccordionType.collapsed,
        super(key: key);

  const DSAccordion.expanded({
    Key? key,
    required this.title,
    required this.content,
    this.onColor = false,
    this.onExpansionChanged,
  })  : type = DSAccordionType.expanded,
        collapsedContent = null,
        super(key: key);

  const DSAccordion.nonLine({
    Key? key,
    required this.title,
    required this.content,
    this.onColor = false,
    this.onExpansionChanged,
  })  : type = DSAccordionType.nonLine,
        collapsedContent = null,
        super(key: key);

  @override
  State<DSAccordion> createState() => _DSAccordionState();
}

class _DSAccordionState extends State<DSAccordion>
    with SingleTickerProviderStateMixin {
  final _easeInTween = CurveTween(curve: Curves.easeIn);
  final _oneQuarterTween = Tween<double>(begin: (0.25) / 2, end: 0);
  final _collapsedOpacityTween = Tween<double>(begin: 1, end: 0);

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<double> _collapsedSizeAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_oneQuarterTween.chain(_easeInTween));
    _collapsedSizeAnimation =
        _controller.drive(_collapsedOpacityTween.chain(_easeInTween));

    _isExpanded = PageStorage.of(context).readState(context) as bool? ??
        widget.type == DSAccordionType.expanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);

    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed;

    late final Color iconColor;
    late final Color titleTextColor;
    late final Color contentTextColor;

    if (widget.onColor) {
      iconColor = dsTheme.colors.neutral.light;
      titleTextColor = dsTheme.colors.neutral.light;
      contentTextColor = dsTheme.colors.neutral.light;
    } else {
      iconColor = dsTheme.colors.brand.primary.pure;
      titleTextColor = dsTheme.colors.neutral.pure;
      contentTextColor = dsTheme.colors.neutral.dark;
    }

    final Widget content = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: EdgeInsets.only(
            left: dsTheme.spacing.xxxs.value,
            right: dsTheme.spacing.xxxs.value,
            bottom: dsTheme.spacing.xxxs.value,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.content,
                style: dsTheme.typography.bodyMedium.apply(
                  color: contentTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: _handleTap,
                child: DSSpacingInset(
                  spacingInsetToken: dsTheme.spacingInsets.xs,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: dsTheme.typography.bodyMedium.apply(
                              color: titleTextColor,
                            ),
                          ),
                          RotationTransition(
                            turns: _iconTurns,
                            child: DSIcon.md(
                              icon: DSIcons.action.add_big,
                              color: iconColor,
                            ),
                          ),
                        ],
                      ),
                      if (widget.type == DSAccordionType.collapsed)
                        ClipRRect(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            heightFactor: _collapsedSizeAnimation.value,
                            child: Column(
                              children: [
                                DSSpacing(spacing: dsTheme.spacing.xxxs),
                                Text(
                                  widget.collapsedContent ?? '',
                                  style: dsTheme.typography.bodyMedium.apply(
                                    color: contentTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              ),
              if (widget.type != DSAccordionType.nonLine)
                DSSeparator.full(
                  size: DSSeparatorSize.onePixel,
                  onColor: widget.onColor,
                ),
            ],
          ),
        );
      },
      child: shouldRemoveChildren ? null : content,
    );
  }
}
