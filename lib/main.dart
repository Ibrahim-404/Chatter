import 'package:chatter/core/routes/routes_setting.dart';
import 'package:chatter/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['appLinkUrl']!,
    anonKey: dotenv.env['supabaseAnonKey']!,
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Chatter());
}

class Chatter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatter',
      home: SplashScreen(),
      onGenerateRoute: RoutesSettings.generateRoute,
    );
  }
}
