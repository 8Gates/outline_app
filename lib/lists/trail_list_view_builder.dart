import 'package:flutter/material.dart';

class TrailList extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> trailsFuture;

  TrailList({super.key, required this.trailsFuture});

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
            shrinkWrap: true, // Set shrinkWrap to true
            itemCount: trails.length,
            itemBuilder: (BuildContext context, int index) {
              final int id = trails[index]['id'];
              final String name = trails[index]['name'];
              final double distance = trails[index]['distance'];
              final double elevationGain = trails[index]['elevation_gain'];
              final String difficulty = trails[index]['difficulty'];

              // Exclude longitude, latitude, and description fields
              return ListTile(
                title: Text('Trail Name: $name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: $id'),
                    Text('Distance: $distance'),
                    Text('Elevation Gain: $elevationGain'),
                    Text('Difficulty: $difficulty'),
                  ],
                ),
                // Add more ListTile properties as needed
              );
            },
          );
        }
      },
    );
  }
}
