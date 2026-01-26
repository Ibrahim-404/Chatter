import 'package:bloc/bloc.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:chatter/feature/Chats%20List/domain/usecases/get_chats_list.dart';
import 'package:chatter/feature/Chats%20List/domain/usecases/search_at_user.dart';
import 'package:equatable/equatable.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetChatsList getChatsList;
  final SearchAtUser searchAtUser;
  ChatListBloc(this.getChatsList, this.searchAtUser)
    : super(ChatListInitial()) {
    on<FetchChatListEvent>((event, emit) async {
      emit(ChatListLoading());
      try {
        final chats = await getChatsList(event.userId);
        chats.fold(
          (failure) => emit(ChatListError()),
          (chats) {
            if (chats.isEmpty) {
              emit(ChatListEmpty());
            } else {
              emit(ChatListLoaded(chats));
            }
          } 
        );
      } catch (e) {
        emit(ChatListError());
      }
    });
    on<RefreshChatListEvent>((event, emit) async {
      emit(ChatListLoading());
      try {
        final chats = await getChatsList('');
        chats.fold(
          (failure) => emit(ChatListError()),
          (chats) {
            if (chats.isEmpty) {
              emit(ChatListEmpty());
            } else {
              emit(ChatListLoaded(chats));
            }
          } 
        );
      } catch (e) {
        emit(ChatListError());
      }
    });
    on<SearchChatListEvent>((event, emit) async {
      emit(ChatListLoading());
      try {
        final chats = await searchAtUser(event.query);
        chats.fold(
          (failure) => emit(ChatListError()),
          (chats) {
            if (chats.isEmpty) {
              emit(ChatListEmpty());
            } else {
              emit(ChatListLoaded(chats));
            }
          } 
        );
      } catch (e) {
        emit(ChatListError());
      }
    });
  }

}