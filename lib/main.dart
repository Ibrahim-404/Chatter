import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://sndhminpxmbwrfjztllc.supabase.co',
    anonKey:
        '<prefer publishable key instead of anon key for mobile and desktop apps>',
  );
  runApp(Chatter());
}

class Chatter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Chatter', home:Text('Hello World') );
  }
}
