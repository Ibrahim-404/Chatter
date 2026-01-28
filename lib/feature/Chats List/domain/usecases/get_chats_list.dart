import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class GetChatsList {
  final ChatListRepository repository;
  GetChatsList(this.repository);
  Stream<Either<Failure, List<ChatListItemEntity>>> call(String userId) {
    return repository.getChatsList(userId);
  }
}
