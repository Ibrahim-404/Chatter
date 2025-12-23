import 'package:sqflite/sqflite.dart';

class ParticipantTable {
  static const String tableName = 'participants';
  static const String conversationId = 'conversations_id';
  static const String participantId = 'participant_id';
  static const String muted = 'muted';
  static const String joinedAt = 'joined_at';
  static const String role = 'role';
  static const String leftAt = 'left_at';

  static Future<void> createdb(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $participantId TEXT PRIMARY KEY ,
        $conversationId TEXT NOT NULL,
        $muted INTEGER DEFAULT 0,
        $joinedAt TEXT NOT NULL,
        $role TEXT NOT NULL,
        $leftAt TEXT,
        FOREIGN KEY ($conversationId) REFERENCES conversations(conversation_id),
        FOREIGN KEY ($participantId) REFERENCES users(id)
      )
    ''');
  }
}
