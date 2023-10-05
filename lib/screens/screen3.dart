import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final bool darkMode;
  const ThirdScreen(this.darkMode, {super.key});
  static const routeName = 'screen3';

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
            DefaultTabController.of(context).animateTo(0);
          },
          child: const Text('return to park selection'),
        ),
      ),
      backgroundColor: widget.darkMode? const Color.fromARGB(255, 61, 61, 61) : const Color.fromARGB(244, 240, 240, 240)
    );
  }
}