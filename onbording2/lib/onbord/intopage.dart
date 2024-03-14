import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onbording2/onbord/color.dart';
import 'package:onbording2/onbord/onbord_model.dart';

class Intopage extends StatelessWidget {
  final PageData animatedClass;

  const Intopage({Key? key, required this.animatedClass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: theme.brightness == Brightness.dark
              ? [
                  AppColor.onbordingdark,
                  AppColor.onbordingdark1,
                ] // Koyu tema için
              : [
                  AppColor.onbordinglight,
                  AppColor.onbordinglight1,
                ], // Açık tema için
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 80),
                ),
              ),
              alignment: Alignment.center,
              child: Lottie.network(
                animatedClass.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: theme.brightness == Brightness.dark
                      ? [
                          AppColor.onbordingdark,
                          AppColor.onbordingdark1,
                        ] // Koyu tema için
                      : [
                          AppColor.onbordinglight,
                          AppColor.onbordinglight1,
                        ], // Açık tema için
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
