import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/core/network/network_checker.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/localDataRource/chat_list_local_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/remoteDataRource/chat_list_remote_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/models/mappers/chat_list_mappers.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class ChatListImp implements ChatListRepository {
  final ChatListRemoteDataSource chatListRemoteDataSource;
  final ChatListLocalDataSource chatListLocalDataSource;
  final NetworkChecker networkChecker;
  ChatListImp(
    this.chatListLocalDataSource,
    this.chatListRemoteDataSource,
    this.networkChecker,
  );

  @override
  Future<Either<Failure, Unit>> deleteChat(String chatId) async {
    if (await networkChecker.isConnected) {
    try{
      await chatListRemoteDataSource.toggleDeleteChat(chatId);
      
      return Right(unit);
    }catch(e){
      return Left(ServerFailure());
    }
    } else {
try{
      await chatListLocalDataSource.deleteChat(chatId);
      
      return Right(unit);
    }catch(e){
      return Left(CacheFailure());
    }
    }
  }

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> getChatsList(
    String userId,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        final remoteChatList = await chatListRemoteDataSource.fetchChatsList(
          userId,
        );
        await chatListLocalDataSource.saveChatsList(remoteChatList);
        final entites = remoteChatList.map((e) => e.toEntity()).toList();

        return Right(entites);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localChatList = await chatListLocalDataSource.getChatsList();
        if (localChatList.isNotEmpty) {
          return Right(localChatList.map((e) => e.toEntity()).toList());
        }
      } catch (e) {
        return Left(CacheFailure());
      }
    }

  }

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> searchAtUser(
    String userNameQuery,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        final remoteChatList = await chatListRemoteDataSource.searchAtuser(
          userNameQuery,
        );
        return Right(remoteChatList.map((e) => e.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localChatList = await chatListLocalDataSource.searchAtUser(
          userNameQuery,
        );
        return Right(localChatList.map((e) => e.toEntity()).toList());
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleMuteChat(
    String userId,
    String conversationId,
  )async {
    if (await networkChecker.isConnected) {
      try {
        await chatListRemoteDataSource.toggleMuteChat(userId, conversationId);
        return Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        await chatListLocalDataSource.unmuteChat(userId);
        return Right(unit);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> togglepinChat(
    String userId,
    String conversationId,
  ) {
    // TODO: implement togglepinChat
    throw UnimplementedError();
  }
}
