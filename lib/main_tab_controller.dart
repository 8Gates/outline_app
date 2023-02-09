import 'package:flutter/material.dart';

class MainTabController extends StatelessWidget {
  final String title = 'First Outline';
  
  static const tabs = [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.description_rounded)),
    Tab(icon: Icon(Icons.question_answer_outlined)),
    Tab(icon: Icon(Icons.dangerous)),
  ];
  final screens = [
    const Align(alignment: Alignment.center, child: Text('temp screen 1')),
    const Align(alignment: Alignment.center, child: Text('temp screen 2')),
    const Align(alignment: Alignment.center, child: Text('temp screen 3')),
    const Align(alignment: Alignment.center, child: Text('temp screen 4')),
  ];

  MainTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(fontFamily: 'Road_Rage'),),
          backgroundColor: const Color.fromARGB(255, 200, 55, 0),
          centerTitle: true,
          bottom: ColoredTabBar(const TabBar(tabs: tabs,))
          ),
          body: TabBarView(children: screens,)
      )
    );
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.tabBar, {super.key});
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: const Color.fromARGB(255, 180, 180, 180),
    child: tabBar,
  );
}
