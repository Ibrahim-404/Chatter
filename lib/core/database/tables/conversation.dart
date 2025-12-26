import 'package:sqflite/sqflite.dart';

class ConversationTable {
  static const String tableName = 'conversations';

  static const String conversationId = 'conversation_id';
  static const String userId = 'user_id';
  static const String participantId = 'participant_id';
  static const String createdAt = 'created_at';
  static const String lastmessageId = 'last_message_id';
  static const String lastMessageTimestamp = 'last_message_timestamp';
  static const String SyncState = 'sync_state';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $conversationId TEXT PRIMARY KEY ,
        $createdAt TEXT NOT NULL,
        $userId TEXT NOT NULL,
        $participantId TEXT NOT NULL,
        $lastmessageId TEXT,
        $lastMessageTimestamp TEXT NOT NULL ,
        $SyncState INTEGER DEFAULT 0,
        FOREIGN KEY ($lastmessageId) REFERENCES messages(id) ,
        FOREIGN KEY ($conversationId) REFERENCES users(id) ,
        FOREIGN KEY ($userId) REFERENCES users(id) 
      
    ''');
  }
}
