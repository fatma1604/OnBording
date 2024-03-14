import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onbording1/confing/my_button.dart';
import 'package:onbording1/home/home.dart';
import 'package:onbording1/onbording/intopage1.dart';
import 'package:onbording1/onbording/intopage2.dart';
import 'package:onbording1/onbording/intpage3.dart';
import 'package:onbording1/themes/color.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int _currentPage = 0;
  List<bool> _buttonsVisible = [false, false, false];

  final List<Widget> pages = [
    Intopage1(),
    Intopage2(),
    Intopage3(),
  ];

  @override
  void initState() {
    super.initState();
    // Her sayfanın initState'i çağrıldığında 5 saniyelik bekleme süresi başlatılıyor
    for (int i = 0; i < _buttonsVisible.length; i++) {
      Timer(Duration(seconds: 5 * (i + 1)), () {
        setState(() {
          _buttonsVisible[i] = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Sayfaları göstermek için PageView kullanmıyoruz
          // Sadece _currentPage'e göre ilgili sayfayı görüntülüyoruz
          pages[_currentPage],
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _buttonsVisible[_currentPage] ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      onPressed: () {
                        if (_currentPage > 0) {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      },
                      primaryColor: AppColor.lightBg,
                      onPrimaryColor: Theme.of(context).cardColor,
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      text: 'Back',
                    ),
                    MyButton(
                      onPressed: () {
                        if (_currentPage < pages.length - 1) {
                          setState(() {
                            _currentPage++;
                          });
                        } else {
                          // Eğer son sayfadaysa, ana ekrana git
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }
                      },
                      primaryColor: AppColor.lightBg,
                      onPrimaryColor: Theme.of(context).cardColor,
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      text: _currentPage == pages.length - 1 ? "Done" : "Next",
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