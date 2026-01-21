import 'package:chatter/core/database/base_local_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/localDataRource/chat_list_local_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_status.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_type.dart';
import 'package:sqflite/sqflite.dart';

class ChatListLocalDataSourceImp extends BaseLocalDataSource
    implements ChatListLocalDataSource {
  ChatListLocalDataSourceImp({required super.databaseHelper});

  @override
  Future<void> deleteChat(String chatId) async {
    final db = await databaseHelper.database;
    final rows = db.delete(
      'chat_list',
      where: 'chatId = ?',
      whereArgs: [chatId],
    );

    if (rows == 0) {
      throw Exception('Chat with chatId $chatId not found for deletion');
    }
    return;
  }

  @override
  Future<List<ChatListModel>> getChatsList() async {
    try {
      final db = await databaseHelper.database;
      final List<Map<String, dynamic>> chatListforLocal = await db.query(
        'chat_list',
      );
      final List<ChatListModel> chatList =
          chatListforLocal.map((chatMap) {
            return ChatListModel(
              chatId: chatMap['chatId'],
              userId: chatMap['userId'],
              phoneNumber: chatMap['phoneNumber'],
              displayName: chatMap['displayName'],
              photoUrl: chatMap['photoUrl'],
              lastMessage: chatMap['lastMessage'],
              lastMessageTime:
                  DateTime.tryParse(chatMap['lastMessageTime'] ?? '') ??
                  DateTime.now(),
              messageStatusEnum:
                  MessageStatus.values[chatMap['messageStatusEnum'] ?? 0],
              messageTypeEnum:
                  MessageType.values[chatMap['messageTypeEnum'] ?? 0],
            );
          }).toList();
      if (chatList.isEmpty) {
        throw Exception('No chats found in local database');
      }
      return chatList;
    } on Exception catch (e) {
      throw Exception('Failed to load chats from local database: $e');
    }
  }


  @override
 

  @override
  Future<List<ChatListModel>> searchAtUser(String userNameQuery) {
    final dbFuture = databaseHelper.database;
    return dbFuture.then((database) async {
      final List<Map<String, dynamic>> results = await database.query(
        'chat_list',
        where: 'displayName LIKE ?',
        whereArgs: ['%$userNameQuery%'],
      );

      return results.map((chatMap) {
        return ChatListModel(
          chatId: chatMap['chatId'],
          userId: chatMap['userId'],
          phoneNumber: chatMap['phoneNumber'],
          displayName: chatMap['displayName'],
          photoUrl: chatMap['photoUrl'],
          lastMessage: chatMap['lastMessage'],
          lastMessageTime:
              DateTime.tryParse(chatMap['lastMessageTime'] ?? '') ??
              DateTime.now(),
          messageStatusEnum:
              MessageStatus.values[chatMap['messageStatusEnum'] ?? 0],
          messageTypeEnum: MessageType.values[chatMap['messageTypeEnum'] ?? 0],
        );
      }).toList();
    });
  }

  @override
 

  

  @override
  Future<void> saveChatsList(List<ChatListModel> chatList) async {
    final db = await databaseHelper.database;
    try {
      db.transaction((txn) async {
        final batch = txn.batch();
        for (var chat in chatList) {
          batch.insert('chat_list', {
            'chatId': chat.chatId,
            'userId': chat.userId,
            'phoneNumber': chat.phoneNumber,
            'displayName': chat.displayName,
            'photoUrl': chat.photoUrl,
            'lastMessage': chat.lastMessage,
            'lastMessageTime': chat.lastMessageTime.toIso8601String(),
            'messageStatusEnum': chat.messageStatusEnum.index,
            'messageTypeEnum': chat.messageTypeEnum.index,
          }, conflictAlgorithm: ConflictAlgorithm.replace);
        }

        await batch.commit(noResult: true);
      });
    } on Exception catch (e) {
      throw Exception('Failed to save chats to local database: $e');
    }
  }

  @override
  Future<void> toggleDeleteChat(String conversationId) {
    final db = databaseHelper.database;
    return db.then(
      (database) => database.update(
        'chat_list',
        {'isDeleted': 1},
        where: 'conversationId = ?',
        whereArgs: [conversationId],
      ),
    );
  }
  
  @override
  Future<void> toggleMuteChat(String chatId) {
    // TODO: implement toggleMuteChat
    throw UnimplementedError();
  }
  
  @override
  Future<void> togglePinChat(String chatId) {
    // TODO: implement togglePinChat
    throw UnimplementedError();
  }
  
  

}
