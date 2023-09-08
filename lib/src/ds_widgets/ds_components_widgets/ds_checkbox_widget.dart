import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';
import '../ds_tokens_widgets/ds_spacing_widget.dart';

enum DSCheckboxState { preselected, unselected, selected, indeterminate }

class DSCheckbox extends StatelessWidget {
  final ValueChanged<DSCheckboxState>? onChanged;
  final DSCheckboxState state;
  final Widget? title;

  const DSCheckbox({
    Key? key,
    this.state = DSCheckboxState.unselected,
    this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);

    final bool isDisable = onChanged == null;
    late final bool? isSelected;
    late final Color backgroundColor;
    late final Color checkColor;
    const double checkSize = 24.0;

    switch (state) {
      case DSCheckboxState.preselected:
        isSelected = true;
        backgroundColor = Colors.transparent;
        checkColor = isDisable
            ? dsTheme.colors.neutral.medium
            : dsTheme.colors.brand.secondary.pure;
        break;
      case DSCheckboxState.unselected:
        isSelected = false;
        backgroundColor = isDisable
            ? dsTheme.colors.neutral.medium
            : dsTheme.colors.neutral.high;
        checkColor = dsTheme.colors.neutral.light;
        break;
      case DSCheckboxState.selected:
        isSelected = true;
        backgroundColor = isDisable
            ? dsTheme.colors.neutral.low
            : dsTheme.colors.brand.secondary.pure;
        checkColor = isDisable
            ? dsTheme.colors.neutral.high
            : dsTheme.colors.neutral.light;
        break;
      case DSCheckboxState.indeterminate:
        isSelected = null;
        backgroundColor = isDisable
            ? dsTheme.colors.neutral.low
            : dsTheme.colors.brand.secondary.pure;
        checkColor = isDisable
            ? dsTheme.colors.neutral.high
            : dsTheme.colors.neutral.light;
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: checkSize,
          width: checkSize,
          child: Checkbox(
            value: isSelected,
            tristate: true,
            onChanged: isDisable
                ? null
                : (value) {
                    onChanged?.call(
                      value == true
                          ? DSCheckboxState.selected
                          : DSCheckboxState.unselected,
                    );
                  },
            checkColor: checkColor,
            fillColor: MaterialStateProperty.all(backgroundColor),
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
