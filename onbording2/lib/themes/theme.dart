import 'package:flutter/material.dart';

import 'package:onbording2/themes/color.dart';

class AppTheme {
  AppTheme._();

  /* ------------- Light Theme ------------- */

  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: Colors.transparent,
      /* primary: Color.fromARGB(255, 0, 0, 0),
      onBackground: Colors.blue,
      onPrimary: Colors.white, */
    ),
  );

  /* ------------- Dark theme ------------- */

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 7, 69, 119),
    ),
  );
}
