import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

static Database? _database;
Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      await UserTable.createTable(db);
      await MessageTable.createTable(db);
      await MessageStatusTable.createTable(db);
      await ConversationTable.createTable(db);
      await ParticipantTable.createTable(db);
    ''');
  }

  Future<Database> initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database_helper.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
}
