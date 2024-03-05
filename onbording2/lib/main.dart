import 'package:flutter/material.dart';
import 'package:onbording2/onboard/onbording_animation.dart';
import 'package:onbording2/themes/theme.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightMode,
    darkTheme: AppTheme.darkMode,
    themeMode: ThemeMode.system,
    home: OnboardingAnimation(),
  ));
}
