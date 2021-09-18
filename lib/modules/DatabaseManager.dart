import 'package:hive_flutter/adapters.dart';

class DatabaseManager {



  static final DatabaseManager _databaseManager = DatabaseManager._internal();

  factory DatabaseManager() {
    return _databaseManager;
  }
  DatabaseManager._internal();

  initDB() async {
    await Hive.initFlutter();
  }


  }