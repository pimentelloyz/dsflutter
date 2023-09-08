import 'package:flutter/widgets.dart';

class DSFeedbackColorsTokens {
  final DSFeedbackColorsToken success;
  final DSFeedbackColorsToken informative;
  final DSFeedbackColorsToken helper;
  final DSFeedbackColorsToken positive;
  final DSFeedbackColorsToken warning;

  const DSFeedbackColorsTokens({
    required this.success,
    required this.informative,
    required this.helper,
    required this.positive,
    required this.warning,
  });

  DSFeedbackColorsTokens copyWith({
    DSFeedbackColorsToken? success,
    DSFeedbackColorsToken? informative,
    DSFeedbackColorsToken? helper,
    DSFeedbackColorsToken? positive,
    DSFeedbackColorsToken? warning,
  }) {
    return DSFeedbackColorsTokens(
      success: success ?? this.success,
      informative: informative ?? this.informative,
      helper: helper ?? this.helper,
      positive: positive ?? this.positive,
      warning: warning ?? this.warning,
    );
  }
}

class DSFeedbackColorsToken {
  final Color pure;
  final Color light;

  const DSFeedbackColorsToken({
    required this.pure,
    required this.light,
  });

  DSFeedbackColorsToken copyWith({
    Color? pure,
    Color? light,
  }) {
    return DSFeedbackColorsToken(
      pure: pure ?? this.pure,
      light: light ?? this.light,
    );
  }
}
