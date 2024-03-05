import 'package:flutter/material.dart';
import 'package:onbording2/onboard/onbord_model.dart';

class OnboardPage extends StatelessWidget {
  final PageData page;

  const OnboardPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Image.network(page.url),
        ),
      ],
    );
  }
}
