import 'package:sqflite/sqflite.dart';

class ConversationTable {
  static const String tableName = 'conversations';

  static const String conversationId = 'conversation_id';
  static const String createdAt = 'created_at';
  static const String lastmessageId = 'last_message_id';
  static const String lastMessageTimestamp = 'last_message_timestamp';

  static Future<void> createdb(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $conversationId INTEGER PRIMARY KEY ,
        $createdAt TEXT NOT NULL,
        $lastmessageId INTEGER,
        $lastMessageTimestamp TEXT NOT NULL
      
    ''');
  }
}
