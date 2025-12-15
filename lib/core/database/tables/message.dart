import 'package:sqflite/sqflite.dart';

class MessageTable {
  static const String tableName = 'messages';

  static const String messageId = 'id';
  static const String senderId = 'sender_id';
  static const String conversationId = 'conversation_id';
  static const String content = 'content';
  static const String timestamp = 'timestamp';
  static const String isRead = 'is_read';
  static const String isEdit = 'is_edit';
  static const String replyToMessageId = 'reply_to_message_id';
  static const String messageType = 'message_type';
  static Future<void> createdb(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $messageId INTEGER PRIMARY KEY AUTOINCREMENT,
        $senderId INTEGER NOT NULL,
        $conversationId INTEGER NOT NULL,
        $content TEXT NOT NULL,
        $timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
        $isRead INTEGER DEFAULT 0,
        $isEdit INTEGER DEFAULT 0,
        $replyToMessageId INTEGER,
        $messageType TEXT NOT NULL
      
    ''');
  }
}