import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Bu ekranı Fatma Nur Kamış tasarlamıştır",
          style: TextStyle(
            color: const Color.fromARGB(255, 75, 107, 133),
            fontWeight: FontWeight.w900,
            fontSize: 18,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                offset: Offset(0, 2), // Gölgelendirme yönü ve mesafesi
              ),
            ],
          ),
        ),
      ),
    );
  }
}
