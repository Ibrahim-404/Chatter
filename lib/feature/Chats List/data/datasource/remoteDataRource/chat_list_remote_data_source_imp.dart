import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/remoteDataRource/chat_list_remote_data_source.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:dartz/dartz.dart';

class ChatListRemoteDataSourceImp implements ChatListRepository {
  @override
  Future<Either<Failure, List<ChatListItemEntity>>> fetchChatsList() {
    // Implementation here
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> muteChat(String chatId) {
    // Implementation here
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> unmuteChat(String chatId) {
    // Implementation here
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> pinChat(String chatId) {
    // Implementation here
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> unpinChat(String chatId) {
    // Implementation here
    throw UnimplementedError();
  }
}
