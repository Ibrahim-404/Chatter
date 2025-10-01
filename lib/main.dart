import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['appLinkUrl']!,
    anonKey: dotenv.env['supabaseAnonKey']!,
  );
  runApp(Chatter());
}

class Chatter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Chatter', home: Text('Hello World'));
  }
}
