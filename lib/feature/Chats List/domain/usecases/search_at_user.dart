import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class SearchAtUser {
  final ChatListRepository repository;
  SearchAtUser(this.repository);
  Future<Either<Failure, List<ChatListItemEntity>>> call(
    String userNameQuery,
  ) {
    return repository.searchAtUser(userNameQuery);
  }
}