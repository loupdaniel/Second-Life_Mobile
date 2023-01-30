import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayerApp(),
    ),
  );
}

class PlayerApp extends StatefulWidget {
  const PlayerApp({super.key});

  @override
  State<PlayerApp> createState() => _PlayerAppState();
}

class _PlayerAppState extends State<PlayerApp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(
                height: 90,
              ),
              const Text(
                'Music title',
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Music artist',
              ),
              const SizedBox(
                height: 75,
              ),
              buildRecordPlayer(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildRecordPlayer() {
    return Container(
      height: 290,
      width: 290,
      color: Colors.green,
      child: ClipOval(
        child: Image.asset(
          'images/cover.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
