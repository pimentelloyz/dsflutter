import 'ds_brand_colors_tokens.dart';
import 'ds_feedback_colors_tokens.dart';
import 'ds_neutral_colors_tokens.dart';

class DSColorsTokens {
  final DSBrandColorsTokens brand;
  final DSNeutralColorsTokens neutral;
  final DSFeedbackColorsTokens feedback;

  const DSColorsTokens({
    required this.brand,
    required this.neutral,
    required this.feedback,
  });

  DSColorsTokens copyWith({
    DSBrandColorsTokens? brandColors,
    DSNeutralColorsTokens? neutralColors,
    DSFeedbackColorsTokens? feedbackColors,
  }) {
    return DSColorsTokens(
      brand: brandColors ?? brand,
      neutral: neutralColors ?? neutral,
      feedback: feedbackColors ?? feedback,
    );
  }
}
