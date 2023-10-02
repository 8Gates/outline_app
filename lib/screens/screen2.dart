import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  static const routeName = 'screen3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pop(context);
            DefaultTabController.of(context)!.animateTo(0);
          },
          child: const Text('return to park selection'),
        ),
      ),
    );
  }
}