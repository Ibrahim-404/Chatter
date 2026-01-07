import 'package:chatter/feature/User%20Profile/presentation/controllers/profile_picture_bloc/bloc/profile_picture_bloc.dart';
import 'package:chatter/feature/User%20Profile/presentation/controllers/user_profile_bloc/bloc/mange_user_profile_bloc.dart';
import 'package:chatter/feature/User%20Profile/ui/Screens/User_Profile.dart';
import 'package:chatter/feature/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  final String phoneNumber;

  const UserProfilePage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MangeUserProfileBloc(sl(), sl(), sl())),
        BlocProvider(create: (_) => ProfilePictureBloc(sl())),
      ],
      child: Scaffold(body: UserProfile(phoneNumber: phoneNumber)),
    );
  }
}
