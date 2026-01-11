import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_status.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_type.dart';

class ChatListItemEntity {
  final String chatId;
  final String uid;
  final String phoneNumber;
  final String displayName;
  final String photoUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final MessageStatus messageStatusEnum;
  final MessageType messageTypeEnum;
  ChatListItemEntity(
    this.messageStatusEnum,
    this.messageTypeEnum, {
    required this.chatId,
    required this.uid,
    required this.phoneNumber,
    required this.displayName,
    required this.photoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}
