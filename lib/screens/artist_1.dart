import 'package:flutter/material.dart';

class FirstArtist extends StatefulWidget {
  const FirstArtist({super.key});

  @override
  State<FirstArtist> createState() => _FirstArtistState();
}

class _FirstArtistState extends State<FirstArtist> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          'Artist 1 Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
