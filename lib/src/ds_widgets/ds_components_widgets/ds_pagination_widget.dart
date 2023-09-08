import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';

class DSPagination extends StatelessWidget {
  const DSPagination({
    Key? key,
    this.onColor = false,
    this.tabController,
  }) : super(key: key);

  final bool onColor;
  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);

    const double diameter = 8.0;
    late final Color selectedColor;
    late final Color unselectedColor;

    if (onColor) {
      selectedColor = dsTheme.colors.neutral.light;
      unselectedColor = dsTheme.colors.neutral.light.withOpacity(0.24);
    } else {
      selectedColor = dsTheme.colors.brand.primary.pure;
      unselectedColor = dsTheme.colors.brand.primary.pure.withOpacity(0.24);
    }

    return TabPageSelector(
      controller: tabController,
      color: unselectedColor,
      selectedColor: selectedColor,
      indicatorSize: diameter,
      borderStyle: BorderStyle.none,
    );
  }
}
