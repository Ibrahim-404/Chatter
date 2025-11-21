import 'package:chatter/feature/Chats%20List/presentation/UI/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(DevPreview());
}

class DevPreview extends StatelessWidget {
  const DevPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
