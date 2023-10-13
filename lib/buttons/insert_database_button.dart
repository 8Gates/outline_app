import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InsertDatabaseButton extends StatelessWidget {
  const InsertDatabaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> difficulty = ["Easy", "Moderate", "Hard", "Deadly"];
    return FloatingActionButton(
      onPressed: () async {
        // Open the database
        final Database database = await openDatabase(
          join(await getDatabasesPath(), 'trails_database.db'),
        );

        // Insert one row of sample data
        await database.insert('trails', {
          'park': 'Yellow Stone',
          'name': 'Sample Trail',
          'description': 'This is a sample trail.',
          'distance': Random().nextInt(10),
          'elevation_gain': Random().nextInt(12000),
          'difficulty': difficulty[Random().nextInt(4)],
          'latitude': 123.456,
          'longitude': 789.012,
        });

        // Close the database
        await database.close();
      },
      child: const Text('Add'),
    );
  }
}