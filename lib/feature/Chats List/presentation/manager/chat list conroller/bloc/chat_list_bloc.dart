import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatter/core/network/network_checker.dart';
import 'package:chatter/core/network/network_state.dart';
import 'package:chatter/feature/Chats%20List/domain/entities/chat_list_Item_entity.dart';
import 'package:chatter/feature/Chats%20List/domain/usecases/get_chats_list.dart';
import 'package:chatter/feature/Chats%20List/domain/usecases/search_at_user.dart';
import 'package:equatable/equatable.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetChatsList getChatsList;
  final SearchAtUser searchAtUser;
  late StreamSubscription _netWorkSub;
  StreamSubscription? _chatSub;
  final NetworkChecker networkChecker;
  final String currentUserId;
  List<ChatListItemEntity>? _lastChatList;
  // List<ChatListItemEntity>? get lastChatList => _lastChatList;
  bool _hasMeaingfulChange(
    List<ChatListItemEntity> newChatList,
    List<ChatListItemEntity> oldChatList,
  ) {
    if (newChatList.length != oldChatList.length) return true;
    for (int i = 0; i < oldChatList.length; i++) {
      if (newChatList[i].chatId != oldChatList[i].chatId) return true;
      if (oldChatList[i].lastMessage != newChatList[i].lastMessage ||
          oldChatList[i].lastMessageTime != newChatList[i].lastMessageTime ||
          oldChatList[i].messageStatusEnum !=
              newChatList[i].messageStatusEnum) {
        return true;
      }
    }
    return false;
  }

  ChatListBloc(
    this.getChatsList,
    this.searchAtUser,
    this.networkChecker, {
    required this.currentUserId,
  }) : super(ChatListInitial()) {
    _netWorkSub = networkChecker.onStatusChange.listen((event) {
      if (event == NetworkState.online) {
        add(FetchChatListEvent(userId: currentUserId));
      }
    });
    on<FetchChatListEvent>((event, emit) async {
      await _chatSub?.cancel();
      emit(ChatListLoading());
      _chatSub = getChatsList(event.userId).listen((either) {
        either.fold((failure) => emit(ChatListError()), (chatList) {
          if (_lastChatList != null ||
              _hasMeaingfulChange(chatList, _lastChatList!)) {
            _lastChatList = chatList;
            emit(ChatListLoaded(chatList));
          }
        });
      });
    });
    on<SearchChatListEvent>((event, emit) async {
      emit(ChatListLoading());
      final results = await searchAtUser(event.query);
      results.fold(
        (failure) => emit(ChatListError()),
        (searchResults) => emit(ChatListSearchResults(searchResults)),
      );
    });
  }
}
