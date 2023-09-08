import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

/// Defines the [Stepper]'s titles position when
/// the type is [StepperType.horizontal].
enum DSStepperTitlePosition {
  /// A horizontal layout of the steps with their titles position.
  inline,

  /// A horizontal layout of the steps with their titles position.
  bottom,
}

/// Defines the [Stepper]'s separator position
/// when the type is [StepperType.horizontal].
enum DSStepperLinePosition {
  /// A horizontal layout of the steps with their separator position in-between
  /// the titles.
  center,

  /// A horizontal layout of the steps with their separator position in-between
  /// the titles.
  top,
}

const TextStyle _kStepStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
);

const Color _kErrorLight = Colors.red;
final Color _kErrorDark = Colors.red.shade400;
const Color _kCircleActiveLight = Colors.white;
const Color _kCircleActiveDark = Colors.black87;
const Color _kDisabledLight = Colors.black38;
const Color _kDisabledDark = Colors.white38;
const double _kStepSize = 24.0;

final List<IconData> icons = [
  DSIcons.number.one,
  DSIcons.number.two,
  DSIcons.number.three,
  DSIcons.number.four,
  DSIcons.number.five,
  DSIcons.number.six,
  DSIcons.number.seven,
  DSIcons.number.eight,
  DSIcons.number.nine,
];

/// A material step used in [Stepper]. The step can have a title and subtitle,
/// the icon its a number and a state that governs its styling.
///
/// See also:
///
///  * [Stepper]
///  * <https://material.io/archive/guidelines/components/steppers.html>
class DSStep {
  /// Creates a step for a [Stepper].
  ///
  /// The [title], [content], and [state] arguments must not be null.
  const DSStep({
    this.icon,
    required this.title,
    this.subtitle,
    required this.content,
    this.state = StepState.indexed,
    this.isActive = false,
  });

  /// The icon of the step.
  final Widget? icon;

  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget? subtitle;

  /// The content of the step that appears below the [title] and [subtitle].
  ///
  /// Below the content, every step has a 'continue' and 'cancel' button.
  final Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final StepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;
}

class DSStepper extends StatefulWidget {
  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  const DSStepper({
    Key? key,
    required this.steps,
    this.physics,
    this.stepIconSize = _kStepSize,
    this.type = StepperType.vertical,
    this.titlePosition = DSStepperTitlePosition.inline,
    this.linePosition = DSStepperLinePosition.top,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.elevation,
    this.padding,
    this.backgroundColor,
  })  : assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  // Background color of stepper
  final Color? backgroundColor;

  // Padding of stepper content
  final EdgeInsets? padding;

  // The elevation of stepper
  final double? elevation;

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [steps] must not change.
  final List<DSStep> steps;

  /// The steps of the stepper icons size.
  final double? stepIconSize;

  /// How the stepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the stepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics? physics;

  /// The type of stepper that determines the layout. In the case of
  /// [StepperType.horizontal], the content of the current step is displayed
  /// underneath as opposed to the [StepperType.vertical] case where it is
  /// displayed in-between.
  final StepperType type;

  /// [StepperType.horizontal], Title and subtitle below the StepIcon.
  /// The default value is `HorizontalTitlePosition.inline`.
  final DSStepperTitlePosition titlePosition;

  /// [StepperType.horizontal], the steps with their in-between the separator
  /// position. The default value is `HorizontalLinePosition.center`.
  final DSStepperLinePosition linePosition;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int>? onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  final ControlsWidgetBuilder? controlsBuilder;

  @override
  State<DSStepper> createState() => _DSStepperState();
}

