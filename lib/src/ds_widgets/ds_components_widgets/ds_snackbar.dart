import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSSnackbar extends SnackBar {
  final double width;
  final String message;
  final BuildContext context;

  static const defaultWidth = 400.0;

  DSSnackbar({
    Key? key,
    this.width = defaultWidth,
    required this.message,
    required this.context,
  }) : super(
          key: key,
          content: Text(message, textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          backgroundColor: DSTheme.of(context).colors.brand.primary.dark,
        );
}
