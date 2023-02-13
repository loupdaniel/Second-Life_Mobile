import 'package:flutter/material.dart';
import 'package:secondlife_mobile/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Twitch Player Example',
      //title: 'Perspective PageView',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BottomNavBar(),
    );
  }
}
