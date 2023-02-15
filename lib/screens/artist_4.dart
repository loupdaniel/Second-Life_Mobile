import 'package:flutter/material.dart';

class FourthArtist extends StatefulWidget {
  const FourthArtist({super.key});

  @override
  State<FourthArtist> createState() => _FourthArtistState();
}

class _FourthArtistState extends State<FourthArtist> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          'Artist 4 Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
