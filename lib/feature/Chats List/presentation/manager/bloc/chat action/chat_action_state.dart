part of 'chat_action_bloc.dart';

sealed class ChatActionState extends Equatable {
  const ChatActionState();
  
  @override
  List<Object> get props => [];
}

final class ChatActionInitial extends ChatActionState {}
