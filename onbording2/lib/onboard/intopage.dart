import 'package:flutter/material.dart';
import 'package:onbording2/onboard/onbord_model.dart';
import 'package:onbording2/themes/theme.dart';

class Intopage extends StatelessWidget {
  final PageData animatedClass;

  const Intopage({Key? key, required this.animatedClass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color bgColor = theme.brightness == Brightness.light
        ? AppTheme.lightMode.backgroundColor!
        : AppTheme.darkMode.backgroundColor!;
    final Color btnColor = theme.brightness == Brightness.light
        ? AppTheme.lightMode.primaryColor!
        : AppTheme.darkMode.primaryColor!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            bgColor,
            btnColor,
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.light
                    ? Colors.white
                    : Color.fromARGB(104, 8, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 80),
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset(animatedClass.url),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    bgColor,
                    btnColor,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 80),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
