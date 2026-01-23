import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Chats%20List/domain/repository/chatList_repo.dart';
import 'package:dartz/dartz.dart';

enum ChatAction { delete, mute, pin }

class UpdateChatUsecase {
  final ChatListRepository repository;

  UpdateChatUsecase({required this.repository});
  Future<Either<Failure, Unit>> call(String chatId, ChatAction action) {
    switch (action) {
      case ChatAction.delete:
        return repository.deleteChat(chatId);
      case ChatAction.mute:
        return repository.toggleMuteChat("userId", chatId);
      case ChatAction.pin:
        return repository.togglepinChat("userId", chatId);
    }
  }
}
