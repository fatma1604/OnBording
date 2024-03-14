import 'package:flutter/material.dart';
import 'package:onbording2/home/home.dart';
import 'package:onbording2/onbord/intopage.dart';
import 'package:onbording2/onbord/onboard_data.dart';
import 'package:onbording2/onbord/onbordbutton.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  // Diğer özel renkler, yazı stilleri vb.
);

// Gündüz teması renkleri
final lightTheme = ThemeData(
  brightness: Brightness.light,
  // Diğer özel renkler, yazı stilleri vb.
);
class OnboardingAnimation extends StatefulWidget {
  @override
  _OnboardingAnimationState createState() => _OnboardingAnimationState();
}

class _OnboardingAnimationState extends State<OnboardingAnimation> {
  PageController _controller = PageController();
  bool onLastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastpage = (index == pages.length - 1);
              });
            },
            controller: _controller,
            children: pages.map((page) {
              return Intopage(animatedClass: page);
            }).toList(),
          ),
          Positioned(
            bottom: 200.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                      controller: _controller, count: pages.length),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OnButton(
                      onPressed: () {
                        _controller.jumpToPage(pages.length - 1);
                      },
                      primaryColor: Colors.white54,
                      onPrimaryColor: Colors.red,
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      text: 'Skip',
                    ),
                    onLastpage
                        ? OnButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Home();
                              }));
                            },
                            primaryColor: Colors.white54,
                            onPrimaryColor: Colors.red,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            text: "Done")
                        : OnButton(
                            onPressed: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            primaryColor: Colors.white54,
                            onPrimaryColor: Colors.red,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            text: "Next")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
