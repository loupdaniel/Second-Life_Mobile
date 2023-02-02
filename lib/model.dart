import 'dart:math';

import 'package:flutter/material.dart';
import 'musicdata.dart';

class PlayerModel extends ChangeNotifier {
  List<Music> musicList = [];
  int _currentTrack = 0;

  PlayerModel() {
    for (int i = 0; i < Data.nameList.length; i++) {
      musicList
          .add(Music(artistName: Data.artistList[i], name: Data.nameList[i]));
    }

    musicList.removeWhere(
      (musicItem) => musicItem.name == null || musicItem.artistName == null,
    );

    for (var musicItem in musicList) {
      musicItem.duration = Duration(
          minutes: Random().nextInt(5).clamp(1, 5),
          seconds: Random().nextInt(59));
    }

    for (var music in musicList) {
      print(music.name);
    }
  }

  int get currentTrack => _currentTrack;

  set currentTrack(int currentTrack) {
    _currentTrack = currentTrack;
    notifyListeners();
  }

  resetList() {
    for (var music in musicList) {
      music.isPlaying = false;
    }
  }
}

class Music {
  String? name;
  String? artistName;
  Duration? duration;
  bool? isPlaying = false;
  Music({this.duration, this.artistName, this.isPlaying, this.name});
}
