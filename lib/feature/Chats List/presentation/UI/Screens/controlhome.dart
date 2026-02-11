import 'package:chatter/feature/Chats%20List/presentation/UI/Screens/home.dart';
import 'package:chatter/feature/Chats%20List/presentation/manager/chat%20list%20conroller/bloc/chat_list_bloc.dart';
import 'package:chatter/feature/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Controlhome extends StatelessWidget {
  const Controlhome({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid; 
    return Scaffold( 
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>sl<ChatListBloc>(param1: userId!)),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
