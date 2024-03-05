import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onbording1/confing/my_button.dart';
import 'package:onbording1/home/home.dart';
import 'package:onbording1/onbording/intopage1.dart';
import 'package:onbording1/onbording/intopage2.dart';
import 'package:onbording1/onbording/intpage3.dart';
import 'package:onbording1/themes/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0;
  List<bool> _buttonsVisibe = [false, false, false];

  final List<Widget> pages = [
    Intopage1(),
    Intopage2(),
    Intopage3(),
  ];

  ThemeData getTheme() {
    return Theme.of(context);
  }

  @override
  void initState() {
    for (int i = 0; i < _buttonsVisibe.length; i++) {
      Timer(Duration(milliseconds: 5000 * (i + 1)), () {
        setState(() {
          _buttonsVisibe[i] = true;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = getTheme();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: pages,
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _buttonsVisibe[_currentPage] ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: pages.length,
                      effect: WormEffect(), // You can choose different effects
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          onPressed: () {
                            _controller.jumpToPage(pages.length - 1);
                          },
                          primaryColor: AppColor.lightBg,
                          onPrimaryColor: theme.cardColor,
                          elevation: 5,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          text: 'Skip',
                        ),
                        MyButton(
                          onPressed: () {
                            if (_currentPage == pages.length - 1) {
                              // If it's the last page, navigate to the next screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            } else {
                              // If it's not the last page, move to the next page
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          primaryColor: AppColor.lightBg,
                          onPrimaryColor: theme.cardColor,
                          elevation: 5,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          text: _currentPage == pages.length - 1
                              ? "Done"
                              : "Next",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
