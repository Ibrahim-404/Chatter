import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatListLocalDataSource {
  Future<Either<Failure, List<ChatListItemEntity>>> getChatsList();
  Future<Either<Failure, Unit>> deleteChat(String chatId);
  Future<Either<Failure, Unit>> pinChat(String chatId);
  Future<Either<Failure, Unit>> unpinChat(String chatId);
  Future<Either<Failure, Unit>> muteChat(String chatId);
  Future<Either<Failure, Unit>> unmuteChat(String chatId);
  Future<Either<Failure, List<ChatListItemEntity>>> searchAtUser(
    String userNameQuery,
  );
}
