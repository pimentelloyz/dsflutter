import 'package:flutter/material.dart';

class DSTypographyTokens {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle headline6;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle label1;
  final TextStyle label2;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle button;
  final TextStyle caption;

  const DSTypographyTokens({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.headline6,
    required this.subtitle1,
    required this.subtitle2,
    required this.label1,
    required this.label2,
    required this.body1,
    required this.body2,
    required this.button,
    required this.caption,
  });

  factory DSTypographyTokens.fromTextTheme(TextTheme textTheme) {
    return DSTypographyTokens(
      headline1: textTheme.headline1!,
      headline2: textTheme.headline2!,
      headline3: textTheme.headline3!,
      headline4: textTheme.headline4!,
      headline5: textTheme.headline5!,
      headline6: textTheme.headline6!,
      subtitle1: textTheme.subtitle1!,
      subtitle2: textTheme.subtitle2!,
      label1: textTheme.bodyText1!,
      label2: textTheme.bodyText2!,
      body1: textTheme.bodyText1!,
      body2: textTheme.bodyText2!,
      button: textTheme.button!,
      caption: textTheme.caption!,
    );
  }

  TextTheme toTextTheme() {
    return TextTheme(
      headline1: headline1,
      headline2: headline2,
      headline3: headline3,
      headline4: headline4,
      headline5: headline5,
      headline6: headline6,
      subtitle1: subtitle1,
      subtitle2: subtitle2,
      bodyText1: label1,
      bodyText2: label2,
      button: button,
      caption: caption,
    );
  }
}
