import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatListRepository {
  Future<Either<Failure, List<ChatListItemEntity>>> getChatsList();
  Future<Either<Failure, Unit>> deleteChat(String chatId);
  Future<Either<Failure, Unit>> togglepinChat(String userId, String conversationId);
  

  Future<Either<Failure, Unit>> toggleMuteChat(String userId, String conversationId);
  Future<Either<Failure, List<ChatListItemEntity>>> searchAtUser(
    String userNameQuery,
  );
}
