import 'package:flutter/material.dart';
import 'package:flutter_twitch_player/flutter_twitch_player.dart';

class TwitchLive extends StatefulWidget {
  const TwitchLive({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TwitchLive> createState() => _TwitchLiveState();
}

class _TwitchLiveState extends State<TwitchLive> {
  TwitchController twitchController = TwitchController();
  @override
  Widget build(BuildContext context) {
    twitchController.onEnterFullscreen(() => print("Entered fullscreen"));
    twitchController.onExitFullscreen(() => print("Exited fullscreen"));
    twitchController.onStateChanged((state) => print(state));
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TwitchPlayerIFrame(
              controller: twitchController,
              channel: "sah_yang",
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}
