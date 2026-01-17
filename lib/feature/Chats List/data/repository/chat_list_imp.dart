import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/localDataRource/chat_list_local_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/remoteDataRource/chat_list_remote_data_source.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class ChatListImp implements ChatListRepository {
  final ChatListRemoteDataSource chatListRemoteDataSource;
  final ChatListLocalDataSource chatListLocalDataSource;
  ChatListImp(this.chatListLocalDataSource,this.chatListRemoteDataSource);
  
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
  Future<Either<Failure, List<ChatListItemEntity>>> searchAtUser(String userNameQuery) {
    // TODO: implement searchAtUser
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> toggleMuteChat(String userId, String conversationId) {
    // TODO: implement toggleMuteChat
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> togglepinChat(String userId, String conversationId) {
    // TODO: implement togglepinChat
    throw UnimplementedError();
  }
  
  
}
