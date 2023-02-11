import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerTiles = [
    ListTile(
      title: const Align(
        alignment: Alignment.topLeft, 
        child: Icon(Icons.close, color: Colors.white)
      ),
      onTap: () { Navigator.pop(context); }
    ),
    aListTile('Fishing'), 
    aListTile('Hunting'),
    aListTile('Camping'),
    aListTile('Swimming'),
    aListTile('Visitor Center'),
  ];
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37), 
      child: ListView(children: drawerTiles,)
    );
  }
}

Widget aListTile(String text){
  return ListTile(
    title: Text(text, 
      style: const TextStyle(color: Colors.white)
    )
  );
}