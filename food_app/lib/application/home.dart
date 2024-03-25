import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFF4B3A),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.19,
                height: MediaQuery.of(context).size.height * 0.19,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'icons/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset('icons/food-text.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('images/toy-faces2.png',
                      width: MediaQuery.of(context).size.width * 0.6),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('images/toy-faces1.png',
                      width: MediaQuery.of(context).size.width * 0.7),
                ),
                Positioned(
                    width: MediaQuery.of(context).size.width,
                    right: 0,
                    top: 160,
                    child: Image.asset('icons/gradient1.png')),
                Positioned(
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    top: 260,
                    child: Image.asset('icons/gradient.png')),
              ],
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width * 0.85, 80))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Get started',
                    style: TextStyle(fontSize: 22, color: Color(0xffFF460A)),
                  )),
            ),
          ],
        )));
  }
}
