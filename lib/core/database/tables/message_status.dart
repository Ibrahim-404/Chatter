import 'package:sqflite/sqflite.dart';

class MessageStatusTable {
  static const String tableName = 'message_status';
  static const String messageId = 'message_id';
  static const String userId = 'user_id';
  static const String statusId = 'status_id';
  static const String updatedAt = 'updated_at';
  static const String status = 'status';
  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $messageId INTEGER NOT NULL,
        $userId TEXT NOT NULL,
        $statusId INTEGER PRIMARY KEY ,
        $updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        $status TEXT NOT NULL
      )
    ''');
  } 
}