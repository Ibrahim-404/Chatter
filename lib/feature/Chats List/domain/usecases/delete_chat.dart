import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteChat {
  final ChatListRepository repository;
  DeleteChat(this.repository);
  Future<Either<Failure, Unit>> call(String chatId) {
    return repository.deleteChat(chatId);
  }
}
