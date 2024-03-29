import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ReadDatabaseButton extends StatelessWidget {
  const ReadDatabaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final Database database = await openDatabase(
          join(await getDatabasesPath(), 'trails_database.db'),
        );

        // Read values from the database
        final List<Map<String, dynamic>> trails = await database.query('trails');

        for (final trail in trails) {
          final int id = trail['id'];
          final String park = trail['park'];
          final String name = trail['name'];
          final String description = trail['description'];
          final double distance = trail['distance'];
          final double elevationGain = trail['elevation_gain'];
          final String difficulty = trail['difficulty'];
          final double latitude = trail['latitude'];
          final double longitude = trail['longitude'];

          log('Trail #$id');
          log('Park: $park');
          log('Name: $name');
          log('Description: $description');
          log('Distance: $distance');
          log('Elevation Gain: $elevationGain');
          log('Difficulty: $difficulty');
          log('Latitude: $latitude');
          log('Longitude: $longitude');
        }
        await database.close();
      },
      child: const Text('Log'),
    );
  }
}