import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_status.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_type.dart';
import 'package:flutter/foundation.dart';

class ChatListModel {
  final String chatId;
  final String uid;
  final String phoneNumber;
  final String displayName;
  final String photoUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final MessageStatus messageStatusEnum;
  final MessageType messageTypeEnum;
  ChatListModel(
    {
    required this.messageStatusEnum,
    required this.messageTypeEnum, 
    required this.chatId,
    required this.uid,
    required this.phoneNumber,
    required this.displayName,
    required this.photoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
  });
  factory ChatListModel.fromJson(Map<String, dynamic> json) {
    return ChatListModel(
      messageStatusEnum: MessageStatus.values.firstWhere(
        (e) => describeEnum(e) == json['messageStatusEnum'],
      ),
      messageTypeEnum: MessageType.values.firstWhere(
        (e) => describeEnum(e) == json['messageTypeEnum'],
      ),
      chatId: json['chatId'],
      uid: json['uid'],
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      lastMessage: json['lastMessage'],
      lastMessageTime: DateTime.parse(json['lastMessageTime']),
    );
  }
}