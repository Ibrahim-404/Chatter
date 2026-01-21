import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';

abstract class ChatListLocalDataSource {
  Future<List<ChatListModel>> getChatsList();
  Future<void> saveChatsList(List<ChatListModel> chatList);
  Future<void> deleteChat(String chatId);
  Future<void> togglePinChat(String chatId);
  Future<void> toggleMuteChat(String chatId);
  
  Future<List<ChatListModel>> searchAtUser(String userNameQuery);
  Future<void> toggleDeleteChat(String conversationId);
}
