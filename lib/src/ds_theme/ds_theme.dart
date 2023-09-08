import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ds_theme_data/ds_theme_data.dart';

class DSTheme extends StatelessWidget {
  const DSTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final DSThemeData data;
  final Widget child;

  static final DSThemeData _kFallbackTheme = DSThemeData.fallback();

  static DSThemeData of(BuildContext context) {
    final _InheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    final DSThemeData theme = inheritedTheme?.theme.data ?? _kFallbackTheme;

    return theme;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: this,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<DSThemeData>('data', data, showName: false));
  }
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final DSTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DSTheme(
      data: theme.data,
      child: Theme(
        data: theme.data.toThemeData(),
        child: child,
      ),
    );
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}
