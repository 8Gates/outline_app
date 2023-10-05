import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  final darkMode;
  final void Function() flipDarkMode;
  const MainDrawer(this.darkMode, {super.key, required this.flipDarkMode});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
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
    ListTile(
      title: Text(
        'Dark Mode', style: widget.darkMode? lightTxt() : darkTxt()
      ),
      trailing: Switch(
        value: widget.darkMode,
        onChanged: (bool value){
          setState(() {
            widget.flipDarkMode();
          });
        }),
    ),
    aListTile('Fishing', widget.darkMode), 
    aListTile('Hunting', widget.darkMode),
    aListTile('Camping', widget.darkMode),
    aListTile('Swimming', widget.darkMode),
    aListTile('Visitor Center', widget.darkMode),
  ];
    return Drawer(
      backgroundColor: widget.darkMode? const Color.fromARGB(255, 37, 37, 37) : Colors.white, 
      child: ListView(children: drawerTiles,)
    );
  }
}

Widget aListTile(String text, darkMode){
  return ListTile(
    title: Text(text, 
      style: darkMode? lightTxt() : darkTxt()
    )
  );
}

TextStyle lightTxt(){
  return const TextStyle(color: Colors.white);
}

TextStyle darkTxt(){
  return const TextStyle(color: Colors.black);
}