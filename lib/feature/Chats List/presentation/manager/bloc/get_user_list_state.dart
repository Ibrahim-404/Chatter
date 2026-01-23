part of 'get_user_list_bloc.dart';

sealed class GetUserListState extends Equatable {
  const GetUserListState();
  
  @override
  List<Object> get props => [];
}

final class GetUserListInitial extends GetUserListState {}
