import 'package:flutter/material.dart';
import 'package:food_app/application/home.dart';
import 'package:food_app/application/login.dart';
import 'package:food_app/application/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login':(context) => const AuthPage(),
        '/mainScreen':(context) => const MainScreen(),
      },
    );
  }
}
