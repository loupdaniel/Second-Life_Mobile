import 'package:flutter/material.dart';

class ThirdArtist extends StatefulWidget {
  const ThirdArtist({super.key});

  @override
  State<ThirdArtist> createState() => _ThirdArtistState();
}

class _ThirdArtistState extends State<ThirdArtist> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          'Artist 3 Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
