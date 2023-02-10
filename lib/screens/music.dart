import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CurrentMusic extends StatelessWidget {
  const CurrentMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          'Current Music Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
