/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondlife_mobile/model.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => PlayerModel(), child: const PlayerApp()),
    ),
  );
}

class PlayerApp extends StatefulWidget {
  const PlayerApp({super.key});

  @override
  State<PlayerApp> createState() => _PlayerAppState();
}

class _PlayerAppState extends State<PlayerApp> with TickerProviderStateMixin {
  //AnimationController? _controller;
  //Animation? _waveAnim;
  //Animation? _waveConstAmpAnim;
  late PlayerModel model;
/*
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..addListener(() => setState(() {}));
    _waveAnim =
        Tween<double>(begin: 1, end: 1).animate(_controller! /*null safe*/);
    _waveConstAmpAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        curve: Curves.easeInSine, parent: _controller! /*null safe*/));
    _controller!.forward(); //null safe 6:32
  }
*/
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    model = Provider.of<PlayerModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF7a5ebb),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 210,
            child: bulidMusicList(),
          ),
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
                      children: const <Widget>[
                        Text('time'),
                        SizedBox(
                          width: 8,
                        ),
                        /*buildWave(width),*/
                        SizedBox(
                          width: 8,
                        ),
                        Text('end'),
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
      height: 270,
      width: 270,
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
          height: 165,
          width: 165,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

ListView bulidMusicList() {
  return ListView.separated(
    shrinkWrap: true,
    separatorBuilder: (_, __) => const Divider(
      thickness: 1,
      height: 0,
      color: Colors.grey,
    ),
    itemCount: model.musicList.length,
    itemBuilder: (context, index) {
      bool isIndexCurrentTrack = false;
      if (index == model.currentTrack) isIndexCurrentTrack = true;

      return Container(
        color: const Color(0xff6a52a4),
        child: GestureDetector(
          onTap: () {},
          child: ListTile(
            leading: const Icon(Icons.bubble_chart),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(model.musicList[index].name),
            ),
            subtitle: Text(model.musicList[index].artistName),
            trailing: Text(
                model.musicList[index].duration.toString().substring(3, 7)),
          ),
        ),
      );
    },
  );
}
*/