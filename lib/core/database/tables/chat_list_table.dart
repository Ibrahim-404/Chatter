
import 'package:sqflite/sqflite.dart';

class  ChatListTable {
  static const String tableName = 'chat_list';
  static const String chatId='chatId';
  static const String phoneNumber='phoneNumber';
  static const String displayName='displayName';
  static const String photoUrl='photoUrl';
  static const String lastMessage='lastMessage';
  static const String lastMessageTime='lastMessageTime';
  static const String messageStatus='messageStatus';
  static const String messageType='messageType';

Future<void> createTable(Database db) async {
    await db.execute(createTableQuery());
  }
  static String createTableQuery() {
    return '''
      CREATE TABLE $tableName (
        $chatId TEXT PRIMARY KEY,
        $phoneNumber TEXT,
        $displayName TEXT,
        $photoUrl TEXT,
        $lastMessage TEXT,
        $lastMessageTime TEXT,
        $messageStatus INTEGER,
        $messageType INTEGER
      )
    ''';
  }
}