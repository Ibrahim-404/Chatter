import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';

abstract class ChatListRemoteDataSource {
  Future<List<ChatListModel>> fetchChatsList(String userId);
  Future<void> toggleMuteChat(String userId, String conversationId);
  // Future<void> unmuteChat(String userId, String conversationId);
  Future<void> togglePinChat(String userId, String conversationId);
  // Future<void> unpinChat(String userId, String conversationId);
}
