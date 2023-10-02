import 'package:flutter/material.dart';
import 'package:outline_app/screens/screen2.dart';
import 'package:outline_app/screens/screen3.dart';

import 'main_drawer.dart';
import 'list_tiles/list_tile_park.dart';

class MainTabController extends StatefulWidget {
  static const tabs = [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.sunny_snowing)),
    Tab(icon: Icon(Icons.edit_note)),
    Tab(icon: Icon(Icons.dangerous)),
  ];

  const MainTabController({super.key});

  @override
  State<MainTabController> createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  final String title = 'National Parks';
  bool darkMode = false;

  final screens = [
    const Align(alignment: Alignment.center, child: ListTilePark()),
    const SecondScreen(),
    const ThirdScreen(),
    const Align(alignment: Alignment.center, child: Text('temp screen 4')),
  ];

  void flipDarkMode(){
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(fontFamily: 'Road_Rage'),),
          backgroundColor: darkMode? dark() : const Color.fromARGB(255, 200, 55, 0),
          centerTitle: true,
          bottom: ColoredTabBar(const TabBar(tabs: MainTabController.tabs), darkMode)
          ),
          drawer: MainDrawer(darkMode, flipDarkMode: flipDarkMode),
          body: 
            TabBarView(children: screens), 
            backgroundColor: darkMode? dark() : const Color.fromARGB(244, 240, 240, 240)
      )
    );
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.tabBar, this.darkMode, {super.key});
  final TabBar tabBar;
  final darkMode;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: darkMode? const Color.fromARGB(255, 80, 80, 80) : const Color.fromARGB(255, 124, 48, 13),
    child: tabBar,
  );
}

dark(){
  return const Color.fromARGB(255, 61, 61, 61);
}