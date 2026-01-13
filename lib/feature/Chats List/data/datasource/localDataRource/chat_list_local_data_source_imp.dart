import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/localDataRource/chat_list_local_data_source.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:dartz/dartz.dart';

class ChatListLocalDataSourceImp implements ChatListLocalDataSource {
  @override
  Future<Either<Failure, Unit>> deleteChat(String chatId) {
    // TODO: implement deleteChat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> getChatsList() {
    // TODO: implement getChatsList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> muteChat(String chatId) {
    // TODO: implement muteChat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> pinChat(String chatId) {
    // TODO: implement pinChat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> searchAtUser(String userNameQuery) {
    // TODO: implement searchAtUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> unmuteChat(String chatId) {
    // TODO: implement unmuteChat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> unpinChat(String chatId) {
    // TODO: implement unpinChat
    throw UnimplementedError();
  }
}
