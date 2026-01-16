import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_status.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/enums/message_type.dart';

class ChatListModel {
  final String chatId;
  final String userId;
  final String phoneNumber;
  final String displayName;
  final String photoUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final MessageStatus messageStatusEnum;
  final MessageType messageTypeEnum;
  ChatListModel({
    required this.messageStatusEnum,
    required this.messageTypeEnum,
    required this.chatId,
    required this.userId,
    required this.phoneNumber,
    required this.displayName,
    required this.photoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
  });
  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      chatId: map['chatId'],
      userId: map['userId'] ?? map['uid'],
      phoneNumber: map['phoneNumber'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
      lastMessage: map['lastMessage'],
      lastMessageTime:
          DateTime.tryParse(map['lastMessageTime'] ?? '') ?? DateTime.now(),
      messageStatusEnum: MessageStatus.values[map['messageStatusEnum'] ?? 0],
      messageTypeEnum: MessageType.values[map['messageTypeEnum'] ?? 0],
    );
  }
}
// factory ChatListModel.fromLocal(Map<String, dynamic> json) {
//       return ChatListModel(
//         userId: json['userId'],
//         messageStatusEnum: MessageStatus.values[json['messageStatusEnum'] ?? 0],
//         messageTypeEnum: MessageType.values[json['messageTypeEnum'] ?? 0],

//         chatId: json['chatId'],
//         phoneNumber: json['phoneNumber'],
//         displayName: json['displayName'],
//         photoUrl: json['photoUrl'],
//         lastMessage: json['lastMessage'],
//         lastMessageTime:
//             DateTime.parse(json['lastMessageTime'] ?? '') ?? DateTime.now(),
//       );
//     }
//     factory ChatListModel.fromRemote(Map<String, dynamic> json) {
//       return ChatListModel(
//         userId: json['uid'],
//         messageStatusEnum: MessageStatus.values.firstWhere(
//           (e) => describeEnum(e) == json['messageStatusEnum'],
//           orElse: () => MessageStatus.sent,
//         ),
//         messageTypeEnum: MessageType.values.firstWhere(
//           (e) => describeEnum(e) == json['messageTypeEnum'],
//           orElse: () => MessageType.text,
//         ),
//         chatId: json['chatId'],
//         phoneNumber: json['phoneNumber'],
//         displayName: json['displayName'],
//         photoUrl: json['photoUrl'],
//         lastMessage: json['lastMessage'],
//         lastMessageTime:
//             DateTime.parse(json['lastMessageTime'] ?? '') ?? DateTime.now(),
//       );
//     }
// }
