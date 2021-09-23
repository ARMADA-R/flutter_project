import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  static final DatabaseManager _databaseManager = DatabaseManager._internal();

  factory DatabaseManager() {
    return _databaseManager;
  }
  DatabaseManager._internal();

  initDB() async {
    // await Hive.initFlutter();
  }

  static final _dbName = "Database.db";
  // Use this class as a singleton

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Instantiate the database only when it's not been initialized yet.
    _database = await _initDatabase();
    return _database!;
  }


  // Creates and opens the database.
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  // Creates the database structure
  Future _onCreate(
      Database db,
      int version,
      ) async {
    await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            username TEXT NOT NULL,
            image TEXT,
            episodes INTEGER,
            description TEXT
          )
          ''');
  }

  }
