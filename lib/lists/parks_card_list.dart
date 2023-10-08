import 'package:flutter/material.dart';


enum NationalPark { yellowStone, yosemite, rainier }

class ParksCardList extends StatefulWidget {
  const ParksCardList({super.key});

  @override
  State<ParksCardList> createState() => ParksCardListState();
}

class ParksCardListState extends State<ParksCardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xff027DFD), Color(0xff1cdac5), Color(0xffF2DD22)])), 
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(15),
          child: const Text('Find Next \n Trail', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Road_Rage', fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Card(
          child: ListTile(
            leading: Image.asset('assets/images/yellowstone.jpg'),
            title: const Text('Yellow Stone'),
            subtitle:
              const Text('A nearly 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot.'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () { 
              // Navigator.pushNamed(context, SecondScreen.routeName); 
              DefaultTabController.of(context).animateTo(1);
            },
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset('assets/images/yosemite.jpg'),
            title: const Text('Yosemite'),
            subtitle:
              const Text('Sierra Nevada, giant sequoias, towering falls and the granite cliffs of Half Dome'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () { DefaultTabController.of(context).animateTo(1); },
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset('assets/images/rainier.jpg'),
            title: const Text('Rainier'),
            subtitle:
              const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () { 
              // Navigator.pushNamed(context, SecondScreen.routeName); 
              DefaultTabController.of(context).animateTo(1);
              },
            isThreeLine: true,
          ),
        )
      ],
    );
  }
}