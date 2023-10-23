
import 'package:flutter/material.dart';
import 'package:outline_app/config.dart';
import 'package:url_launcher/url_launcher.dart';


class TrailList extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> trailsFuture;

  const TrailList({super.key, required this.trailsFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: trailsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is still running, show a loading indicator
          return const CircularProgressIndicator(strokeWidth: 20);
        } else if (snapshot.hasError) {
            // If there's an error, display an error message here
            return Text('Error: ${snapshot.error}');
        } else {
            final List<Map<String, dynamic>> trails = snapshot.data ?? [];
            return ListView.builder(
            itemCount: trails.length,
            itemBuilder: (BuildContext context, int index) {
              final int id = trails[index]['id'];
              final String park = trails[index]['park'];
              final String name = trails[index]['name'];
              final double distance = trails[index]['distance'];
              final int elevationGain = trails[index]['elevation_gain'];
              final String difficulty = trails[index]['difficulty'];
              final String description = trails[index]['description'];
              final double latitude = trails[index]['latitude'];
              final double longitude = trails[index]['longitude'];

              return ExpandingCard(id, name, park, distance, elevationGain, difficulty, description, latitude, longitude);
            },
          );
        }
      },
    );
  }
}

class ExpandingCard extends StatefulWidget {
  final int id;
  final String name;
  final String park;
  final double distance;
  final int elevation;
  final String difficulty;
  final String description;
  final double latitude;
  final double longitude;
  final String mapKey = apiKey;

  const ExpandingCard(this.id, this.name, this.park, this.distance, this.elevation, this.difficulty, this.description, this.latitude, this.longitude, {super.key});

  compressedContent(){
    return [ 
      Text('Park: $park'),
      Text('Distance: $distance miles'),
      Text('Elevation Gain: $elevation ft'),
      Text('Difficulty: $difficulty')
    ];
  } 

  expandedContent(int id, double latitude, double longitude){
    return [
      Text('Park: $park'),
      Text('Distance: $distance miles'),
      Text('Elevation Gain: $elevation ft'),
      Text('Difficulty: $difficulty'),
      Text('Description: $description'),
      Center(child:
        GestureDetector( 
          onTap: (){
            openGoogleMaps(latitude.toString(), longitude.toString());
          },
          child: Image.network(
            'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=10&size=400x400&markers=$latitude,$longitude&key=$mapKey',
          )
        )
      )
    ];
  }

  @override
  State<ExpandingCard> createState() => _ExpandingCardState();
}

class _ExpandingCardState extends State<ExpandingCard> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.name;
    return Card(child: 
      ListTile(
        title: Text('$name Trail'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: isExpanded ? widget.expandedContent(widget.id, widget.latitude, widget.longitude) : widget.compressedContent()
        ),
        trailing: isExpanded ? null : IconButton(
          icon: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          onPressed: toggleExpanded,
        ),
        onTap: toggleExpanded,
      )
    );
  }
}

void openGoogleMaps(String latitude, String longitude) async {
  final Uri googleMapsUri = Uri.https('www.google.com', '/maps', {'q': '$latitude,$longitude'});
  if (await canLaunchUrl(googleMapsUri)) {
    await launchUrl(googleMapsUri);
  } else {
    throw 'Could not launch Google Maps.';
  }
}