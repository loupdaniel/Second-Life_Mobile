import 'package:flutter/material.dart';
import 'package:secondlife_mobile/clipper.dart';
import 'package:secondlife_mobile/wave_base_painter.dart';

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
          Positioned(
            height: height,
            width: width,
            child: Material(
              elevation: 16,
              color: const Color(0xFFd6dde5), //Background Color
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
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
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: <Widget>[
                        const Text('time'),
                        const SizedBox(
                          width: 8,
                        ),
                        buildWave(),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('end'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRecordPlayer() {
    return Container(
      height: 190,
      width: 190,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/vinyl.png'),
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
            Colors.blue,
            BlendMode.color,
          ),
        ),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/SL.png',
          height: 150,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildWave() {
    return SizedBox(
      width: 260,
      height: 40,
      child: CustomPaint(
        painter: WaveBasePainter(),
        child: ClipRect(
          clipper: WaveClipper(),
        ),
      ),
    );
  }
}
