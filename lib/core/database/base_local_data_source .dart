import 'package:chatter/core/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseLocalDataSource {
  DatabaseHelper databaseHelper;
  BaseLocalDataSource({required this.databaseHelper});
  Future<Database> getDatabase() async {
    return await databaseHelper.database;
  }
}
