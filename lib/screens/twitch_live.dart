import 'package:flutter/material.dart';

class TwitchLive extends StatefulWidget {
  const TwitchLive({super.key});

  @override
  State<TwitchLive> createState() => _TwitchLiveState();
}

class _TwitchLiveState extends State<TwitchLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitch Live'),
      ),
      body: const Center(
        child: Text(
          'Twitch Live Screen',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
