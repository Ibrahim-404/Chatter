import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class MuteChat {
  final ChatListRepository repository;
  MuteChat(this.repository);
  Future<Either<Failure, Unit>> call(String userId, String conversationId) {
    return repository.toggleMuteChat( userId, conversationId);
  }
}
