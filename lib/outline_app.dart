import 'package:flutter/material.dart';
import 'package:outline_app/screens/screen2.dart';
import 'package:outline_app/screens/screen3.dart';

import 'main_tab_controller.dart';

class OutlineApp extends StatelessWidget {
  const OutlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color.fromARGB(255, 225, 250, 255)),
      home: MainTabController(),
      routes: {
        SecondScreen.routeName: (context) => const SecondScreen(),
        ThirdScreen.routeName: (context) => const ThirdScreen(),  
      }
    );
  }
}
