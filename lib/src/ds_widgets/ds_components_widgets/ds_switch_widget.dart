import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';

class DSSwitch extends StatefulWidget {
  const DSSwitch({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<DSSwitch> createState() => _DSSwitchState();
}

class _DSSwitchState extends State<DSSwitch> with TickerProviderStateMixin {
  late TapGestureRecognizer _tap;
  late HorizontalDragGestureRecognizer _drag;

  late AnimationController _positionController;
  late CurvedAnimation position;

  late AnimationController _reactionController;
  late Animation<double> _reaction;

  bool get isInteractive => widget.onChanged != null;
  bool needsPositionAnimation = false;

  @override
  void initState() {
    super.initState();

    _tap = TapGestureRecognizer()
      ..onTapDown = _handleTapDown
      ..onTapUp = _handleTapUp
      ..onTap = _handleTap
      ..onTapCancel = _handleTapCancel;
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd;

    _positionController = AnimationController(
      duration: _kToggleDuration,
      value: widget.value ? 1.0 : 0.0,
      vsync: this,
    );
    position = CurvedAnimation(
      parent: _positionController,
      curve: Curves.linear,
    );
    _reactionController = AnimationController(
      duration: _kReactionDuration,
      vsync: this,
    );
    _reaction = CurvedAnimation(
      parent: _reactionController,
      curve: Curves.ease,
    );
  }

  @override
  void didUpdateWidget(DSSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (needsPositionAnimation || oldWidget.value != widget.value) {
      _resumePositionAnimation(isLinear: needsPositionAnimation);
    }
  }

  void _resumePositionAnimation({bool isLinear = true}) {
    needsPositionAnimation = false;
    position
      ..curve = isLinear ? Curves.linear : Curves.ease
      ..reverseCurve = isLinear ? Curves.linear : Curves.ease.flipped;
    if (widget.value) {
      _positionController.forward();
    } else {
      _positionController.reverse();
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
    }
    _reactionController.forward();
  }

  void _handleTap() {
    if (isInteractive) {
      widget.onChanged!(!widget.value);
      _emitVibration();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
      _reactionController.reverse();
    }
  }

  void _handleTapCancel() {
    if (isInteractive) {
      _reactionController.reverse();
    }
  }

  void _handleDragStart(DragStartDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
      _reactionController.forward();
      _emitVibration();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (isInteractive) {
      position
        ..curve = Curves.linear
        ..reverseCurve = Curves.linear;
      final double delta = details.primaryDelta! / _kTrackInnerLength;
      switch (Directionality.of(context)) {
        case TextDirection.rtl:
          _positionController.value -= delta;
          break;
        case TextDirection.ltr:
          _positionController.value += delta;
          break;
      }
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      needsPositionAnimation = true;
    });
    if (position.value >= 0.5 != widget.value) {
      widget.onChanged!(!widget.value);
    }
    _reactionController.reverse();
  }

  void _emitVibration() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        HapticFeedback.lightImpact();
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);

    final bool isDisable = widget.onChanged == null;
    late final Color backgroundColor;
    late final Color foregroundColor;

    if (isDisable) {
      backgroundColor = dsTheme.colors.neutral.low;
      foregroundColor = dsTheme.colors.neutral.high;
    } else {
      backgroundColor = widget.value
          ? dsTheme.colors.brand.secondary.pure
          : dsTheme.colors.neutral.medium;
      foregroundColor = dsTheme.colors.neutral.light;
    }

    if (needsPositionAnimation) {
      _resumePositionAnimation();
    }
    return MouseRegion(
      cursor: isInteractive && kIsWeb
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      child: _CupertinoSwitchRenderObjectWidget(
        value: widget.value,
        activeColor: backgroundColor,
        trackColor: dsTheme.colors.neutral.low,
        thumbColor: foregroundColor,
        onChanged: widget.onChanged,
        state: this,
      ),
    );
  }

  @override
  void dispose() {
    _tap.dispose();
    _drag.dispose();

    _positionController.dispose();
    _reactionController.dispose();
    super.dispose();
  }
}

class _CupertinoSwitchRenderObjectWidget extends LeafRenderObjectWidget {
  const _CupertinoSwitchRenderObjectWidget({
    Key? key,
    required this.value,
    required this.activeColor,
    required this.trackColor,
    required this.thumbColor,
    required this.onChanged,
    required this.state,
  }) : super(key: key);

  final bool value;
  final Color activeColor;
  final Color trackColor;
  final Color thumbColor;
  final ValueChanged<bool>? onChanged;
  final _DSSwitchState state;

