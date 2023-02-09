import 'package:flutter/material.dart';
import 'package:secondlife_mobile/bottom_nav.dart';
import 'package:secondlife_mobile/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      children: [
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Perspective PageView',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
      ],
    );
  }
}
