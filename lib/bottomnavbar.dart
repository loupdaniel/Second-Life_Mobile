import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:secondlife_mobile/screens/home.dart';
import 'package:secondlife_mobile/screens/live.dart';
import 'package:secondlife_mobile/screens/music.dart';
import 'package:secondlife_mobile/screens/playlist.dart';
import 'package:secondlife_mobile/screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screens = [
    const MyHomePage(),
    const TwitchLive(),
    const CurrentMusic(),
    const Playlist(),
    const Settings(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          const CurvedNavigationBarItem(
            child: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              'assets/icons/twitch3.png',
              height: 25,
              width: 25,
            ),
            label: 'Live',
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              'assets/icons/music1.png',
              height: 25,
              width: 25,
            ),
            label: 'Music',
          ),
          const CurvedNavigationBarItem(
            child: Icon(
              Icons.playlist_play_rounded,
              size: 25,
            ),
            label: 'Playlist',
          ),
          const CurvedNavigationBarItem(
            child: Icon(
              Icons.settings,
              size: 25,
            ),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: screens[_selectedIndex],
    );
  }
}
