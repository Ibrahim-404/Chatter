import 'package:chatter/core/database/tables/conversation.dart';
import 'package:chatter/core/database/tables/message.dart';
import 'package:chatter/core/database/tables/message_status.dart';
import 'package:chatter/core/database/tables/participant.dart';
import 'package:chatter/core/database/tables/user.dart';
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
    
      
      await UserTable.createTable(db);
      await MessageTable.createTable(db);
      await MessageStatusTable.createTable(db);
      await ConversationTable.createTable(db);
      await ParticipantTable.createTable(db);
   

  }

  Future<Database> initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database_helper.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
}
