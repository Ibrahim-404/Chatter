import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';

abstract class ChatListLocalDataSource {
  Future<List<ChatListModel>> getChatsList();
  Future<void> saveChatsList(List<ChatListModel> chatList);
  Future<void> deleteChat(String chatId);
  Future<void> pinChat(String chatId);
  Future<void> unpinChat(String chatId);
  Future<void> muteChat(String chatId);
  Future<void> unmuteChat(String chatId);
  Future<List<ChatListModel>> searchAtUser(String userNameQuery);
}
