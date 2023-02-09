import 'package:flutter/material.dart';

class CurrentMusic extends StatefulWidget {
  const CurrentMusic({super.key});

  @override
  State<CurrentMusic> createState() => _CurrentMusicState();
}

class _CurrentMusicState extends State<CurrentMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Music'),
      ),
      body: const Center(
        child: Text(
          'Current Music Screen',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
