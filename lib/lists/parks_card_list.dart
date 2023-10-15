import 'package:flutter/material.dart';


enum NationalPark { yellowStone, yosemite, rainier }

class ParksCardList extends StatefulWidget {
  final void Function(String park) setPark;
  final bool darkMode;

  const ParksCardList(this.darkMode, {super.key, required this.setPark});
  @override
  State<ParksCardList> createState() => ParksCardListState();
}

class ParksCardListState extends State<ParksCardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: widget.darkMode ? boxDecorationDark(true) : boxDecorationDark(false), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xff027DFD), Color(0xff1cdac5), Color(0xffF2DD22)])), 
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(5),
              child: const Text(
                'Select< \n >Park', textAlign: TextAlign.center, 
                style: TextStyle(fontFamily: 'Road_Rage', fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 8, 8, 8)),
              )
            )]
          )
        ),
        Expanded(child: SingleChildScrollView(child: Column(children: <Widget>[
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/yellowstone.jpg'),
              title: const Text('Yellow Stone'),
              subtitle: const Text('A nearly 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Yellow Stone");
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/yosemite2.jpg'),
              title: const Text('Yosemite'),
              subtitle: const Text('Sierra Nevada, giant sequoias, towering falls and the granite cliffs of Half Dome'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                widget.setPark("Yosemite"); 
                DefaultTabController.of(context).animateTo(1); 
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/rainier.jpg'),
              title: const Text('Rainier'),
              subtitle: const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Rainier"); 
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/rockyMountains.jpg'),
              title: const Text('Rocky Mountain'),
              subtitle: const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Rainier"); 
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/acadia.jpg'),
              title: const Text('Acadia'),
              subtitle: const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Rainier"); 
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/zion.jpg'),
              title: const Text('Zion'),
              subtitle: const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Rainier"); 
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/glacier.jpg'),
              title: const Text('Glacier'),
              subtitle: const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Rainier"); 
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/denali.jpg'),
              title: const Text('Denali'),
              subtitle: const Text('Alpine glaciers and the highest volcanic peak in the contiguous United States.'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () { 
                widget.setPark("Rainier"); 
                DefaultTabController.of(context).animateTo(1);
              },
              isThreeLine: true,
            )
          )
        ])
        ))
      ]
    );
  }
}


boxDecorationDark(bool b){
  if(b) return const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 46, 46, 46), Color.fromARGB(255, 155, 155, 155), Color.fromARGB(255, 46, 46, 46)]));
  return const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 199, 199, 199), Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 199, 199, 199)]));
}