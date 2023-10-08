import 'package:flutter/material.dart';
import 'package:outline_app/buttons/animate_to_screen.dart';
import 'package:outline_app/buttons/delete_database_button.dart';
import 'package:outline_app/buttons/insert_database_button.dart';
import 'package:outline_app/buttons/read_database_button.dart';
import 'package:outline_app/lists/trail_list_view_builder.dart';
import 'package:outline_app/models/read_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SecondScreen extends StatefulWidget {
  final bool darkMode;

  const SecondScreen(this.darkMode, {super.key});
  static const routeName = 'screen2';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    loadDatabase(); // loadDatabase method when widget is initialized
  }

  void loadDatabase() async {
    WidgetsFlutterBinding.ensureInitialized(); // Importing 'package:flutter/widgets.dart' is required.
    await openDatabase(
      join(await getDatabasesPath(), 'trails_database.db'),
      version: 1,
      onCreate: ((db, version) async {
        db.execute('''
          CREATE TABLE trails (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT NOT NULL,
            distance REAL NOT NULL,
            elevation_gain REAL NOT NULL,
            difficulty TEXT NOT NULL,
            latitude REAL NOT NULL,
            longitude REAL NOT NULL
          )
        ''');
        // Insert one row of sample data when the table is created
        await db.insert('trails', {
          'name': 'Sample Trail',
          'description': 'This is a sample trail.',
          'distance': 5.0,
          'elevation_gain': 1700,
          'difficulty': 'Moderate',
          'latitude': 123.456,
          'longitude': 789.012,
        });
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        FractionallySizedBox(
          heightFactor: 0.8, 
          child: TrailList(trailsFuture: ReadDatabase().getTrailsData())
        ),
        floatingActionButton: const FractionallySizedBox(
          widthFactor: 0.92, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ReadDatabaseButton(), 
              InsertDatabaseButton(),
              DeleteDatabaseButton(), 
              AnimateToScreen(screen: 0)
            ],
          )
        ),
      backgroundColor: widget.darkMode
        ? const Color.fromARGB(255, 61, 61, 61)
        : const Color.fromARGB(244, 240, 240, 240),
    );
  }
}
