import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSTooltip extends StatelessWidget {
  final String message;
  final void Function()? onTapFunc;
  final Widget childInkWell;

  const DSTooltip({
    Key? key,
    required this.message,
    required this.onTapFunc,
    required this.childInkWell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DSThemeData dsTheme = DSTheme.of(context);

    return Tooltip(
      decoration: BoxDecoration(
        color: dsTheme.colors.brand.primary.dark,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      message: message,
      child: InkWell(
        onTap: onTapFunc,
        child: childInkWell,
      ),
    );
  }
}
