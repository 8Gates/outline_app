import 'package:flutter/material.dart';

import 'main_tab_controller.dart';

class OutlineApp extends StatelessWidget {
  const OutlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: const Color.fromARGB(255, 225, 250, 255)),
      home: MainTabController(),
    );
  }
}
