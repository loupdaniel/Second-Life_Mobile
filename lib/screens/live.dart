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
  int currentIndex = 0;
  late PageController _controller;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    twitchController.onEnterFullscreen(() => print("Entered fullscreen"));
    twitchController.onExitFullscreen(() => print("Exited fullscreen"));
    twitchController.onStateChanged((state) => print(state));
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 234, 244),
        body: Column(
          children: [
            Transform.translate(
              offset: const Offset(-75, 185),
              child: const Text(
                'Watch Live Streaming!',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 205),
              child: SizedBox(
                height: 275, // Size of the Twitch screen
                child: PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TwitchPlayerIFrame(
                        controller: twitchController,
                        channel: "sah_yang",
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TwitchPlayerIFrame(
                        controller: twitchController,
                        channel: "wkgml",
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TwitchPlayerIFrame(
                        controller: twitchController,
                        channel: "cherrypach",
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TwitchPlayerIFrame(
                        controller: twitchController,
                        channel: "s1032204",
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
