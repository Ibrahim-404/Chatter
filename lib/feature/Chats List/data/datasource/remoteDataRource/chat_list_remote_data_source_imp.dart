import 'package:chatter/feature/Chats%20List/data/datasource/remoteDataRource/chat_list_remote_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatListRemoteDataSourceImp implements ChatListRemoteDataSource {
  final SupabaseClient supabaseClient;
  const ChatListRemoteDataSourceImp(this.supabaseClient);
  @override
  Future<List<ChatListModel>> fetchChatsList(String userId) async {
    final response = await supabaseClient
        .from('participants')
        .select('''
conversation_id,
      muted,
      role,
      conversations(
      conversation_id,
        type,
        last_message_time,
       messages(
       message_id,
          content,
          message_type,
          sent_at,
          sender_id
      )
    ),users(
    id,
    name,
    profile_photo_link,
    phone_number
    )
       ''')
        .eq('user_id', userId);
    return response.map((chat) => ChatListModel.fromMap(chat)).toList();
  }

  @override
  Future<void> toggleMuteChat(String userId, String conversationId) async {
    final response =
        await supabaseClient
            .from('Participants')
            .select('muted')
            .eq('conversation_id', conversationId)
            .eq('user_id', userId)
            .single();
    final bool currentMuted = response['muted'] as bool;
    supabaseClient
        .from('Participants')
        .update({'muted': !currentMuted})
        .eq('conversation_id', conversationId)
        .eq('user_id', userId);
  }

  @override
  Future<void> togglePinChat(String userId, String conversationId) async {
    final response =
        await supabaseClient
            .from('Participants')
            .select('pin')
            .eq('conversation_id', conversationId)
            .eq('user_id', userId)
            .single();
    final bool currentpined = response['muted'] as bool;
    supabaseClient
        .from('Participants')
        .update({'muted': !currentpined})
        .eq('conversation_id', conversationId)
        .eq('user_id', userId);
  }

  @override
  Future<List<ChatListModel>> searchAtuser(String query) async {
    final response = await supabaseClient
        .from('participants')
        .select('''
conversation_id,
      muted,
      role,
      conversations(
      conversation_id,
        type,
        last_message_time,
       messages(
       message_id,
          content,
          message_type,
          sent_at,
          sender_id
      )
    ),users(
    id,
    name,
    profile_photo_link,
    phone_number
    )
  }
}
''')
        .like('users.name', '%query%');
    return response.map((chat) => ChatListModel.fromMap(chat)).toList();
  }

  @override
  Future<void> toggleDeleteChat(String conversationId) async {
    try {
      await supabaseClient
          .from('conversations')
          .delete()
          .eq('conversation_id', conversationId);
    } on Exception catch (e) {
      throw Exception('Failed to delete conversation: $e');
    }
  }
}
