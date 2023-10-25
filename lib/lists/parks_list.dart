import 'package:flutter/material.dart';
import 'package:outline_app/models/parks_info_temp.dart';


enum NationalPark { yellowStone, yosemite, rainier }

class ParksList extends StatefulWidget {
  final void Function(String park) setPark;
  final bool darkMode;
  final tempParkData = ParkInfo().tempParkData;

  ParksList(this.darkMode, {super.key, required this.setPark});
  @override
  State<ParksList> createState() => ParksListState();
}

class ParksListState extends State<ParksList> {
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
          parkCard('yellowstone', 'Yellow Stone','Yellow Stone', widget.tempParkData[0], widget.setPark, context, widget.darkMode),
          parkCard('yosemite', 'Yosemite','Yosemite', widget.tempParkData[1], widget.setPark, context, widget.darkMode),
          parkCard('rainier', 'Rainier','Rainier', widget.tempParkData[2], widget.setPark, context, widget.darkMode),
          parkCard('rockyMountains', 'Rocky Mountains','Mock', widget.tempParkData[3], widget.setPark, context, widget.darkMode),
          parkCard('acadia', 'Acadia','Mock', widget.tempParkData[5], widget.setPark, context, widget.darkMode),
          parkCard('zion', 'Zion','Mock', widget.tempParkData[5], widget.setPark, context, widget.darkMode),
          parkCard('glacier', 'Glacier','Mock', widget.tempParkData[6], widget.setPark, context, widget.darkMode),
          parkCard('denali', 'Denali','Mock', widget.tempParkData[7], widget.setPark, context, widget.darkMode),
        ])
        ))
      ]
    );
  }
}

boxDecorationDark(bool b){
  // box decoration, above the cards, list for dark / light mode 
  if(b) {
    return const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromARGB(255, 46, 46, 46), Color.fromARGB(255, 155, 155, 155), Color.fromARGB(255, 46, 46, 46)]
      )
    );
  } else{
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromARGB(255, 199, 199, 199), Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 199, 199, 199)]
      )
    );
  }
}

parkCard(String imageName, String title, String parkSet, String about, Function(String park) setPark, BuildContext context, bool b){
  return Card(
    color: b==true?Colors.black26 : Colors.white,
    child: ListTile(
      textColor: b==true?Colors.white : Colors.black87,
      leading: Image.asset('assets/images/$imageName.jpg'),
      title: Text(title),
      subtitle: Text(about),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () { 
        setPark(parkSet); 
        DefaultTabController.of(context).animateTo(1);
      },
      isThreeLine: true,
    )
  );
}