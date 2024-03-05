import 'package:flutter/material.dart';
import 'package:onbording1/themes/color.dart';
import 'package:onbording1/themes/images.dart';
import 'package:onbording1/themes/text.dart';

class Intopage2 extends StatelessWidget {
  const Intopage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context); // Mevcut tema

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: theme.brightness == Brightness.dark
                  ? [
                      AppColor.onbordingdark,
                      AppColor.onbordingdark1
                    ] // Koyu tema için
                  : [AppColor.onbordinglight, AppColor.onbordinglight1])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: mHeight / 5,
                width: mWidth / 1,
                child: Card(
                  color: theme.brightness == Brightness.dark
                      ? AppColor.obdgcrdlght // Koyu tema için kart rengi
                      : AppColor.obdgcrdark,
                  elevation: 25,
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Text(
                        AppText.onbordinmgO,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              AppImage.onbording2,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}