import 'package:flutter/material.dart';
import 'package:onbording1/onbording/onbording_screen.dart';
import 'package:onbording1/themes/theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightMode,
    darkTheme: AppTheme.darkMode,
    themeMode: ThemeMode.system,
    home: OnbordingScreen(),
  ));
}
