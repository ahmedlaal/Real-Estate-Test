import 'package:flutter/material.dart';
import 'package:realstateapp/screens/home.dart';
import 'package:realstateapp/screens/home_page.dart';
import 'package:realstateapp/screens/serach_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
