import 'package:sqflite/sqflite.dart';

class UserTable {
  static const String tableName = 'users';
  static const String userId = 'id';
  static const String userName = 'name';
  static const String phoneNumber = 'phone_number';
  static const String lastSeen = 'last_seen';
  static const String profilePicture = 'profile_picture';
  static const String bio = 'bio';
  static const String isOnline = 'is_online';
  static const String status = 'status';
  static const String createdAt = 'created_at';

  static Future<void> createTable(Database db) async {
    await db.execute('''
    CREATE TABLE $tableName (
      $userId TEXT PRIMARY KEY ,
      $userName TEXT NOT NULL,
      $phoneNumber TEXT,
      $lastSeen TEXT,
      $profilePicture TEXT,
      $bio TEXT,
      $isOnline INTEGER DEFAULT 0,
      $status TEXT,
      $createdAt TEXT DEFAULT CURRENT_TIMESTAMP 
      
    )
  ''');
  }
}
