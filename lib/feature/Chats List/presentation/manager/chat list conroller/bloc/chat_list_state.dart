part of 'chat_list_bloc.dart';

sealed class ChatListState extends Equatable {
  const ChatListState();

  @override
  List<Object> get props => [];
}

final class ChatListInitial extends ChatListState {}

final class ChatListLoading extends ChatListState {}

final class ChatListLoaded extends ChatListState {
  final List<ChatListItemEntity> chats;
  const ChatListLoaded(this.chats);

  @override
  List<Object> get props => [chats];
}

final class ChatListError extends ChatListState {}

final class ChatListEmpty extends ChatListState {}

final class ChatListSearchResults extends ChatListState {
  final List<ChatListItemEntity> results;
  const ChatListSearchResults(this.results);

  @override
  List<Object> get props => [results];
}
