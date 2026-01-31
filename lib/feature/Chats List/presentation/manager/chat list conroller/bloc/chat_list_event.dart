part of 'chat_list_bloc.dart';

sealed class ChatListEvent extends Equatable {
  const ChatListEvent();

  @override
  List<Object> get props => [];
}

final class FetchChatListEvent extends ChatListEvent {
  final String userId;
  const FetchChatListEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}

final class RefreshChatListEvent extends ChatListEvent {}

final class SearchChatListEvent extends ChatListEvent {
  final String query;
  const SearchChatListEvent(this.query);

  @override
  List<Object> get props => [query];
}
