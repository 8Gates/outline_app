import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DeleteDatabaseButton extends StatelessWidget {
  const DeleteDatabaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (() async {
        // Get the path to the database file
        String databasePath = await getDatabasesPath();
        String path = join(databasePath, 'trails_database.db');

        try {
          // Attempt to delete the database file
          await deleteDatabase(path);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Database deleted successfully.'),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete the database: $e'),
            ),
          );
        }
      }),
      child: const Text('Drop'),
    );
  }
}