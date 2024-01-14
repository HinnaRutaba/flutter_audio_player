import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color primarySeedColor = const Color(0xFF192256);
  static Color secondarySeedColor = const Color(0xFF9C254D);

  static final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    tones: FlexTones.vivid(Brightness.light),
    primaryKey: backGroundColor,
    primary: backGroundColor,
    secondary: accentColor,
    shadow: shadowColor,
    background: backGroundColor,
    primaryContainer: containerColor,
  );

  static final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: primarySeedColor,
    secondaryKey: secondarySeedColor,
    tones: FlexTones.vivid(Brightness.dark),
  );

  static final appColorSchemeLight = schemeLight;
  static final appColorSchemeDark = schemeDark;

  static const Color backGroundColor = Color(0xffC0DBEC);
  static const Color containerColor = Color(0xffC9E2EE);
  static const Color shadowColor = Color(0xff5182B5);
  static const Color mutedColor = Color(0xff9BA9B5);
  static const Color darkColor = Color(0xff4C6E81);
  static const Color accentColor = Color(0xffFFB07C);
}
