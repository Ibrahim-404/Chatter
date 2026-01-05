import 'package:chatter/feature/User%20Profile/ui/Screens/User_Profile.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String phoneNumber;

  const UserProfilePage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: UserProfile(phoneNumber: phoneNumber));
  }
}
