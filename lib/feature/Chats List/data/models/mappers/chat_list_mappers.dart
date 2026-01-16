import 'package:chatter/feature/Chats%20List/data/models/chat_list_model.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';

extension ChatListMapper on ChatListItemEntity {
  ChatListModel toModel() {
    return ChatListModel(
      chatId: chatId,
      userId: userId,
      phoneNumber: phoneNumber,
      displayName: displayName,
      photoUrl: photoUrl,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      messageStatusEnum: messageStatusEnum,
      messageTypeEnum: messageTypeEnum,
    );
  }
}
