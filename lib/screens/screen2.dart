import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final bool darkMode;
  const SecondScreen(this.darkMode, {super.key});
  static const routeName = 'screen2';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            DefaultTabController.of(context).animateTo(0);
          },
          child: const Text('return to park selection'),
        ),
      ),
      backgroundColor: widget.darkMode? const Color.fromARGB(255, 61, 61, 61) : const Color.fromARGB(244, 240, 240, 240)
    );
  }
}