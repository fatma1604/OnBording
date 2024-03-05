import 'package:flutter/material.dart';
import 'package:onbording2/config/mybuton.dart';
import 'package:onbording2/home/home.dart';
import 'package:onbording2/onboard/intopage.dart';
import 'package:onbording2/onboard/onboard_data.dart';
import 'package:onbording2/themes/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                    MyButton(
                      onPressed: () {
                        _controller.jumpToPage(pages.length - 1);
                      },
                      primaryColor: AppColor.buttontext,
                      onPrimaryColor: AppColor.button,
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      text: 'Skip',
                    ),
                    onLastpage
                        ? MyButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Home();
                              }));
                            },
                            primaryColor: AppColor.buttontext,
                            onPrimaryColor: Colors.red,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            text: "Done")
                        : MyButton(
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
