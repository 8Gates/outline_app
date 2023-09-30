import 'package:flutter/material.dart';

enum NationalPark { yellowStone, yosemite, rainier }

class ListTilePark extends StatefulWidget {
  const ListTilePark({super.key});

  @override
  State<ListTilePark> createState() => ListTileParkState();
}

class ListTileParkState extends State<ListTilePark> {
  NationalPark? _park = NationalPark.yellowStone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 87, 192, 66)), 
          padding: const EdgeInsets.all(35),
          margin: const EdgeInsets.all(20),
          child: const Text('Select Your\n Park', textAlign: TextAlign.center),
        ),
        const Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Yellow Stone'),
            subtitle:
              Text('A nearly 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        const Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Yosemite'),
            subtitle:
              Text('Sierra Nevada, giant sequoias, towering falls and the granite cliffs of Half Dome'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        const Card(
          child: ListTile(
            leading: Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            title: Text('Rainier'),
            subtitle:
              Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        )
      ],
    );
  }
}