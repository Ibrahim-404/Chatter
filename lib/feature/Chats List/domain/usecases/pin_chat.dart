import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class PinChat {
  final ChatListRepository repository;
  PinChat(this.repository);
  Future<Either<Failure, Unit>> call(String userId, String conversationId) {
    return repository.togglepinChat( userId, conversationId);
  }
}
