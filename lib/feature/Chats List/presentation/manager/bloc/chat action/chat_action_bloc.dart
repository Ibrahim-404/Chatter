import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_action_event.dart';
part 'chat_action_state.dart';

class ChatActionBloc extends Bloc<ChatActionEvent, ChatActionState> {
  ChatActionBloc() : super(ChatActionInitial()) {
    on<ChatActionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
