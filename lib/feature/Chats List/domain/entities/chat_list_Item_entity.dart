import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_status.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_type.dart';
import 'package:equatable/equatable.dart';

class ChatListItemEntity extends Equatable {
  final String chatId;
  final String userId;
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
    required this.userId,
    required this.phoneNumber,
    required this.displayName,
    required this.photoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
        chatId,
        userId,
        phoneNumber,
        displayName,
        photoUrl,
        lastMessage,
        lastMessageTime,
        messageStatusEnum,
        messageTypeEnum,
      ];
}