class _DSStepperState extends State<DSStepper> with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, StepState> _oldStates = <int, StepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(DSStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return (widget.steps.length - 1) == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  bool _isVisited(int index) {
    return widget.currentStep >= index;
  }

  Widget _buildLine(bool visible, int index) {
    final DSThemeData themeData = DSTheme.of(context);
    return Container(
      width: visible ? 1.5 : 0.0,
      height: 16.0,
      color: _isVisited(index + 1)
          ? themeData.colors.brand.primary.dark
          : themeData.colors.neutral.high,
    );
  }

  Color _circleColor(int index) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    if (!_isDark()) {
      return _isVisited(index)
          ? colorScheme.primary
          : colorScheme.onSurface.withOpacity(0.38);
    } else {
      return widget.steps[index].isActive
          ? colorScheme.secondary
          : colorScheme.background;
    }
  }

  Widget _buildCircle(int index, bool oldState) {
    final DSStep step = widget.steps[index];

    final StepState state =
        oldState ? _oldStates[index]! : widget.steps[index].state;

    if (widget.steps[index].icon != null && state != StepState.error) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: widget.steps[index].icon!,
      );
    }

    return Icon(
      icons[index],
      size: widget.stepIconSize ?? _kStepSize,
      color: step.icon != null ? null : _circleColor(index),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
    final StepState state =
        oldState ? _oldStates[index]! : widget.steps[index].state;

    if (widget.steps[index].icon != null && state != StepState.error) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: widget.steps[index].icon!,
      );
    }

    return Icon(
      DSIcons.attention.warning,
      size: widget.stepIconSize ?? _kStepSize,
      color: _isDark() ? _kErrorDark : _kErrorLight,
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == StepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != StepState.error) {
        return _buildCircle(index, false);
      } else {
        return _buildTriangle(index, false);
      }
    }
  }

  Widget _buildVerticalControls(int stepIndex) {
    if (widget.controlsBuilder != null) {
      return widget.controlsBuilder!(
        context,
        ControlsDetails(
          currentStep: widget.currentStep,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel,
          stepIndex: stepIndex,
        ),
      );
    }

    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48.0),
        child: Row(
          children: <Widget>[
            DSButton(
              label: Text(localizations.continueButtonLabel),
              size: DSButtonSize.md,
              type: DSButtonType.primary,
              onPressed: widget.onStepContinue,
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: DSButton(
                label: Text(localizations.cancelButtonLabel),
                size: DSButtonSize.md,
                type: DSButtonType.secondary,
                onPressed: widget.onStepCancel,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _titleStyle(int index) {
    final DSStep step = widget.steps[index];
    final DSThemeData themeData = DSTheme.of(context);

    const double fontSize = 18.5;

    switch (widget.steps[index].state) {
      case StepState.indexed:
      case StepState.complete:
      case StepState.editing:
        return TextStyle(
          color: _isVisited(index)
              ? themeData.colors.brand.primary.dark
              : themeData.colors.neutral.high,
          fontStyle: themeData.typography.subtitle1.fontStyle,
          fontSize: fontSize,
        );
      case StepState.disabled:
        return TextStyle(
          color: step.isActive
              ? themeData.colors.brand.primary.dark
              : themeData.colors.neutral.high,
          fontStyle: themeData.typography.subtitle1.fontStyle,
          fontSize: fontSize,
        );
      case StepState.error:
        return TextStyle(
          color: themeData.colors.feedback.warning.pure,
          fontStyle: themeData.typography.subtitle1.fontStyle,
          fontSize: fontSize,
        );
    }
  }

  TextStyle _subtitleStyle(int index) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    switch (widget.steps[index].state) {
      case StepState.indexed:
      case StepState.editing:
      case StepState.complete:
        return textTheme.caption!;
      case StepState.disabled:
        return textTheme.caption!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case StepState.error:
        return textTheme.caption!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: widget.type == StepperType.horizontal &&
              widget.titlePosition == DSStepperTitlePosition.bottom
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: _titleStyle(index),
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style: _subtitleStyle(index),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildVerticalHeader(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildLine(!_isFirst(index), index - 2),
              const SizedBox(
                height: 7.0,
              ),
              _buildIcon(index),
              const SizedBox(
                height: 7.0,
              ),
              _buildLine(!_isLast(index), index - 1),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: _buildHeaderText(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalBody(int index) {
    final DSThemeData themeData = DSTheme.of(context);
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: widget.stepIconSize,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0.0 : 1.5,
                child: Container(
                  color: _isVisited(index)
                      ? themeData.colors.brand.primary.dark
                      : themeData.colors.neutral.high,
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0.0),
          secondChild: Container(
            margin: const EdgeInsetsDirectional.only(
              start: 60.0,
              end: 24.0,
              bottom: 24.0,
            ),
            child: Column(
              children: <Widget>[
                widget.steps[index].content,
                _buildVerticalControls(index),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isCurrent(index)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }

  Widget _buildVertical() {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          Column(
            key: _keys[i],
            children: <Widget>[
              InkWell(
                onTap: widget.steps[i].state != StepState.disabled
                    ? () {
                        Scrollable.ensureVisible(
                          _keys[i].currentContext!,
                          curve: Curves.fastOutSlowIn,
                          duration: kThemeAnimationDuration,
                        );
                        widget.onStepTapped?.call(i);
                      }
                    : null,
                canRequestFocus: widget.steps[i].state != StepState.disabled,
                child: _buildVerticalHeader(i),
              ),
              _buildVerticalBody(i),
            ],
          ),
      ],
    );
  }

  Widget _buildHorizontalBottomTitle(int i) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: (widget.stepIconSize ?? _kStepSize) + 24,
          child: Center(
            child: _buildIcon(i),
          ),
        ),
        Container(
          child: _buildHeaderText(i),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget _buildHorizontal() {
    final DSThemeData themeData = DSTheme.of(context);
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != StepState.disabled
              ? () {
                  widget.onStepTapped?.call(i);
                }
              : null,
          canRequestFocus: widget.steps[i].state != StepState.disabled,
          child: widget.type == StepperType.horizontal &&
                  widget.titlePosition == DSStepperTitlePosition.bottom
              ? _buildHorizontalBottomTitle(i)
              : Row(
                  children: <Widget>[
                    SizedBox(
                      height: 72.0,
                      child: Center(
                        child: _buildIcon(i),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 12.0),
                      child: _buildHeaderText(i),
                    ),
                  ],
                ),
        ),
        if (!_isLast(i))
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 1.5,
                  color: _isVisited(i)
                      ? themeData.colors.brand.primary.pure
                      : themeData.colors.neutral.medium,
                ),
                if (widget.type == StepperType.horizontal &&
                    widget.titlePosition == DSStepperTitlePosition.bottom &&
                    widget.linePosition == DSStepperLinePosition.top)
                  const SizedBox(height: 48)
                else
                  const SizedBox(height: 0)
              ],
            ),
          ),
      ],
    ];

    return Column(
      children: <Widget>[
        Material(
          color: widget.backgroundColor ?? Colors.white,
          elevation: widget.elevation ?? 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: children,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: widget.physics,
            padding: widget.padding ?? const EdgeInsets.all(24.0),
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                child: widget.steps[widget.currentStep].content,
              ),
              _buildVerticalControls(widget.currentStep),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<Stepper>() != null) {
        throw FlutterError(
          'Steppers must not be nested.\n'
          'The material specification advises that one should avoid embedding '
          'steppers within steppers. '
          'https://material.io/archive/guidelines/components/steppers.html#steppers-usage',
        );
      }
      return true;
    }());

    switch (widget.type) {
      case StepperType.vertical:
        return _buildVertical();
      case StepperType.horizontal:
        return _buildHorizontal();
    }
  }
}
