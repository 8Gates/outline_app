import 'package:flutter/material.dart';

class AnimateToScreen extends StatelessWidget {
  final int screen;
  const AnimateToScreen({super.key, required this.screen});
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigate back to first screen when tapped.
        DefaultTabController.of(context).animateTo(screen);
      },
      child: const Text('home'),
    );
  }
}