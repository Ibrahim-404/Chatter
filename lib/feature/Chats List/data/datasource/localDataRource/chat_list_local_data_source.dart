import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';

abstract class ChatListLocalDataSource {
  Future<List<ChatListModel>> getChatsList();
  Future<void> saveChatsList(List<ChatListModel> chatList);
  Future<void> togglePinChat(String conversationId);
  Future<void> toggleMuteChat(String conversationId);

  Future<List<ChatListModel>> searchAtUser(String userNameQuery);
  Future<void> toggleDeleteChat(String conversationId);
}
