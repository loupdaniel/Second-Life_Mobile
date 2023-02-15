import 'package:flutter/material.dart';

class SecondArtist extends StatefulWidget {
  const SecondArtist({super.key});

  @override
  State<SecondArtist> createState() => _SecondArtistState();
}

class _SecondArtistState extends State<SecondArtist> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          'Artist 2 Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