  @override
  _RenderCupertinoSwitch createRenderObject(BuildContext context) {
    return _RenderCupertinoSwitch(
      value: value,
      activeColor: activeColor,
      trackColor: trackColor,
      thumbColor: thumbColor,
      onChanged: onChanged,
      state: state,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderCupertinoSwitch renderObject,
  ) {
    renderObject
      ..value = value
      ..activeColor = activeColor
      ..trackColor = trackColor
      ..thumbColor = thumbColor
      ..onChanged = onChanged;
  }
}

const double _kTrackWidth = 48.0;
const double _kTrackHeight = 28.0;
const double _kTrackRadius = 28;
const double _kTrackInnerStart = _kTrackHeight / 2.0;
const double _kTrackInnerEnd = _kTrackWidth - _kTrackInnerStart;
const double _kTrackInnerLength = _kTrackInnerEnd - _kTrackInnerStart;
const double _kSwitchWidth = 48.0;
const double _kSwitchHeight = 28.0;
const Duration _kReactionDuration = Duration(milliseconds: 300);
const Duration _kToggleDuration = Duration(milliseconds: 200);

class _RenderCupertinoSwitch extends RenderConstrainedBox {
  _RenderCupertinoSwitch({
    required bool value,
    required Color activeColor,
    required Color trackColor,
    required Color thumbColor,
    ValueChanged<bool>? onChanged,
    required _DSSwitchState state,
  })  : _value = value,
        _activeColor = activeColor,
        _trackColor = trackColor,
        _thumbPainter = CupertinoThumbPainter.switchThumb(color: thumbColor),
        _onChanged = onChanged,
        _state = state,
        super(
          additionalConstraints: const BoxConstraints.tightFor(
            width: _kSwitchWidth,
            height: _kSwitchHeight,
          ),
        ) {
    state.position.addListener(markNeedsPaint);
    state._reaction.addListener(markNeedsPaint);
  }

  final _DSSwitchState _state;

  bool get value => _value;
  bool _value;
  set value(bool value) {
    if (value == _value) {
      return;
    }
    _value = value;
    markNeedsSemanticsUpdate();
  }

  Color get activeColor => _activeColor;
  Color _activeColor;
  set activeColor(Color value) {
    if (value == _activeColor) {
      return;
    }
    _activeColor = value;
    markNeedsPaint();
  }

  Color get trackColor => _trackColor;
  Color _trackColor;
  set trackColor(Color value) {
    if (value == _trackColor) {
      return;
    }
    _trackColor = value;
    markNeedsPaint();
  }

  Color get thumbColor => _thumbPainter.color;
  CupertinoThumbPainter _thumbPainter;
  set thumbColor(Color value) {
    if (value == thumbColor) {
      return;
    }
    _thumbPainter = CupertinoThumbPainter.switchThumb(color: value);
    markNeedsPaint();
  }

  ValueChanged<bool>? get onChanged => _onChanged;
  ValueChanged<bool>? _onChanged;
  set onChanged(ValueChanged<bool>? value) {
    if (value == _onChanged) {
      return;
    }
    final bool wasInteractive = isInteractive;
    _onChanged = value;
    if (wasInteractive != isInteractive) {
      markNeedsPaint();
      markNeedsSemanticsUpdate();
    }
  }

  bool get isInteractive => onChanged != null;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry), '$event $entry');
    if (event is PointerDownEvent && isInteractive) {
      _state._drag.addPointer(event);
      _state._tap.addPointer(event);
    }
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    if (isInteractive) {
      config.onTap = _state._handleTap;
    }

    config
      ..isEnabled = isInteractive
      ..isToggled = _value;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    final double currentValue = _state.position.value;
    final double currentReactionValue = _state._reaction.value;

    final double visualPosition = currentValue;

    final Paint paint = Paint()
      ..color = Color.lerp(trackColor, activeColor, currentValue)!;

    final Rect trackRect = Rect.fromLTWH(
      offset.dx + (size.width - _kTrackWidth) / 2.0,
      offset.dy + (size.height - _kTrackHeight) / 2.0,
      _kTrackWidth,
      _kTrackHeight,
    );
    final RRect trackRRect = RRect.fromRectAndRadius(
      trackRect,
      const Radius.circular(_kTrackRadius),
    );
    canvas.drawRRect(trackRRect, paint);

    final double currentThumbExtension =
        CupertinoThumbPainter.extension * currentReactionValue;
    final double thumbLeft = lerpDouble(
      trackRect.left + _kTrackInnerStart - CupertinoThumbPainter.radius,
      trackRect.left +
          _kTrackInnerEnd -
          CupertinoThumbPainter.radius -
          currentThumbExtension,
      visualPosition,
    )!;
    final double thumbRight = lerpDouble(
      trackRect.left +
          _kTrackInnerStart +
          CupertinoThumbPainter.radius +
          currentThumbExtension,
      trackRect.left + _kTrackInnerEnd + CupertinoThumbPainter.radius,
      visualPosition,
    )!;
    final double thumbCenterY = offset.dy + size.height / 2.0;
    final Rect thumbBounds = Rect.fromLTRB(
      thumbLeft,
      thumbCenterY - CupertinoThumbPainter.radius,
      thumbRight,
      thumbCenterY + CupertinoThumbPainter.radius,
    );

    _clipRRectLayer.layer = context.pushClipRRect(
      needsCompositing,
      Offset.zero,
      thumbBounds,
      trackRRect,
      (PaintingContext innerContext, Offset offset) {
        _thumbPainter.paint(innerContext.canvas, thumbBounds);
      },
      oldLayer: _clipRRectLayer.layer,
    );
  }

  final LayerHandle<ClipRRectLayer> _clipRRectLayer =
      LayerHandle<ClipRRectLayer>();

  @override
  void dispose() {
    _clipRRectLayer.layer = null;
    super.dispose();
  }
}

class CupertinoThumbPainter {
  const CupertinoThumbPainter({
    required this.color,
  });

  const CupertinoThumbPainter.switchThumb({
    required Color color,
  }) : this(color: color);

  final Color color;

  static const double radius = 12.0;
  static const double extension = 7.0;

  void paint(Canvas canvas, Rect rect) {
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(rect.shortestSide / 2.0),
    );

    canvas.drawRRect(rrect, Paint()..color = color);
  }
}
