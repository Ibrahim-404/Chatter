import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_user_list_event.dart';
part 'get_user_list_state.dart';

class GetUserListBloc extends Bloc<GetUserListEvent, GetUserListState> {
  GetUserListBloc() : super(GetUserListInitial()) {
    on<GetUserListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
