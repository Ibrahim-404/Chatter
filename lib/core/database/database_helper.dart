import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      UserTable.createTable(db);
      MessageTable.createdb(db);
      MessageStatusTable.createTable(db);
      
    ''');
  }

  Future<void> initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database_helper.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }
}
