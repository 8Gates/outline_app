import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ReadDatabase {
  final String databaseName = 'trails_database.db';
  Database? _database;

  // Open the database or return the existing instance if available
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
    );
    return _database!;
  }

  // Query the 'trails' table and return the data as a List<Map<String, dynamic>>
  Future<List<Map<String, dynamic>>> getTrailsData(String park) async {
    final db = await database;
    return await db.query(
      'trails',
      where: 'park = ?',
      whereArgs: [park],
    );
  }
}