import 'package:flutter/material.dart';

class TrailList extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> trailsFuture;

  const TrailList({super.key, required this.trailsFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: trailsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is still running, show a loading indicator or some other UI.
          return const CircularProgressIndicator(); // or any loading widget
        } else if (snapshot.hasError) {
          // If there's an error, you can display an error message here.
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Map<String, dynamic>> trails = snapshot.data ?? [];
          return ListView.builder(
            // shrinkWrap: true, // Set shrinkWrap to true
            itemCount: trails.length,
            itemBuilder: (BuildContext context, int index) {
              final String park = trails[index]['park'];
              final String name = trails[index]['name'];
              final double distance = trails[index]['distance'];
              final int elevationGain = trails[index]['elevation_gain'];
              final String difficulty = trails[index]['difficulty'];
              final String description = trails[index]['description'];

              // Exclude longitude, latitude, and description fields
              return ExpandingCard(name, park, distance, elevationGain, difficulty, description);
            },
          );
        }
      },
    );
  }
}

class ExpandingCard extends StatefulWidget {
  final String name;
  final String park;
  final double distance;
  final int elevation;
  final String difficulty;
  final String description;
  const ExpandingCard(this.name, this.park, this.distance, this.elevation, this.difficulty, this.description, {super.key});

  compressedContent(){
  return [ 
    Text('Park: $park'),
    Text('Distance: $distance miles'),
    Text('Elevation Gain: $elevation ft'),
    Text('Difficulty: $difficulty')
  ];
}

expandedContent(){
  return [
    Text('Park: $park'),
    Text('Distance: $distance miles'),
    Text('Elevation Gain: $elevation ft'),
    Text('Difficulty: $difficulty'),
    Text('Description: $description')
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
    return Card(child: 
      ListTile(
        title: Text('Trail Name: $widget.name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: isExpanded ? widget.expandedContent() : widget.compressedContent()
        ),
        trailing: IconButton(
          icon: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          onPressed: toggleExpanded,
        ),
        onTap: toggleExpanded,
      )
    );
  }
}
