import 'dart:ui';

import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';
import '../ds_tokens_widgets/ds_spacing_widget.dart';

enum DSRadiolabelLargeState { selected, unselected }

class DSRadiolabelLarge<T> extends StatelessWidget {
  final ValueChanged<T?>? onChanged;
  final Widget? title;
  final T? groupValue;
  final T value;

  const DSRadiolabelLarge({
    Key? key,
    required this.groupValue,
    required this.value,
    this.onChanged,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);
    const double size = 24.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: _RadioCustom<T>(
            groupValue: groupValue,
            value: value,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return dsTheme.colors.neutral.medium;
              }
              if (states.contains(MaterialState.selected)) {
                return dsTheme.colors.brand.secondary.pure;
              }
              return dsTheme.colors.neutral.high;
            }),
            onChanged: onChanged,
          ),
        ),
        if (title != null) ...[
          DSSpacing(spacing: dsTheme.spacing.nano),
          DefaultTextStyle(
            style: dsTheme.typography.titleMedium,
            child: title!,
          )
        ]
      ],
    );
  }
}

class _RadioCustom<T> extends StatefulWidget {
  const _RadioCustom({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.fillColor,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final MouseCursor? mouseCursor;
  final bool toggleable;
  final Color? activeColor;
  final MaterialStateProperty<Color> fillColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;

  bool get _selected => value == groupValue;

  @override
  State<_RadioCustom<T>> createState() => _RadioCustomState<T>();
}

class _RadioCustomState<T> extends State<_RadioCustom<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final _RadioPainter _painter = _RadioPainter();

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(_RadioCustom<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;

  @override
  Widget build(BuildContext context) {
    assert(
      debugCheckHasMaterial(context),
      'A Material widget is required here.',
    );
    final ThemeData themeData = Theme.of(context);
    final RadioThemeData radioTheme = RadioTheme.of(context);
    final MaterialTapTargetSize effectiveMaterialTapTargetSize =
        widget.materialTapTargetSize ??
            radioTheme.materialTapTargetSize ??
            themeData.materialTapTargetSize;
    final VisualDensity effectiveVisualDensity = widget.visualDensity ??
        radioTheme.visualDensity ??
        themeData.visualDensity;
    Size size;
    switch (effectiveMaterialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        size = const Size(kMinInteractiveDimension, kMinInteractiveDimension);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        size = const Size(
          kMinInteractiveDimension - 8.0,
          kMinInteractiveDimension - 8.0,
        );
        break;
    }
    size += effectiveVisualDensity.baseSizeAdjustment;

    final MaterialStateProperty<MouseCursor> effectiveMouseCursor =
        MaterialStateProperty.resolveWith<MouseCursor>(
            (Set<MaterialState> states) {
      return MaterialStateProperty.resolveAs<MouseCursor?>(
            widget.mouseCursor,
            states,
          ) ??
          radioTheme.mouseCursor?.resolve(states) ??
          MaterialStateProperty.resolveAs<MouseCursor>(
            MaterialStateMouseCursor.clickable,
            states,
          );
    });

    final Set<MaterialState> activeStates = states..add(MaterialState.selected);
    final Set<MaterialState> inactiveStates = states
      ..remove(MaterialState.selected);
    final Color effectiveActiveColor = widget.fillColor.resolve(activeStates);
    final Color effectiveInactiveColor =
        widget.fillColor.resolve(inactiveStates);

    final Set<MaterialState> focusedStates = states..add(MaterialState.focused);
    final Color effectiveFocusOverlayColor =
        widget.overlayColor?.resolve(focusedStates) ??
            widget.focusColor ??
            radioTheme.overlayColor?.resolve(focusedStates) ??
            themeData.focusColor;

    final Set<MaterialState> hoveredStates = states..add(MaterialState.hovered);
    final Color effectiveHoverOverlayColor =
        widget.overlayColor?.resolve(hoveredStates) ??
            widget.hoverColor ??
            radioTheme.overlayColor?.resolve(hoveredStates) ??
            themeData.hoverColor;

    final Set<MaterialState> activePressedStates = activeStates
      ..add(MaterialState.pressed);
    final Color effectiveActivePressedOverlayColor =
        widget.overlayColor?.resolve(activePressedStates) ??
            radioTheme.overlayColor?.resolve(activePressedStates) ??
            effectiveActiveColor.withAlpha(kRadialReactionAlpha);

    final Set<MaterialState> inactivePressedStates = inactiveStates
      ..add(MaterialState.pressed);
    final Color effectiveInactivePressedOverlayColor =
        widget.overlayColor?.resolve(inactivePressedStates) ??
            radioTheme.overlayColor?.resolve(inactivePressedStates) ??
            effectiveActiveColor.withAlpha(kRadialReactionAlpha);

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      child: buildToggleable(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        mouseCursor: effectiveMouseCursor,
        size: size,
        painter: _painter
          ..position = position
          ..reaction = reaction
          ..reactionFocusFade = reactionFocusFade
          ..reactionHoverFade = reactionHoverFade
          ..inactiveReactionColor = effectiveInactivePressedOverlayColor
          ..reactionColor = effectiveActivePressedOverlayColor
          ..hoverColor = effectiveHoverOverlayColor
          ..focusColor = effectiveFocusOverlayColor
          ..splashRadius = widget.splashRadius ??
              radioTheme.splashRadius ??
              kRadialReactionRadius
          ..downPosition = downPosition
          ..isFocused = states.contains(MaterialState.focused)
          ..isHovered = states.contains(MaterialState.hovered)
          ..activeColor = effectiveActiveColor
          ..inactiveColor = effectiveInactiveColor,
      ),
    );
  }
}

const double _kOuterRadius = 10.0;
const double _kInnerRadius = 2.7;

class _RadioPainter extends ToggleablePainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Offset center = (Offset.zero & size).center;
    final Paint paint = Paint()
      ..color = Color.lerp(inactiveColor, activeColor, position.value)!
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..fillType = PathFillType.evenOdd
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: _kOuterRadius,
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(_kOuterRadius - 2, _kInnerRadius, position.value)!,
        ),
      );
    canvas.drawPath(path, paint);
  }
}
